within ExtremumSeeking.Controllers.Discrete;
block discrete_ES_ADV "Discrete implementation of ES with first order filters"
  extends Modelica.Blocks.Interfaces.DiscreteBlock;

  Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-200,-20},{-160,20}}), iconTransformation(extent={{-140,-20},
            {-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{140,-10},{160,10}}),  iconTransformation(extent={{100,-10},
            {120,10}})));
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
  parameter Modelica.SIunits.Frequency f_cutoff_BPF = probe_frequency "Cut-off frequency of BPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Frequency f_cutoff_LPF = 0.1 * probe_frequency "Cut-off frequency of LPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Real max_control = 10e30 "Maximal control signal (including probe signal)"
  annotation (Dialog(group="Advanced settings"));
  parameter Real min_control = -max_control "Minimum control signal (including probe signal)"
  annotation (Dialog(group="Advanced settings"));

  Support.DiscreteLimIntegrator discreteLimIntegrator(
    samplePeriod=Ts,
    max_control=max_control - probe_peak_amplitude,
    min_control=min_control + probe_peak_amplitude)
    annotation (Placement(transformation(extent={{42,-10},{62,10}})));
protected
  parameter Real Ts = samplePeriod;
  parameter Real wHPF = 2*pi*f_cutoff_BPF "Angular frequency for HPF of BPF";
  parameter Real hd = -1 + Ts*wHPF;
  parameter Real wLPF = 2*pi*f_cutoff_BPF "Angular frequency for LPFof BPF";
  parameter Real ld = -1 + Ts*wLPF;
  parameter Real wLPF_2 = 2*pi*f_cutoff_LPF "Angular frequency for LPF_2";
  parameter Real ld_2 = -1 + Ts*wLPF_2;

  Modelica.Blocks.Discrete.TransferFunction HPF(
    b={1,-1},
    a={1,hd},
    samplePeriod=Ts)
    annotation (Placement(transformation(extent={{-152,-10},{-132,10}})));
  Modelica.Blocks.Math.Product Demodulation
    annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
  Modelica.Blocks.Discrete.TransferFunction LPF_2(
    b={1+ld_2},
    a={1,ld_2},
    samplePeriod=Ts)
    annotation (Placement(transformation(extent={{-28,-10},{-8,10}})));
  Modelica.Blocks.Sources.Sine Demodulation_Sine(freqHz=probe_frequency, amplitude=2/probe_peak_amplitude,
    phase= phase_shift + delay_compensation)
    annotation (Placement(transformation(extent={{-98,-46},{-78,-26}})));
  Modelica.Blocks.Math.Add Modulation
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Blocks.Sources.Sine Modulation_Sine(freqHz=probe_frequency, amplitude=probe_peak_amplitude,
    phase= phase_shift)
    annotation (Placement(transformation(extent={{38,-46},{58,-26}})));
  Modelica.Blocks.Discrete.Sampler sampler(samplePeriod=Ts)
    annotation (Placement(transformation(extent={{112,-10},{132,10}})));
  Modelica.Blocks.Math.Gain gain(k=-integrator_gain*Ts)
    annotation (Placement(transformation(extent={{4,-10},{24,10}})));
  Modelica.Blocks.Discrete.TransferFunction LPF(
    b={1+ld},
    a={1,ld},
    samplePeriod=Ts)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-112,0})));
  Modelica.Blocks.Math.Gain comp_gain(k=2)
    annotation (Placement(transformation(extent={{-92,-8},{-76,8}})));
equation
  connect(Demodulation.y, LPF_2.u)
    annotation (Line(points={{-35,0},{-30,0}}, color={0,0,127}));
  connect(Demodulation.u2,Demodulation_Sine. y) annotation (Line(points={{-58,-6},
          {-66,-6},{-66,-36},{-77,-36}},     color={0,0,127}));
  connect(Modulation.u2,Modulation_Sine. y) annotation (Line(points={{78,-6},{
          72,-6},{72,-36},{59,-36}}, color={0,0,127}));
  connect(Modulation.y, sampler.u)
    annotation (Line(points={{101,0},{110,0}}, color={0,0,127}));
  connect(sampler.y, y)
    annotation (Line(points={{133,0},{150,0}}, color={0,0,127}));
  connect(u, HPF.u)
    annotation (Line(points={{-180,0},{-154,0}}, color={0,0,127}));
  connect(gain.u, LPF_2.y)
    annotation (Line(points={{2,0},{-7,0}}, color={0,0,127}));
  connect(HPF.y, LPF.u)
    annotation (Line(points={{-131,0},{-124,0}},color={0,0,127}));
  connect(LPF.y, comp_gain.u)
    annotation (Line(points={{-101,0},{-93.6,0}}, color={0,0,127}));
  connect(comp_gain.y, Demodulation.u1) annotation (Line(points={{-75.2,0},{-66,
          0},{-66,6},{-58,6}}, color={0,0,127}));
  connect(gain.y, discreteLimIntegrator.u)
    annotation (Line(points={{25,0},{40,0}}, color={0,0,127}));
  connect(discreteLimIntegrator.y, Modulation.u1) annotation (Line(points={{63,0},{
          70,0},{70,6},{78,6}},     color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-160,-100},{140,100}}),
        graphics={              Rectangle(extent={{-158,18},{-70,-16}},
            lineColor={28,108,200}), Text(
          extent={{-146,28},{-82,20}},
          lineColor={28,108,200},
          textString="Bandpass Filter")}),                               Icon(
        coordinateSystem(extent={{-160,-100},{140,100}})));
end discrete_ES_ADV;
