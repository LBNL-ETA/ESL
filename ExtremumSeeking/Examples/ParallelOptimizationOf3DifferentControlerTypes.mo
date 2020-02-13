within ExtremumSeeking.Examples;
model ParallelOptimizationOf3DifferentControlerTypes
  ExtremumSeeking.Objective_functions.Quadratic_objective_function
    quadratic_objective_function2
    annotation (Placement(transformation(extent={{-22,42},{-2,62}})));
  Modelica.Blocks.Sources.Constant Target_ES(k=1)
    annotation (Placement(transformation(extent={{-58,50},{-38,70}})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function
    quadratic_objective_function1(y(start=5))
    annotation (Placement(transformation(extent={{-22,16},{-2,36}})));
  Modelica.Blocks.Sources.Constant Target_ES_SFS(k=2)
    annotation (Placement(transformation(extent={{-58,20},{-38,40}})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function
    quadratic_objective_function3
    annotation (Placement(transformation(extent={{-22,-14},{-2,6}})));
  Modelica.Blocks.Sources.Constant Target_ES_MFS(k=3)
    annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
  Modelica.Blocks.Math.Add3 add3
    annotation (Placement(transformation(extent={{50,16},{70,36}})));
  Controllers.Discrete.discrete_ES_SFS                 discrete_ES_SFS(
    samplePeriod=0.01,
    probe_frequency=1.1,
    T_update=2,
    n_samples=200,
    discreteLimIntegrator(zeroOrderHold(ySample(start=1))))
    annotation (Placement(transformation(extent={{2,18},{36,34}})));
  Controllers.Discrete.discrete_ES_ADV                   discrete_ES_ADV(
    samplePeriod=0.01,
    integrator_gain=0.05,
    max_control=2,
    min_control=-1)
    annotation (Placement(transformation(extent={{4,42},{34,62}})));
  Controllers.Discrete.discrete_ES_MFS                 discrete_ES_MFS(
    samplePeriod=0.01,
    probe_frequency=1.2,
    control_gain=0.5,
    T_update=5,
    n_samples=500,
    discreteLimIntegrator(zeroOrderHold(ySample(start=2))))
    annotation (Placement(transformation(extent={{-2,-12},{34,4}})));
equation
  connect(Target_ES_MFS.y, quadratic_objective_function3.Target) annotation (
      Line(points={{-37,0},{-24,0}},                     color={0,0,127}));
  connect(discrete_ES_SFS.y, add3.u2)
    annotation (Line(points={{31,26},{48,26}}, color={0,0,127}));
  connect(discrete_ES_ADV.y, add3.u1) annotation (Line(points={{31,52},{40,52},
          {40,34},{48,34}}, color={0,0,127}));
  connect(discrete_ES_MFS.y, add3.u3) annotation (Line(points={{31,-4},{40,-4},
          {40,18},{48,18}}, color={0,0,127}));
  connect(quadratic_objective_function3.y, discrete_ES_MFS.u)
    annotation (Line(points={{0,-4},{8,-4}}, color={0,0,127}));
  connect(quadratic_objective_function1.y, discrete_ES_SFS.u)
    annotation (Line(points={{0,26},{8,26}}, color={0,0,127}));
  connect(quadratic_objective_function2.y, discrete_ES_ADV.u)
    annotation (Line(points={{0,52},{8,52}}, color={0,0,127}));
  connect(Target_ES_SFS.y, quadratic_objective_function1.Target)
    annotation (Line(points={{-37,30},{-24,30}}, color={0,0,127}));
  connect(Target_ES.y, quadratic_objective_function2.Target) annotation (Line(
        points={{-37,60},{-30,60},{-30,56},{-24,56}}, color={0,0,127}));
  connect(add3.y, quadratic_objective_function3.u) annotation (Line(points={{71,
          26},{74,26},{74,-18},{-30,-18},{-30,-4},{-24,-4}}, color={0,0,127}));
  connect(quadratic_objective_function1.u, quadratic_objective_function3.u)
    annotation (Line(points={{-24,26},{-30,26},{-30,-4},{-24,-4}}, color={0,0,
          127}));
  connect(quadratic_objective_function2.u, quadratic_objective_function3.u)
    annotation (Line(points={{-24,52},{-30,52},{-30,-4},{-24,-4}}, color={0,0,
          127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100));
end ParallelOptimizationOf3DifferentControlerTypes;
