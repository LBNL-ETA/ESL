within ExtremumSeeking.Support;
model Round
  parameter Real round_to = 1 "Set to the difference between 2 numbers it will round to.";
  Modelica.Blocks.Math.RealToInteger realToInteger
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Math.IntegerToReal integerToReal
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Gain gain(k=1/round_to)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Math.Gain gain1(k=round_to)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(realToInteger.y, integerToReal.u)
    annotation (Line(points={{-9,0},{8,0}}, color={255,127,0}));
  connect(u, gain.u)
    annotation (Line(points={{-120,0},{-62,0}}, color={0,0,127}));
  connect(gain.y, realToInteger.u)
    annotation (Line(points={{-39,0},{-32,0}}, color={0,0,127}));
  connect(integerToReal.y, gain1.u)
    annotation (Line(points={{31,0},{38,0}}, color={0,0,127}));
  connect(gain1.y, y)
    annotation (Line(points={{61,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Round;
