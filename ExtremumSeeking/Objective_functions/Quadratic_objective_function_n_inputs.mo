within ExtremumSeeking.Objective_functions;
model Quadratic_objective_function_n_inputs
  parameter Integer nin = 1;
  Modelica.Blocks.Interfaces.RealInput Inputs[nin]
    annotation (Placement(transformation(extent={{-140,2},{-100,42}})));
  Modelica.Blocks.Interfaces.RealInput Targets[nin]
    annotation (Placement(transformation(extent={{-140,48},{-100,88}}),
        iconTransformation(extent={{-140,48},{-100,88}})));

  Modelica.Blocks.Interfaces.RealOutput obj_fn annotation (Placement(
        transformation(rotation=0, extent={{100,-20},{140,20}})));
protected
  Real y_tmp[nin];
equation
  for i in 1:nin loop
    y_tmp[i] = (Inputs[i] - Targets[i])^2;
  end for;

  obj_fn = sum(y_tmp);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Quadratic_objective_function_n_inputs;
