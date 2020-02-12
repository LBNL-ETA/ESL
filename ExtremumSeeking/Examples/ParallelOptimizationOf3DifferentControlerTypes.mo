within ExtremumSeeking.Examples;
model ParallelOptimizationOf3DifferentControlerTypes
  Controllers.Discrete.discrete_ES_ADV                   discrete_ES_ADV(
    samplePeriod=0.01,
    integrator_gain=0.05,
    max_control=2,
    min_control=-1)
    annotation (Placement(transformation(extent={{6,54},{-24,74}})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function
    quadratic_objective_function2
    annotation (Placement(transformation(extent={{-20,80},{0,100}})));
  Modelica.Blocks.Sources.Constant OptimalValue1(k=1)
    annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function
    quadratic_objective_function1(y(start=5))
    annotation (Placement(transformation(extent={{-20,32},{0,52}})));
  Modelica.Blocks.Sources.Constant OptimalValue2(k=2)
    annotation (Placement(transformation(extent={{-60,32},{-40,52}})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function
    quadratic_objective_function3
    annotation (Placement(transformation(extent={{-20,-16},{0,4}})));
  Modelica.Blocks.Sources.Constant OptimalValue3(k=3)
    annotation (Placement(transformation(extent={{-60,-16},{-40,4}})));
  ExtremumSeeking.Controllers.Discrete.discrete_ES_SFS discrete_ES_SFS(
    samplePeriod=0.01,
      probe_frequency=1.1,
    T_update=2,
    n_samples=200,         discreteLimIntegrator(zeroOrderHold(ySample(start=1))))
    annotation (Placement(transformation(extent={{8,8},{-26,24}})));
  ExtremumSeeking.Controllers.Discrete.discrete_ES_MFS discrete_ES_MFS(
    samplePeriod=0.01,
      probe_frequency=1.2,
    control_gain=0.5,
    T_update=5,
    n_samples=500,         discreteLimIntegrator(zeroOrderHold(ySample(start=2))))
    annotation (Placement(transformation(extent={{12,-40},{-24,-24}})));
  Modelica.Blocks.Math.Add3 add3
    annotation (Placement(transformation(extent={{18,32},{38,52}})));
equation
  connect(OptimalValue1.y, quadratic_objective_function2.Target) annotation (
      Line(points={{-39,90},{-34,90},{-34,94},{-22,94}}, color={0,0,127}));
  connect(discrete_ES_ADV.y, quadratic_objective_function2.u) annotation (Line(
        points={{-21,64},{-30.8235,64},{-30.8235,90},{-22,90}}, color={0,0,127}));
  connect(OptimalValue2.y, quadratic_objective_function1.Target) annotation (
      Line(points={{-39,42},{-34,42},{-34,46},{-22,46}}, color={0,0,127}));
  connect(OptimalValue3.y, quadratic_objective_function3.Target) annotation (
      Line(points={{-39,-6},{-34,-6},{-34,-2},{-22,-2}}, color={0,0,127}));
  connect(discrete_ES_SFS.y, quadratic_objective_function1.u) annotation (Line(
        points={{-21,16},{-30,16},{-30,42},{-22,42}}, color={0,0,127}));
  connect(discrete_ES_MFS.y, quadratic_objective_function3.u) annotation (Line(
        points={{-21,-32},{-30,-32},{-30,-6},{-22,-6}}, color={0,0,127}));
  connect(quadratic_objective_function1.y, add3.u2)
    annotation (Line(points={{2,42},{16,42}}, color={0,0,127}));
  connect(quadratic_objective_function3.y, add3.u3) annotation (Line(points={{2,
          -6},{12,-6},{12,34},{16,34}}, color={0,0,127}));
  connect(quadratic_objective_function2.y, add3.u1) annotation (Line(points={{2,
          90},{12,90},{12,50},{16,50}}, color={0,0,127}));
  connect(add3.y, discrete_ES_ADV.u) annotation (Line(points={{39,42},{42,42},{
          42,64},{2,64}}, color={0,0,127}));
  connect(discrete_ES_SFS.u, discrete_ES_ADV.u)
    annotation (Line(points={{2,16},{42,16},{42,64},{2,64}}, color={0,0,127}));
  connect(discrete_ES_MFS.u, discrete_ES_ADV.u) annotation (Line(points={{2,-32},
          {42,-32},{42,64},{2,64}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100));
end ParallelOptimizationOf3DifferentControlerTypes;
