within ExtremumSeeking.Controllers.Discrete;
block discrete_ES_BASIC "Basic discrete implementation of ES with first order filters"
  extends Modelica.Blocks.Interfaces.DiscreteBlock;

  Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-180,-20},{-140,20}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{200,-10},{220,10}})));
  import Modelica.Constants.pi;
  parameter Real probe_peak_amplitude = 0.1 "Peak amplitude of Probe"
  annotation (Dialog(group="Basic settings"));
  parameter Modelica.SIunits.Frequency probe_frequency = 1 "Frequency of probe"
  annotation (Dialog(group="Basic settings"));
  parameter Real integrator_gain = 0.1 "Gain of integrator"
  annotation (Dialog(group="Basic settings"));
  parameter Modelica.SIunits.Angle phase_shift(displayUnit="rad") = 0 "Phase shift of the ES"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Angle delay_compensation(displayUnit="rad") = 0  "Phase shift for compensating measurement delays"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Frequency f_cutoff_HPF = 0.1 * probe_frequency "Cut-off frequency of HPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Frequency f_cutoff_LPF = 0.1 * probe_frequency "Cut-off frequency of LPF"
  annotation (Dialog(group="Advanced settings"));

protected
  parameter Real Ts = samplePeriod;
  parameter Real wHPF = 2*pi*f_cutoff_HPF "Angular frequency for HPF";
  parameter Real hd = -1 + Ts*wHPF;
  parameter Real wLPF = 2*pi*f_cutoff_LPF "Angular frequency for LPF";
  parameter Real ld = -1 + Ts*wLPF;
  Modelica.Blocks.Discrete.TransferFunction HPF(
    b={1,-1},
    a={1,hd},
    samplePeriod=Ts)
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Math.Product Demodulation
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Discrete.TransferFunction LPF(
    b={1+ld},
    a={1,ld},
    samplePeriod=Ts)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Sources.Sine Demodulation_Sine(freqHz=probe_frequency, amplitude=2/probe_peak_amplitude,
    phase= phase_shift + delay_compensation)
    annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
  Modelica.Blocks.Math.Add Modulation
    annotation (Placement(transformation(extent={{120,-10},{140,10}})));
  Modelica.Blocks.Sources.Sine Modulation_Sine(amplitude=probe_peak_amplitude, freqHz=
        probe_frequency,
    phase=phase_shift)
    annotation (Placement(transformation(extent={{80,-60},{100,-40}})));
  Modelica.Blocks.Discrete.Sampler sampler(samplePeriod=Ts)
    annotation (Placement(transformation(extent={{160,-10},{180,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Math.Gain gain(k=-integrator_gain*Ts)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Discrete.ZeroOrderHold zeroOrderHold(samplePeriod=Ts)
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
equation
  connect(Demodulation.y, LPF.u)
    annotation (Line(points={{-59,0},{-42,0}}, color={0,0,127}));
  connect(Demodulation.u2,Demodulation_Sine.y) annotation (Line(points={{-82,-6},
          {-88,-6},{-88,-30},{-99,-30}},     color={0,0,127}));
  connect(Modulation.u2,Modulation_Sine.y) annotation (Line(points={{118,-6},{
          110,-6},{110,-50},{101,-50}},
                                     color={0,0,127}));
  connect(Modulation.y, sampler.u)
    annotation (Line(points={{141,0},{158,0}}, color={0,0,127}));
  connect(sampler.y, y)
    annotation (Line(points={{181,0},{210,0}}, color={0,0,127}));
  connect(u, HPF.u)
    annotation (Line(points={{-160,0},{-122,0}}, color={0,0,127}));
  connect(gain.u, LPF.y)
    annotation (Line(points={{-2,0},{-19,0}},
                                            color={0,0,127}));
  connect(add.y, zeroOrderHold.u)
    annotation (Line(points={{61,0},{78,0}}, color={0,0,127}));
  connect(gain.y, add.u2)
    annotation (Line(points={{21,0},{34,0},{34,-6},{38,-6}}, color={0,0,127}));
  connect(zeroOrderHold.y, Modulation.u1) annotation (Line(points={{101,0},{104,
          0},{104,6},{118,6}}, color={0,0,127}));
  connect(HPF.y, Demodulation.u1) annotation (Line(points={{-99,0},{-88,0},{-88,
          6},{-82,6}}, color={0,0,127}));
  connect(add.u1, Modulation.u1) annotation (Line(points={{38,6},{34,6},{34,16},
          {104,16},{104,6},{118,6}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{200,100}}),
        graphics={
        Rectangle(
          extent={{30,22},{106,-18}},
          lineColor={0,140,72},
          pattern=LinePattern.Dash,
          lineThickness=1),          Text(
          extent={{4,32},{130,24}},
          lineColor={0,140,72},
          textString="Integrator")}),                                    Icon(
        coordinateSystem(extent={{-140,-100},{200,100}})));
end discrete_ES_BASIC;
