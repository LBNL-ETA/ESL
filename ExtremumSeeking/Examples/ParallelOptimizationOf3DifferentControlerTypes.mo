within ExtremumSeeking.Examples;
model ParallelOptimizationOf3DifferentControlerTypes
  Modelica.Blocks.Sources.Constant Target_ES(k=1)
    annotation (Placement(transformation(extent={{-54,56},{-34,76}})));
  Modelica.Blocks.Sources.Constant Target_ES_SFS(k=2)
    annotation (Placement(transformation(extent={{-54,26},{-34,46}})));
  Modelica.Blocks.Sources.Constant Target_ES_MFS(k=3)
    annotation (Placement(transformation(extent={{-54,-4},{-34,16}})));
  Modelica.Blocks.Math.Add3 add3
    annotation (Placement(transformation(extent={{54,10},{74,30}})));
  Controllers.Discrete.discrete_ES_ADV                   discrete_ES_ADV(
    samplePeriod=0.01,
    integrator_gain=0.05,
    max_control=2,
    min_control=-1)
    annotation (Placement(transformation(extent={{-26,40},{4,60}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function2
    annotation (Placement(transformation(extent={{14,40},{34,60}})));
  Controllers.Discrete.discrete_ES_SFS                 discrete_ES_SFS(
    samplePeriod=0.01,
    probe_frequency=1.1,
    T_update=2,
    n_samples=200,
    discreteLimIntegrator(zeroOrderHold(ySample(start=1))))
    annotation (Placement(transformation(extent={{-28,12},{6,28}})));
  Controllers.Discrete.discrete_ES_MFS                 discrete_ES_MFS(
    samplePeriod=0.01,
    probe_frequency=1.2,
    control_gain=0.5,
    T_update=5,
    n_samples=500,
    discreteLimIntegrator(zeroOrderHold(ySample(start=2))))
    annotation (Placement(transformation(extent={{-32,-18},{4,-2}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function1(y(start=5))
    annotation (Placement(transformation(extent={{14,10},{34,30}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function3
    annotation (Placement(transformation(extent={{14,-20},{34,0}})));
equation
  connect(quadratic_objective_function1.y, add3.u2)
    annotation (Line(points={{36,20},{52,20}}, color={0,0,127}));
  connect(quadratic_objective_function3.y, add3.u3) annotation (Line(points={{
          36,-10},{44,-10},{44,12},{52,12}}, color={0,0,127}));
  connect(quadratic_objective_function2.y, add3.u1) annotation (Line(points={{
          36,50},{44,50},{44,28},{52,28}}, color={0,0,127}));
  connect(discrete_ES_SFS.y, quadratic_objective_function1.u)
    annotation (Line(points={{1,20},{12,20}}, color={0,0,127}));
  connect(discrete_ES_ADV.y, quadratic_objective_function2.u)
    annotation (Line(points={{1,50},{12,50}}, color={0,0,127}));
  connect(discrete_ES_MFS.y, quadratic_objective_function3.u)
    annotation (Line(points={{1,-10},{12,-10}}, color={0,0,127}));
  connect(Target_ES.y, quadratic_objective_function2.Target) annotation (Line(
        points={{-33,66},{6,66},{6,54},{12,54}}, color={0,0,127}));
  connect(Target_ES_SFS.y, quadratic_objective_function1.Target) annotation (
      Line(points={{-33,36},{6,36},{6,24},{12,24}}, color={0,0,127}));
  connect(Target_ES_MFS.y, quadratic_objective_function3.Target)
    annotation (Line(points={{-33,6},{8,6},{8,-6},{12,-6}}, color={0,0,127}));
  connect(add3.y, discrete_ES_MFS.u) annotation (Line(points={{75,20},{80,20},{
          80,-24},{-28,-24},{-28,-10},{-22,-10}}, color={0,0,127}));
  connect(discrete_ES_SFS.u, discrete_ES_MFS.u) annotation (Line(points={{-22,
          20},{-28,20},{-28,-10},{-22,-10}}, color={0,0,127}));
  connect(discrete_ES_ADV.u, discrete_ES_MFS.u) annotation (Line(points={{-22,
          50},{-28,50},{-28,-10},{-22,-10}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100));
end ParallelOptimizationOf3DifferentControlerTypes;
