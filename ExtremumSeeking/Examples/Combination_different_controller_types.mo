within ExtremumSeeking.Examples;
model Combination_different_controller_types
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant OptimalValue(k=1)
    annotation (Placement(transformation(extent={{-56,6},{-36,26}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function1
    annotation (Placement(transformation(extent={{14,-44},{34,-24}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function3
    annotation (Placement(transformation(extent={{14,-10},{34,10}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function4
    annotation (Placement(transformation(extent={{14,24},{34,44}})));
  Controllers.Continuous.ES_BASIC eS_BASIC
    annotation (Placement(transformation(extent={{-18,24},{2,44}})));
  Controllers.Discrete.discrete_ES_SFS discrete_ES_SFS(
    samplePeriod=0.1,
    T_update=2,
    n_samples=50)
    annotation (Placement(transformation(extent={{-26,-8},{8,8}})));
  Controllers.Discrete.discrete_ES_MFS discrete_ES_MFS(
    samplePeriod=0.1,
    control_gain=0.375,
    T_update=5,
    n_samples=50)
    annotation (Placement(transformation(extent={{-30,-42},{6,-26}})));
equation
  connect(quadratic_objective_function3.Target, OptimalValue.y)
    annotation (Line(points={{12,4},{8,4},{8,16},{-35,16}}, color={0,0,127}));
  connect(quadratic_objective_function4.Target, OptimalValue.y) annotation (
      Line(points={{12,38},{8,38},{8,46},{-28,46},{-28,16},{-35,16}}, color={0,
          0,127}));
  connect(eS_BASIC.y, quadratic_objective_function4.u)
    annotation (Line(points={{3,34},{12,34}}, color={0,0,127}));
  connect(quadratic_objective_function4.y, eS_BASIC.u) annotation (Line(points=
          {{36,34},{42,34},{42,22},{-26,22},{-26,34},{-20,34}}, color={0,0,127}));
  connect(discrete_ES_SFS.y, quadratic_objective_function3.u)
    annotation (Line(points={{3,0},{12,0}}, color={0,0,127}));
  connect(quadratic_objective_function3.y, discrete_ES_SFS.u) annotation (Line(
        points={{36,0},{42,0},{42,-14},{-24,-14},{-24,0},{-20,0}}, color={0,0,
          127}));
  connect(discrete_ES_MFS.y, quadratic_objective_function1.u)
    annotation (Line(points={{3,-34},{12,-34}}, color={0,0,127}));
  connect(quadratic_objective_function1.y, discrete_ES_MFS.u) annotation (Line(
        points={{36,-34},{42,-34},{42,-46},{-26,-46},{-26,-34},{-20,-34}},
        color={0,0,127}));
  connect(quadratic_objective_function1.Target, OptimalValue.y) annotation (
      Line(points={{12,-30},{8,-30},{8,-18},{-28,-18},{-28,16},{-35,16}}, color=
         {0,0,127}));
  annotation (experiment(StopTime=100));
end Combination_different_controller_types;
