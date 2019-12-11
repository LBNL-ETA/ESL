within ExtremumSeeking.Objective_functions;
model RangeRegulation_objective_function_n_inputs
  parameter Integer nin = 1;
  parameter Real umax = 1.05;
  parameter Real umin = 0.95;
  Modelica.Blocks.Interfaces.RealInput Inputs[nin]
    annotation (Placement(transformation(extent={{-140,2},{-100,42}})));

  Modelica.Blocks.Interfaces.RealOutput obj_fn annotation (Placement(
        transformation(rotation=0, extent={{100,-20},{140,20}})));
protected
  Real y_tmp[nin];
equation
  for i in 1:nin loop
    y_tmp[i] = (max(Inputs[i]^2-umax^2,0))^2 + (min(Inputs[i]^2-umin^2,0))^2;
  end for;

  obj_fn = sum(y_tmp);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end RangeRegulation_objective_function_n_inputs;
