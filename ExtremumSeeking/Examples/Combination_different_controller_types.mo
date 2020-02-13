within ExtremumSeeking.Examples;
model Combination_different_controller_types
  extends Modelica.Icons.Example;
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function1
    annotation (Placement(transformation(extent={{14,-44},{34,-24}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function3
    annotation (Placement(transformation(extent={{14,-10},{34,10}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function4
    annotation (Placement(transformation(extent={{14,24},{34,44}})));
  Controllers.Continuous.ES_ADV ES
    annotation (Placement(transformation(extent={{-18,24},{2,44}})));
  Controllers.Discrete.discrete_ES_SFS discrete_ES_SFS(
    samplePeriod=0.1,
    T_update=2,
    n_samples=50,
     discreteLimIntegrator(zeroOrderHold(ySample(start=1))))
    annotation (Placement(transformation(extent={{-26,-8},{8,8}})));
  Controllers.Discrete.discrete_ES_MFS discrete_ES_MFS(
    samplePeriod=0.1,
    control_gain=0.375,
    T_update=5,
    n_samples=50,
     discreteLimIntegrator(zeroOrderHold(ySample(start=2))))
    annotation (Placement(transformation(extent={{-30,-42},{6,-26}})));
  Modelica.Blocks.Sources.Constant Target_ES_CONT(k=1)
    annotation (Placement(transformation(extent={{-56,24},{-36,44}})));
  Modelica.Blocks.Sources.Constant Target_ES_SFS(k=2)
    annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
  Modelica.Blocks.Sources.Constant Target_ES_MFS(k=3)
    annotation (Placement(transformation(extent={{-56,-44},{-36,-24}})));
equation
  connect(ES.y, quadratic_objective_function4.u)
    annotation (Line(points={{3,34},{12,34}}, color={0,0,127}));
  connect(quadratic_objective_function4.y, ES.u) annotation (Line(points={{36,
          34},{40,34},{40,22},{-24,22},{-24,34},{-20,34}}, color={0,0,127}));
  connect(discrete_ES_SFS.y, quadratic_objective_function3.u)
    annotation (Line(points={{3,0},{12,0}}, color={0,0,127}));
  connect(quadratic_objective_function3.y, discrete_ES_SFS.u) annotation (Line(
        points={{36,0},{38,0},{38,-12},{-24,-12},{-24,0},{-20,0}}, color={0,0,
          127}));
  connect(discrete_ES_MFS.y, quadratic_objective_function1.u)
    annotation (Line(points={{3,-34},{12,-34}}, color={0,0,127}));
  connect(quadratic_objective_function1.y, discrete_ES_MFS.u) annotation (Line(
        points={{36,-34},{40,-34},{40,-46},{-24,-46},{-24,-34},{-20,-34}},
        color={0,0,127}));
  connect(Target_ES_SFS.y, quadratic_objective_function3.Target) annotation (
      Line(points={{-35,0},{-28,0},{-28,18},{8,18},{8,4},{12,4}}, color={0,0,
          127}));
  connect(Target_ES_CONT.y, quadratic_objective_function4.Target) annotation (
      Line(points={{-35,34},{-28,34},{-28,46},{6,46},{6,38},{12,38}}, color={0,
          0,127}));
  connect(Target_ES_MFS.y, quadratic_objective_function1.Target) annotation (
      Line(points={{-35,-34},{-28,-34},{-28,-18},{6,-18},{6,-30},{12,-30}},
        color={0,0,127}));
  annotation (experiment(StopTime=60));
end Combination_different_controller_types;
