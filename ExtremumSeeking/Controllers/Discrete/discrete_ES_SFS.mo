within ExtremumSeeking.Controllers.Discrete;
block discrete_ES_SFS
  extends Modelica.Blocks.Interfaces.DiscreteBlock;

  Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-220,-20},{-180,20}}), iconTransformation(extent={{-140,-20},
            {-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{160,-10},{180,10}}),  iconTransformation(extent={{100,-10},
            {120,10}})));
  import Modelica.Constants.pi;


  parameter Modelica.SIunits.Frequency probe_frequency = 1 "Frequency of probe"
  annotation (Dialog(group="Basic settings"));
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
  parameter Real abs_mean_threshold = 0 "Threshold of mean for changing objective function input"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Period T_update = 10 "Length of time the mean is calculated for"
  annotation (Dialog(group="Basic settings"));
  parameter Integer n_samples = 100 "Amount of sample periods for calculating the mean"
    annotation (Dialog(group="Basic settings"));
  parameter Real max_control = 10e30 "Maximal control signal (including probe signal)"
  annotation (Dialog(group="Advanced settings"));
  parameter Real min_control = -max_control "Minimum control signal (including probe signal)"
  annotation (Dialog(group="Advanced settings"));

  Support.DiscreteLimIntegrator discreteLimIntegrator(samplePeriod=T_update,
    max_control=max_control - probe_peak_amplitude,
    min_control=min_control + probe_peak_amplitude)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
protected
    parameter Real probe_peak_amplitude = probe_increment * control_increment;
    parameter Real setpoint_update = update_increment * control_increment;
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
        origin={-110,0})));

  Modelica.Blocks.Math.Gain gain(k=-setpoint_update)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Blocks.Math.Add Modulate annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={110,0})));
  Signals.Sign_of_sine                        Probe_Signal(
    peak_amplitude=probe_peak_amplitude,
    frequency=probe_frequency,
    phase_shift=phase_shift)
    annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Signals.Sign_of_sine                        Demodulation_signal(
    peak_amplitude=1/probe_peak_amplitude,
    frequency=probe_frequency,
    phase_shift=phase_shift + delay_compensation)
    annotation (Placement(transformation(extent={{-160,-40},{-140,-20}})));
  Modelica.Blocks.Discrete.TransferFunction HPF(
    b={1,-1},
    a={1,hd},
    samplePeriod=Ts,
    y(start=0))            annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-150,0})));
  Modelica.Blocks.Discrete.TransferFunction LPF(
    b={1+ld},
    a={1,ld},
    samplePeriod=Ts,
    y(start=0))
            annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-80,0})));
  ExtremumSeeking.Support.Convergence_switch convergence_switch
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Discrete.TransferFunction AO(
    b=mean_numerator,
    samplePeriod=Ts,
    y(start=0),
    a=mean_denominator) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-50,0})));
  Modelica.Blocks.Discrete.Sampler sampler_mean(samplePeriod=T_update)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Discrete.Sampler sampler_output(samplePeriod=Ts)
    annotation (Placement(transformation(extent={{130,-10},{150,10}})));

initial algorithm
   // calculate filter parameters
  for i in 1:n_samples loop
    // poles of MEAN
    mean_numerator[i] := 1/n_samples;
    mean_denominator[i] := 0;
  end for;
    mean_denominator[1] := 1;
equation
  connect(convergence_switch.u, sampler_mean.y)
    annotation (Line(points={{-2,0},{-9,0}},     color={0,0,127}));
  connect(HPF.y, Demodulate.u1) annotation (Line(points={{-139,-8.88178e-16},{-134,
          -8.88178e-16},{-134,0},{-130,0},{-130,6},{-122,6}},
                                            color={0,0,127}));
  connect(Demodulate.u2, Demodulation_signal.y) annotation (Line(points={{-122,-6},
          {-130,-6},{-130,-30},{-139,-30}}, color={0,0,127}));
  connect(convergence_switch.y, gain.u)
    annotation (Line(points={{21,0},{28,0}},   color={0,0,127}));
  connect(Modulate.y, sampler_output.u) annotation (Line(points={{121,-8.88178e-16},
          {128,-8.88178e-16},{128,0}},               color={0,0,127}));
  connect(HPF.u, u)
    annotation (Line(points={{-162,0},{-200,0}}, color={0,0,127}));
  connect(Probe_Signal.y, Modulate.u2) annotation (Line(points={{81,-30},{90,-30},
          {90,-6},{98,-6}},        color={0,0,127}));
  connect(gain.y, discreteLimIntegrator.u)
    annotation (Line(points={{51,0},{58,0}}, color={0,0,127}));
  connect(sampler_output.y, y)
    annotation (Line(points={{151,0},{170,0}}, color={0,0,127}));
  connect(discreteLimIntegrator.y, Modulate.u1)
    annotation (Line(points={{81,0},{90,0},{90,6},{98,6}}, color={0,0,127}));
  connect(AO.y, sampler_mean.u)
    annotation (Line(points={{-39,0},{-32,0}}, color={0,0,127}));
  connect(LPF.y, AO.u)
    annotation (Line(points={{-69,0},{-62,0}}, color={0,0,127}));
  connect(Demodulate.y, LPF.u)
    annotation (Line(points={{-99,0},{-92,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-180,-80},{160,80}}),  graphics={
        Text(
          extent={{-164,-42},{-138,-46}},
          lineColor={0,0,255},
          textString="Demodulation
Signal",  fontSize=8,
          fontName="Arial"),
        Text(
          extent={{56,-44},{82,-48}},
          lineColor={0,0,255},
          textString="Probe
Signal",  fontSize=8),
        Text(
          extent={{-4,16},{22,12}},
          lineColor={0,0,255},
          fontSize=8,
          fontName="Arial",
          textString="Convergence
Switch with Sign")}),                                                   Icon(
        coordinateSystem(extent={{-180,-80},{160,80}})));
end discrete_ES_SFS;
