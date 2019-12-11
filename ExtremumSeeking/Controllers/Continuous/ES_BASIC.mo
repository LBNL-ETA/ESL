within ExtremumSeeking.Controllers.Continuous;
model ES_BASIC
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
  parameter Integer order_HPF = 1 "Order of HPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Frequency f_cutoff_HPF = 0.1 * probe_frequency "Cut-off frequency of HPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Real integrator_gain = 0.1 "Gain of integrator"
  annotation (Dialog(group="Basic settings"));

  Modelica.Blocks.Math.Add Modulate(k2=+1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,0})));
  Modelica.Blocks.Sources.Sine Probe(amplitude=probe_peak_amplitude, freqHz=
        probe_frequency,
    phase=phase_shift)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,-50})));
  Modelica.Blocks.Math.Product Demodulate annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-40,0})));
  Modelica.Blocks.Sources.Sine DemodulationSignal(             freqHz=
        probe_frequency, amplitude=2/probe_peak_amplitude,
    phase(displayUnit="rad") = phase_shift + delay_compensation)
                         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-80,-50})));
  Modelica.Blocks.Continuous.LowpassButterworth LPF_2(
    f=f_cutoff_LPF,
    n=order_LPF,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Continuous.Filter HPF(
    analogFilter=Modelica.Blocks.Types.AnalogFilter.Butterworth,
    filterType=Modelica.Blocks.Types.FilterType.HighPass,
    f_cut=f_cutoff_HPF,
    order=order_HPF) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,0})));
  Modelica.Blocks.Continuous.Integrator Integrator(y_start=0, k=-
        integrator_gain)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          rotation=0, extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},
            {120,10}})));
equation
  connect(Demodulate.y, LPF_2.u)
    annotation (Line(points={{-29,0},{-12,0}}, color={0,0,127}));
  connect(u, HPF.u)
    annotation (Line(points={{-120,0},{-92,0}},       color={0,0,127}));
  connect(y, Modulate.y)
    annotation (Line(points={{110,0},{91,0}},             color={0,0,127}));
  connect(Probe.y, Modulate.u2)
    annotation (Line(points={{51,-50},{60,-50},{60,-6},{68,-6}},
                                                 color={0,0,127}));
  connect(DemodulationSignal.y, Demodulate.u2) annotation (Line(points={{-69,-50},
          {-56,-50},{-56,-6},{-52,-6}},        color={0,0,127}));
  connect(HPF.y, Demodulate.u1) annotation (Line(points={{-69,0},{-64,0},{-64,6},
          {-52,6}}, color={0,0,127}));
  connect(LPF_2.y, Integrator.u)
    annotation (Line(points={{11,0},{28,0}},  color={0,0,127}));
  connect(Integrator.y, Modulate.u1)
    annotation (Line(points={{51,0},{60,0},{60,6},{68,6}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-140,-100},{100,100}})));
end ES_BASIC;
