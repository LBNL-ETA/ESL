within ExtremumSeeking.Controllers.Continuous;
model ES_ADV
  Modelica.Blocks.Continuous.LowpassButterworth LPF_2(
    f=f_cutoff_LPF,
    n=order_LPF,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
  parameter Real probe_peak_amplitude = 0.1 "Peak amplitude of Probe"
  annotation (Dialog(group="Basic settings"));
  parameter Modelica.SIunits.Frequency probe_frequency = 1 "Frequency of probe"
  annotation (Dialog(group="Basic settings"));
  parameter Modelica.SIunits.Angle phase_shift(displayUnit="rad") = 0 "Phase shift of the ES"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Angle delay_compensation(displayUnit="rad") = 0  "Phase shift for compensating measurement delays"
  annotation (Dialog(group="Advanced settings"));
  parameter Integer order_LPF = 1 "Order of LPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Frequency f_cutoff_LPF = 0.1 * probe_frequency "Cut-off frequency of LPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Boolean BP_on = true "Activate BPF (when false only HPF)"
  annotation (Dialog(group="Advanced settings"));
  parameter Integer order_BPF = 1 "Order of BPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Frequency f_cutoff_BPF = probe_frequency "Cut-off frequency of BPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Real integrator_gain = 0.1 "Gain of integrator"
  annotation (Dialog(group="Basic settings"));
  parameter Boolean averaging = false "Activate averaging of gradient estimate"
  annotation (Dialog(group="Advanced settings"));
  parameter Real max_control = 10e30 "Maximal control signal (including probe signal)"
  annotation (Dialog(group="Advanced settings"));
  parameter Real min_control = -max_control "Minimum control signal (including probe signal)"
  annotation (Dialog(group="Advanced settings"));
  Modelica.Blocks.Math.Add Modulate(k2=+1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={122,0})));
  Modelica.Blocks.Sources.Sine Probe(amplitude=probe_peak_amplitude, freqHz=
        probe_frequency,
    phase=phase_shift)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,-30})));
  Modelica.Blocks.Math.Product Demodulate annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-60,0})));
  Modelica.Blocks.Sources.Sine DemodulationSignal(             freqHz=
        probe_frequency, amplitude=2/probe_peak_amplitude,
    phase(displayUnit="rad") = phase_shift + delay_compensation)
                         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-90,-30})));
  Modelica.Blocks.Continuous.Filter HPF(
    analogFilter=Modelica.Blocks.Types.AnalogFilter.Butterworth,
    filterType=Modelica.Blocks.Types.FilterType.HighPass,
    f_cut=f_cutoff_BPF,
    order=order_BPF,
    gain=2)          annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-162,0})));
  Modelica.Blocks.Continuous.Integrator Integrator(y_start=0, k=-
        integrator_gain)
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          rotation=0, extent={{-220,-20},{-180,20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          rotation=0, extent={{140,-10},{160,10}}), iconTransformation(extent={{140,-10},
            {160,10}})));
  Modelica.Blocks.Logical.Switch switch
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Sources.BooleanConstant AO_flag(k=averaging)
    annotation (Placement(transformation(extent={{-12,-46},{8,-26}})));
  Modelica.Blocks.Math.Mean mean(f=probe_frequency)
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  Modelica.Blocks.Nonlinear.Limiter Setpoint_limiter(uMax=max_control -
        probe_peak_amplitude, uMin=min_control + probe_peak_amplitude)
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Blocks.Continuous.LowpassButterworth LPF(
    f=f_cutoff_BPF,
    n=order_BPF,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-142,-10},{-122,10}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Sources.BooleanConstant BP_flag(k=BP_on)
    annotation (Placement(transformation(extent={{-140,-46},{-120,-26}})));
equation
  connect(Demodulate.y, LPF_2.u)
    annotation (Line(points={{-49,-8.88178e-16},{-44,-8.88178e-16},{-44,0},{-46,
          0}},                                 color={0,0,127}));
  connect(u, HPF.u)
    annotation (Line(points={{-200,0},{-174,0}},      color={0,0,127}));
  connect(y, Modulate.y)
    annotation (Line(points={{150,0},{133,0}},            color={0,0,127}));
  connect(Probe.y, Modulate.u2)
    annotation (Line(points={{101,-30},{106,-30},{106,-6},{110,-6}},
                                                 color={0,0,127}));
  connect(DemodulationSignal.y, Demodulate.u2) annotation (Line(points={{-79,-30},
          {-76,-30},{-76,-6},{-72,-6}},        color={0,0,127}));
  connect(AO_flag.y, switch.u2)
    annotation (Line(points={{9,-36},{14,-36},{14,0},{18,0}},
                                             color={255,0,255}));
  connect(switch.y, Integrator.u)
    annotation (Line(points={{41,0},{48,0}}, color={0,0,127}));
  connect(LPF_2.y, mean.u) annotation (Line(points={{-23,0},{-14,0}},
                     color={0,0,127}));
  connect(switch.u3, mean.u) annotation (Line(points={{18,-8},{12,-8},{12,-16},
          {-18,-16},{-18,0},{-14,0}},
                         color={0,0,127}));
  connect(Integrator.y, Setpoint_limiter.u)
    annotation (Line(points={{71,0},{78,0}}, color={0,0,127}));
  connect(Setpoint_limiter.y, Modulate.u1) annotation (Line(points={{101,0},{
          106,0},{106,6},{110,6}}, color={0,0,127}));
  connect(HPF.y, LPF.u)
    annotation (Line(points={{-151,0},{-144,0}}, color={0,0,127}));
  connect(mean.y, switch.u1)
    annotation (Line(points={{9,0},{12,0},{12,8},{18,8}}, color={0,0,127}));
  connect(LPF.y, switch1.u1) annotation (Line(points={{-121,0},{-112,0},{-112,8},
          {-102,8}}, color={0,0,127}));
  connect(Demodulate.u1, switch1.y) annotation (Line(points={{-72,6},{-76,6},{-76,
          0},{-79,0}}, color={0,0,127}));
  connect(BP_flag.y, switch1.u2) annotation (Line(points={{-119,-36},{-110,-36},
          {-110,0},{-102,0}}, color={255,0,255}));
  connect(switch1.u3, HPF.y) annotation (Line(points={{-102,-8},{-108,-8},{-108,
          -18},{-148,-18},{-148,0},{-151,0}},
                                     color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-180,-100},{140,100}}),
        graphics={              Rectangle(extent={{-178,16},{-118,-16}},
            lineColor={28,108,200}), Text(
          extent={{-182,24},{-118,16}},
          lineColor={28,108,200},
          textString="Bandpass Filter")}),                               Icon(
        coordinateSystem(extent={{-180,-100},{140,100}})));
end ES_ADV;
