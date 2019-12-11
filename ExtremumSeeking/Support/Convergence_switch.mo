within ExtremumSeeking.Support;
model Convergence_switch
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={40,30})));
  parameter Real abs_mean_threshold = 0.05 "Threshold of mean for changing objective function input";
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          rotation=0, extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(
        transformation(rotation=0, extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.Switch switch
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=-
        abs_mean_threshold)
    annotation (Placement(transformation(extent={{-46,20},{-26,40}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold(threshold=
        abs_mean_threshold)
    annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  Modelica.Blocks.Math.Sign sign
    annotation (Placement(transformation(extent={{-46,-42},{-26,-22}})));
equation
  connect(switch.y, y)
    annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
  connect(const.y, switch.u1)
    annotation (Line(points={{40,19},{40,8},{58,8}}, color={0,0,127}));
  connect(and1.y, switch.u2)
    annotation (Line(points={{21,0},{58,0}}, color={255,0,255}));
  connect(greaterThreshold.y, and1.u1) annotation (Line(points={{-25,30},{-8,30},
          {-8,0},{-2,0}}, color={255,0,255}));
  connect(lessThreshold.y, and1.u2) annotation (Line(points={{-25,0},{-14,0},{
          -14,-8},{-2,-8}}, color={255,0,255}));
  connect(sign.y, switch.u3) annotation (Line(points={{-25,-32},{40,-32},{40,-8},
          {58,-8}}, color={0,0,127}));
  connect(u, greaterThreshold.u) annotation (Line(points={{-120,0},{-84,0},{-84,
          30},{-48,30}}, color={0,0,127}));
  connect(lessThreshold.u, u)
    annotation (Line(points={{-48,0},{-120,0}}, color={0,0,127}));
  connect(sign.u, greaterThreshold.u) annotation (Line(points={{-48,-32},{-84,
          -32},{-84,30},{-48,30}}, color={0,0,127}));
end Convergence_switch;
