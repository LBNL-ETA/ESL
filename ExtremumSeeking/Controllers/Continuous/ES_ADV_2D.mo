within ExtremumSeeking.Controllers.Continuous;
model ES_ADV_2D
  import Modelica.Constants.pi;
  parameter Real prob_amplitude_1 = 0.1 "Peak amplitude of Probe"
  annotation (Dialog(group="Basic settings"));
  parameter Real integrator_gain_1 = 0.1 "Gain of integrator"
  annotation (Dialog(group="Basic settings"));
  parameter Real prob_amplitude_2 = 0.1 "Peak amplitude of Probe"
  annotation (Dialog(group="Basic settings"));
  parameter Real integrator_gain_2 = 0.1 "Gain of integrator"
  annotation (Dialog(group="Basic settings"));
  parameter Modelica.SIunits.Frequency probe_frequency = 1 "Frequency of probe"
  annotation (Dialog(group="Basic settings"));
  parameter Modelica.SIunits.Angle delay_compensation(displayUnit="rad") = 0  "Phase shift for compensating measurement delays"
  annotation (Dialog(group="Advanced settings"));
  parameter Integer order_LPF = 1 "Order of LPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Frequency f_cutoff_LPF = 0.1 * probe_frequency "Cut-off frequency of LPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Integer order_BPF = 1 "Order of HPF and LPF in the BPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Modelica.SIunits.Frequency f_cutoff_BPF = probe_frequency "Cut-off frequency of HPF"
  annotation (Dialog(group="Advanced settings"));
  parameter Real max_control_1 = 10e30 "Maximal control signal (including probe signal)"
  annotation (Dialog(group="Advanced settings"));
  parameter Real min_control_1 = -10e30 "Minimum control signal (including probe signal)"
  annotation (Dialog(group="Advanced settings"));
  parameter Real max_control_2 = 10e30 "Maximal control signal (including probe signal)"
  annotation (Dialog(group="Advanced settings"));
  parameter Real min_control_2 = -10e30 "Minimum control signal (including probe signal)"
  annotation (Dialog(group="Advanced settings"));
  ExtremumSeeking.Controllers.Continuous.ES_ADV ES_2(
    probe_peak_amplitude=prob_amplitude_2,
    probe_frequency=probe_frequency,
    phase_shift=pi/2,
    delay_compensation=delay_compensation,
    order_LPF=order_LPF,
    f_cutoff_LPF=f_cutoff_LPF,
    order_BPF=order_BPF,
    f_cutoff_BPF=f_cutoff_BPF,
    integrator_gain=integrator_gain_2,
    max_control=max_control_2,
    min_control=min_control_2)
    annotation (Placement(transformation(extent={{0,-50},{20,-30}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput y1
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  ExtremumSeeking.Controllers.Continuous.ES_ADV ES_1(
    probe_peak_amplitude=prob_amplitude_1,
    probe_frequency=probe_frequency,
    phase_shift=0,
    delay_compensation=delay_compensation,
    order_LPF=order_LPF,
    f_cutoff_LPF=f_cutoff_LPF,
    order_BPF=order_BPF,
    f_cutoff_BPF=f_cutoff_BPF,
    integrator_gain=integrator_gain_1,
    max_control=max_control_1,
    min_control=min_control_1)
    annotation (Placement(transformation(extent={{0,30},{20,50}})));
equation
  connect(ES_1.u, u) annotation (Line(points={{-1.25,40},{-58,40},{-58,0},{-120,
          0}}, color={0,0,127}));
  connect(ES_2.u, u) annotation (Line(points={{-1.25,-40},{-58,-40},{-58,0},{
          -120,0}},
               color={0,0,127}));
  connect(ES_1.y, y)
    annotation (Line(points={{20.625,40},{110,40}},  color={0,0,127}));
  connect(ES_2.y, y1)
    annotation (Line(points={{20.625,-40},{110,-40}},  color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ES_ADV_2D;
