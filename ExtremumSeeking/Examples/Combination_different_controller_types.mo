within ExtremumSeeking.Examples;
model Combination_different_controller_types
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant const2(k=3)
    annotation (Placement(transformation(extent={{-12,74},{0,86}})));
  Controllers.Continuous.ES_BASIC eS_BASIC(
    probe_peak_amplitude=0.1,
    probe_frequency=1,
    integrator_gain=0.1)
    annotation (Placement(transformation(extent={{-28,40},{0,60}})));
  Controllers.Discrete.discrete_ES_BASIC discrete_ES_BASIC(
    samplePeriod=0.05,
    probe_peak_amplitude=0.1,
    probe_frequency=1,
    integrator_gain=0.1)
    annotation (Placement(transformation(extent={{-36,0},{-2,20}})));
  Controllers.Discrete.discrete_ES_SFS discrete_ES_SFS(
    samplePeriod=0.05,
    probe_frequency=1,
    control_increment=0.1,
    T_update=10,
    n_samples=200)
    annotation (Placement(transformation(extent={{-34,-38},{0,-22}})));
  Controllers.Discrete.discrete_ES_MFS discrete_ES_MFS(
    samplePeriod=0.05,
    probe_frequency=1,
    control_gain=1,
    control_increment=0.1,
    T_update=10,
    n_samples=200)
    annotation (Placement(transformation(extent={{-36,-78},{0,-62}})));
  Objective_functions.Quadratic_objective_function quadratic_objective_function
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function1
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function3
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function4
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
equation
  connect(eS_BASIC.y, quadratic_objective_function.u)
    annotation (Line(points={{1.16667,50},{18,50}},
                                              color={0,0,127}));
  connect(const2.y, quadratic_objective_function.Target) annotation (Line(
        points={{0.6,80},{10,80},{10,54},{18,54}}, color={0,0,127}));
  connect(discrete_ES_BASIC.y, quadratic_objective_function4.u)
    annotation (Line(points={{-1,10},{18,10}},color={0,0,127}));
  connect(discrete_ES_SFS.y, quadratic_objective_function3.u)
    annotation (Line(points={{1,-30},{18,-30}}, color={0,0,127}));
  connect(discrete_ES_MFS.y, quadratic_objective_function1.u)
    annotation (Line(points={{1,-70},{18,-70}}, color={0,0,127}));
  connect(quadratic_objective_function1.Target, const2.y) annotation (Line(
        points={{18,-66},{10,-66},{10,80},{0.6,80}}, color={0,0,127}));
  connect(quadratic_objective_function3.Target, const2.y) annotation (Line(
        points={{18,-26},{10,-26},{10,80},{0.6,80}}, color={0,0,127}));
  connect(quadratic_objective_function4.Target, const2.y) annotation (Line(
        points={{18,14},{10,14},{10,80},{0.6,80}}, color={0,0,127}));
  connect(quadratic_objective_function.y, eS_BASIC.u) annotation (Line(points={{42,50},
          {48,50},{48,32},{-38,32},{-38,50},{-25.6667,50}},    color={0,0,127}));
  connect(quadratic_objective_function4.y, discrete_ES_BASIC.u) annotation (
      Line(points={{42,10},{46,10},{46,-6},{-46,-6},{-46,10},{-38,10}}, color={
          0,0,127}));
  connect(quadratic_objective_function3.y, discrete_ES_SFS.u) annotation (Line(
        points={{42,-30},{44,-30},{44,-46},{-36,-46},{-36,-30}}, color={0,0,127}));
  connect(quadratic_objective_function1.y, discrete_ES_MFS.u) annotation (Line(
        points={{42,-70},{44,-70},{44,-88},{-46,-88},{-46,-70},{-38,-70}},
        color={0,0,127}));
  annotation (experiment(StopTime=100));
end Combination_different_controller_types;
