within ExtremumSeeking.Objective_functions;
model Quadratic_objective_function_2_inputs

  Modelica.Blocks.Math.Add Add1(k1=-1)
    annotation (Placement(transformation(extent={{-32,-64},{-12,-44}})));
  Modelica.Blocks.Math.Product Square1
    annotation (Placement(transformation(extent={{0,-64},{20,-44}})));
  Modelica.Blocks.Math.Add Add2(k1=-1, k2=+1)
    annotation (Placement(transformation(extent={{-32,44},{-12,64}})));
  Modelica.Blocks.Math.Add Objective
    annotation (Placement(transformation(extent={{36,-10},{56,10}})));
  Modelica.Blocks.Interfaces.RealInput u_2 annotation (Placement(
        transformation(rotation=0, extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(
        transformation(rotation=0, extent={{100,-20},{140,20}})));
  Modelica.Blocks.Interfaces.RealInput u_1
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Math.Product Square2
    annotation (Placement(transformation(extent={{0,44},{20,64}})));
  Modelica.Blocks.Interfaces.RealInput Target_2 annotation (Placement(
        transformation(rotation=0, extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput Target_1 annotation (Placement(
        transformation(rotation=0, extent={{-140,-40},{-100,0}})));
equation
  connect(Add1.y, Square1.u1) annotation (Line(points={{-11,-54},{-6,-54},{-6,
          -48},{-2,-48}}, color={0,0,127}));
  connect(Add1.y, Square1.u2) annotation (Line(points={{-11,-54},{-6,-54},{-6,
          -60},{-2,-60}}, color={0,0,127}));
  connect(Square1.y, Objective.u2) annotation (Line(points={{21,-54},{26,-54},
          {26,-6},{34,-6}}, color={0,0,127}));
  connect(y, Objective.y)
    annotation (Line(points={{120,0},{57,0}}, color={0,0,127}));
  connect(u_1, Add1.u2)
    annotation (Line(points={{-120,-60},{-34,-60}}, color={0,0,127}));
  connect(Add2.y, Square2.u1) annotation (Line(points={{-11,54},{-6,54},{-6,
          60},{-2,60}}, color={0,0,127}));
  connect(Add2.y, Square2.u2) annotation (Line(points={{-11,54},{-6,54},{-6,
          48},{-2,48}}, color={0,0,127}));
  connect(Square2.y, Objective.u1) annotation (Line(points={{21,54},{26,54},{
          26,6},{34,6}}, color={0,0,127}));
  connect(Add2.u2, u_2) annotation (Line(points={{-34,48},{-68,48},{-68,40},{-120,
          40}}, color={0,0,127}));
  connect(Add2.u1, Target_2) annotation (Line(points={{-34,60},{-68,60},{-68,80},
          {-120,80}}, color={0,0,127}));
  connect(Target_1, Add1.u1) annotation (Line(points={{-120,-20},{-78,-20},{-78,
          -48},{-34,-48}}, color={0,0,127}));
end Quadratic_objective_function_2_inputs;
