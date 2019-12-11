within ExtremumSeeking.Controllers.Discrete;
model discrete_ES_MFS
  extends Modelica.Blocks.Interfaces.DiscreteBlock;

  Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-260,-20},{-220,20}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{140,-10},{160,10}})));
  import Modelica.Constants.pi;
  parameter Modelica.SIunits.Frequency probe_frequency = 1 "Frequency of probe"
  annotation (Dialog(group="Basic settings"));
  parameter Real control_gain = 1 "controller gain" annotation(Dialog(group="Basic settings"));
  parameter Integer probe_increment = 1 "Number of increments in probe amplitude"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Angle phase_shift(displayUnit="rad") = 0 "Phase shift of the ES"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Angle delay_compensation(displayUnit="rad") = 0  "Phase shift for compensating measurement delays"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Frequency f_cutoff_LPF = 0.1 * probe_frequency "Cut-off frequency of LPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Frequency f_cutoff_HPF = 0.1 * probe_frequency "Cut-off frequency of HPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Real control_increment = 0.1 "Size of increment for control output (smallest step size)"
  annotation (Dialog(group="Basic settings"));
  parameter Integer update_increment = 1  "Number of increments in each setpoint update" annotation(Dialog(group="Advanced settings"));
  parameter Integer max_update_increment = 10  "Max. number of increments in each setpoint update" annotation(Dialog(group="Advanced settings"));

  parameter Modelica.SIunits.Period T_update = 10 "Length of time the mean is calculated for"
  annotation (Dialog(group="Basic settings"));
  parameter Integer n_samples = 100 "Amount of sample periods for calculating the mean"
    annotation (Dialog(group="Basic settings"));
  parameter Real max_control = 10e30 "Maximal control signal (including probe signal)"
  annotation (Dialog(group="Advanced settings"));
  parameter Real min_control = -max_control "Minimum control signal (including probe signal)"
  annotation (Dialog(group="Advanced settings"));

protected
    parameter Real probe_peak_amplitude = probe_increment * control_increment;
    parameter Real setpoint_update = update_increment * control_increment;
    parameter Real max_setpoint_update = max_update_increment * control_increment;
    parameter Real Ts = samplePeriod;
    parameter Real wHPF = 2*pi*f_cutoff_HPF "Angular frequency for HPF of BPF";
    parameter Real hd = -1 + Ts*wHPF;
    parameter Real wLPF = 2*pi*f_cutoff_LPF "Angular frequency for LPF_2";
    parameter Real ld = -1 + Ts*wLPF;
    parameter Real mean_numerator[n_samples](fixed=false);
    parameter Real mean_denominator[n_samples](fixed=false);

  Modelica.Blocks.Math.Product Demodulate annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-160,0})));
  Modelica.Blocks.Math.Add Modulate annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,0})));
  Signals.Sign_of_sine                        Probe_Signal(
    peak_amplitude=probe_peak_amplitude,
    frequency=probe_frequency,
    phase_shift=phase_shift)
    annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  Signals.Sign_of_sine                        Demodulation_signal(
    peak_amplitude=1/probe_peak_amplitude,
    frequency=probe_frequency,
    phase_shift=phase_shift + delay_compensation)
    annotation (Placement(transformation(extent={{-212,-40},{-192,-20}})));
  Modelica.Blocks.Discrete.TransferFunction HPF(
    b={1,-1},
    a={1,hd},
    samplePeriod=Ts)       annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-200,0})));
  Modelica.Blocks.Discrete.TransferFunction LPF(
    b={1+ld},
    samplePeriod=Ts,
    y(start=0),
    a={1,ld})       annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-130,0})));
  Modelica.Blocks.Math.Gain gain(k=-control_gain) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-40,0})));
  ExtremumSeeking.Support.Round round(round_to=setpoint_update)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Nonlinear.Limiter LimiterChange(uMax=
        max_setpoint_update, uMin=-max_setpoint_update) annotation (
     Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={20,0})));
  Modelica.Blocks.Discrete.TransferFunction MEAN(
    b=mean_numerator,
    samplePeriod=Ts,
    y(start=0),
    a=mean_denominator) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-100,0})));
  Modelica.Blocks.Discrete.Sampler sampler_mean(samplePeriod=T_update)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Discrete.Sampler sampler_output(samplePeriod=Ts)
    annotation (Placement(transformation(extent={{110,-10},{130,10}})));
  Support.DiscreteLimIntegrator discreteLimIntegrator(
    samplePeriod=T_update,
    max_control=max_control - probe_peak_amplitude,
    min_control=min_control + probe_peak_amplitude)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
initial algorithm
   // calculate filter parameters
  for i in 1:n_samples loop
    // poles of MEAN
    mean_numerator[i] := 1/n_samples;
    mean_denominator[i] := 0;
  end for;
    mean_denominator[1] := 1;

equation
  connect(HPF.y, Demodulate.u1) annotation (Line(points={{-189,-8.88178e-16},{
          -180,-8.88178e-16},{-180,6},{-172,6}}, color={0,0,127}));
  connect(Demodulate.u2, Demodulation_signal.y) annotation (Line(points={{-172,-6},
          {-180,-6},{-180,-30},{-191,-30}},     color={0,0,127}));
  connect(Demodulate.y, LPF.u) annotation (Line(points={{-149,-8.88178e-16},{
          -142,-8.88178e-16},{-142,0}},          color={0,0,127}));
  connect(LPF.y, MEAN.u) annotation (Line(points={{-119,-8.88178e-16},{-107.5,-8.88178e-16},
          {-107.5,1.9984e-15},{-112,1.9984e-15}}, color={0,0,127}));
  connect(MEAN.y, sampler_mean.u) annotation (Line(points={{-89,-8.88178e-16},{
          -81.5,-8.88178e-16},{-81.5,0},{-82,0}}, color={0,0,127}));
  connect(sampler_mean.y, gain.u)
    annotation (Line(points={{-59,0},{-52,0}}, color={0,0,127}));
  connect(gain.y, round.u)
    annotation (Line(points={{-29,0},{-22,0}}, color={0,0,127}));
  connect(round.y, LimiterChange.u) annotation (Line(points={{1,0},{2.5,0},{2.5,
          1.9984e-15},{8,1.9984e-15}},       color={0,0,127}));
  connect(Probe_Signal.y, Modulate.u2) annotation (Line(points={{61,-30},{70,
          -30},{70,-6},{78,-6}},   color={0,0,127}));
  connect(Modulate.y, sampler_output.u)
    annotation (Line(points={{101,0},{108,0}}, color={0,0,127}));
  connect(u, HPF.u) annotation (Line(points={{-240,0},{-224,0},{-224,1.9984e-15},
          {-212,1.9984e-15}}, color={0,0,127}));
  connect(LimiterChange.y, discreteLimIntegrator.u) annotation (Line(points={{
          31,-8.88178e-16},{34,-8.88178e-16},{34,0},{38,0}}, color={0,0,127}));
  connect(discreteLimIntegrator.y, Modulate.u1)
    annotation (Line(points={{61,0},{70,0},{70,6},{78,6}}, color={0,0,127}));
  connect(sampler_output.y, y)
    annotation (Line(points={{131,0},{150,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-220,-80},{140,80}}),
        graphics={
        Text(
          extent={{-212,-14},{-192,-18}},
          lineColor={0,0,255},
          textString="Demodulation
Signal",  fontSize=8,
          fontName="Arial"),
        Text(
          extent={{34,-44},{60,-48}},
          lineColor={0,0,255},
          textString="Probe
Signal",  fontSize=8)}),                                                 Icon(
        coordinateSystem(extent={{-220,-80},{140,80}})));
end discrete_ES_MFS;
