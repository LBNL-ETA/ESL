within ExtremumSeeking.Examples;
model Combination_different_controller_types
  extends Modelica.Icons.Example;
  Controllers.Continuous.ES_ADV ES
    annotation (Placement(transformation(extent={{6,20},{26,40}})));
  Controllers.Discrete.discrete_ES_SFS discrete_ES_SFS(
    samplePeriod=0.1,
    T_update=2,
    n_samples=50,
     discreteLimIntegrator(zeroOrderHold(ySample(start=1))))
    annotation (Placement(transformation(extent={{-2,-8},{32,8}})));
  Modelica.Blocks.Sources.Constant Target_ES_CONT(k=1)
    annotation (Placement(transformation(extent={{-56,24},{-36,44}})));
  Modelica.Blocks.Sources.Constant Target_ES_SFS(k=1)
    annotation (Placement(transformation(extent={{-56,-6},{-36,14}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function3
    annotation (Placement(transformation(extent={{-24,-10},{-4,10}})));
  Controllers.Discrete.discrete_ES_MFS discrete_ES_MFS(
    samplePeriod=0.1,
    control_gain=0.375,
    T_update=5,
    n_samples=50,
    discreteLimIntegrator(zeroOrderHold(ySample(start=2))))
    annotation (Placement(transformation(extent={{-6,-38},{30,-22}})));
  Modelica.Blocks.Sources.Constant Target_ES_MFS(k=1)
    annotation (Placement(transformation(extent={{-56,-36},{-36,-16}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function1
    annotation (Placement(transformation(extent={{-24,-40},{-4,-20}})));
  Objective_functions.Quadratic_objective_function
    quadratic_objective_function4
    annotation (Placement(transformation(extent={{-24,20},{-4,40}})));
equation
  connect(quadratic_objective_function3.y, discrete_ES_SFS.u)
    annotation (Line(points={{-2,0},{4,0}}, color={0,0,127}));
  connect(Target_ES_SFS.y, quadratic_objective_function3.Target)
    annotation (Line(points={{-35,4},{-26,4}}, color={0,0,127}));
  connect(discrete_ES_SFS.y, quadratic_objective_function3.u) annotation (Line(
        points={{27,0},{32,0},{32,-12},{-32,-12},{-32,0},{-26,0}}, color={0,0,
          127}));
  connect(Target_ES_MFS.y, quadratic_objective_function1.Target)
    annotation (Line(points={{-35,-26},{-26,-26}}, color={0,0,127}));
  connect(quadratic_objective_function1.y, discrete_ES_MFS.u)
    annotation (Line(points={{-2,-30},{4,-30}}, color={0,0,127}));
  connect(discrete_ES_MFS.y, quadratic_objective_function1.u) annotation (Line(
        points={{27,-30},{32,-30},{32,-42},{-32,-42},{-32,-30},{-26,-30}},
        color={0,0,127}));
  connect(Target_ES_CONT.y, quadratic_objective_function4.Target)
    annotation (Line(points={{-35,34},{-26,34}}, color={0,0,127}));
  connect(quadratic_objective_function4.y, ES.u)
    annotation (Line(points={{-2,30},{4,30}}, color={0,0,127}));
  connect(ES.y, quadratic_objective_function4.u) annotation (Line(points={{27,
          30},{32,30},{32,18},{-32,18},{-32,30},{-26,30}}, color={0,0,127}));
  annotation (experiment(StopTime=60));
end Combination_different_controller_types;
