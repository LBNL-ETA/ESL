within ExtremumSeeking.Objective_functions;
model Quadratic_objective_function

  Modelica.Blocks.Math.Add Add1(k1=-1)
    annotation (Placement(transformation(extent={{-32,-4},{-12,16}})));
  Modelica.Blocks.Math.Product Objective
    annotation (Placement(transformation(extent={{0,-4},{20,16}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(
        transformation(rotation=0, extent={{100,-20},{140,20}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput Target
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
equation
  connect(Add1.y, Objective.u1) annotation (Line(points={{-11,6},{-6,6},{-6,12},
          {-2,12}}, color={0,0,127}));
  connect(Add1.y, Objective.u2)
    annotation (Line(points={{-11,6},{-6,6},{-6,0},{-2,0}}, color={0,0,127}));
  connect(u, Add1.u2)
    annotation (Line(points={{-120,0},{-34,0}},     color={0,0,127}));
  connect(Objective.y, y)
    annotation (Line(points={{21,6},{64,6},{64,0},{120,0}}, color={0,0,127}));
  connect(Add1.u1, Target) annotation (Line(points={{-34,12},{-60,12},{-60,40},{
          -120,40}}, color={0,0,127}));
end Quadratic_objective_function;
