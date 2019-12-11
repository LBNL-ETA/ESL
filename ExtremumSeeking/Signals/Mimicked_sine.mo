within ExtremumSeeking.Signals;
model Mimicked_sine
  parameter Real probe_peak_amplitude = 1;
  parameter Modelica.SIunits.Frequency probe_frequency = 1;
  parameter Real step_size = 0.1 "Size of steps";
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Sources.Sine
       sine(amplitude=probe_peak_amplitude, freqHz=probe_frequency)
    annotation (Placement(transformation(extent={{-34,-10},{-14,10}})));
  Support.Round round(round_to=step_size)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
equation
  connect(round.y, y)
    annotation (Line(points={{21,0},{110,0}}, color={0,0,127}));
  connect(sine.y, round.u)
    annotation (Line(points={{-13,0},{-2,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Mimicked_sine;
