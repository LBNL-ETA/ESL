within ExtremumSeeking.Examples.MechanicalExamples;
model RollingWheel "Demonstrate coupling Rotational - Translational"
  extends Modelica.Icons.Example;
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealRollingWheel(radius=1)
    annotation (Placement(transformation(extent={{-6,-22},{14,-2}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(
    phi(fixed=true, start=0),
    w(fixed=true, start=0),
    J=1) annotation (Placement(transformation(extent={{-36,-22},{-16,-2}})));
  Modelica.Mechanics.Translational.Components.Mass mass(L=0, m=1)
    annotation (Placement(transformation(extent={{24,-22},{44,-2}})));
  Modelica.Mechanics.Translational.Sources.QuadraticSpeedDependentForce quadraticSpeedDependentForce(
    f_nominal=-10,
    ForceDirection=false,
    v_nominal=5)
    annotation (Placement(transformation(extent={{76,-22},{56,-2}})));
  Modelica.Blocks.Sources.Constant Target_type2(k=1)
    annotation (Placement(transformation(extent={{20,24},{0,44}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-64,-22},{-44,-2}})));
  Controllers.Discrete.discrete_ES_MFS                         ES_type2(
    control_gain=0.2,
    control_increment=0.05,
    probe_frequency=0.05,
    max_control=10000,
    min_control=0)
    annotation (Placement(transformation(extent={{-46,2},{-66,22}})));
  Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor_type2
    annotation (Placement(transformation(extent={{20,2},{0,22}})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function quad_obj_func_type2
    annotation (Placement(transformation(extent={{-16,2},{-36,22}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealRollingWheel1(radius=1)
    annotation (Placement(transformation(extent={{-8,-102},{12,-82}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(
    phi(fixed=true, start=0),
    w(fixed=true, start=0),
    J=1) annotation (Placement(transformation(extent={{-38,-102},{-18,-82}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(L=0, m=1)
    annotation (Placement(transformation(extent={{22,-102},{42,-82}})));
  Modelica.Mechanics.Translational.Sources.QuadraticSpeedDependentForce quadraticSpeedDependentForce1(
    f_nominal=-10,
    ForceDirection=false,
    v_nominal=5)
    annotation (Placement(transformation(extent={{74,-102},{54,-82}})));
  Modelica.Blocks.Sources.Constant Target_type1(k=1)
    annotation (Placement(transformation(extent={{20,-56},{0,-36}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque1
    annotation (Placement(transformation(extent={{-66,-102},{-46,-82}})));
  Controllers.Discrete.discrete_ES_SFS                ES_type1(
    T_update=20,
    probe_frequency=0.05,
    abs_mean_threshold=0,
    min_control=0)
    annotation (Placement(transformation(extent={{-46,-78},{-66,-58}})));
  Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor_type1
    annotation (Placement(transformation(extent={{20,-78},{0,-58}})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function quad_obj_func_type1
    annotation (Placement(transformation(extent={{-16,-78},{-36,-58}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealRollingWheel2(radius=1)
    annotation (Placement(transformation(extent={{-6,54},{14,74}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(
    phi(fixed=true, start=0),
    w(fixed=true, start=0),
    J=1) annotation (Placement(transformation(extent={{-36,54},{-16,74}})));
  Modelica.Mechanics.Translational.Components.Mass mass2(L=0, m=1)
    annotation (Placement(transformation(extent={{24,54},{44,74}})));
  Modelica.Mechanics.Translational.Sources.QuadraticSpeedDependentForce quadraticSpeedDependentForce2(
    f_nominal=-10,
    ForceDirection=false,
    v_nominal=5)
    annotation (Placement(transformation(extent={{76,54},{56,74}})));
  Modelica.Blocks.Sources.Constant Target_cont(k=1)
    annotation (Placement(transformation(extent={{20,100},{0,120}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque2
    annotation (Placement(transformation(extent={{-64,54},{-44,74}})));
  Controllers.Continuous.ES_BASIC
                              ES_cont(
    probe_peak_amplitude=0.05,
    probe_frequency=0.05,
    delay_compensation=0,
    integrator_gain=0.005)
    annotation (Placement(transformation(extent={{-46,78},{-66,98}})));
  Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor_cont
    annotation (Placement(transformation(extent={{20,78},{0,98}})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function quad_obj_func_cont
    annotation (Placement(transformation(extent={{-16,78},{-36,98}})));
equation

  connect(inertia.flange_b,idealRollingWheel. flangeR) annotation (Line(
      points={{-16,-12},{-6,-12}}));
  connect(idealRollingWheel.flangeT,mass. flange_a) annotation (Line(
      points={{14,-12},{24,-12}},
      color={0,127,0}));
  connect(quadraticSpeedDependentForce.flange,mass. flange_b) annotation (
      Line(
      points={{56,-12},{44,-12}},
      color={0,127,0}));
  connect(torque.flange,inertia. flange_a)
    annotation (Line(points={{-44,-12},{-36,-12}},
                                                 color={0,0,0}));
  connect(ES_type2.y, torque.tau) annotation (Line(points={{-66.5556,12},{-80,
          12},{-80,-12},{-66,-12}},
                             color={0,0,127}));
  connect(speedSensor_type2.flange, mass.flange_a)
    annotation (Line(points={{20,12},{24,12},{24,-12}}, color={0,127,0}));
  connect(Target_type2.y, quad_obj_func_type2.Target) annotation (Line(points={
          {-1,34},{-8,34},{-8,16},{-14,16}}, color={0,0,127}));
  connect(speedSensor_type2.v, quad_obj_func_type2.u)
    annotation (Line(points={{-1,12},{-14,12}}, color={0,0,127}));
  connect(quad_obj_func_type2.y, ES_type2.u)
    annotation (Line(points={{-38,12},{-44.8889,12}},
                                                 color={0,0,127}));
  connect(inertia1.flange_b, idealRollingWheel1.flangeR)
    annotation (Line(points={{-18,-92},{-8,-92}}));
  connect(idealRollingWheel1.flangeT, mass1.flange_a)
    annotation (Line(points={{12,-92},{22,-92}}, color={0,127,0}));
  connect(quadraticSpeedDependentForce1.flange, mass1.flange_b)
    annotation (Line(points={{54,-92},{42,-92}}, color={0,127,0}));
  connect(torque1.flange, inertia1.flange_a)
    annotation (Line(points={{-46,-92},{-38,-92}}, color={0,0,0}));
  connect(ES_type1.y, torque1.tau) annotation (Line(points={{-66.5882,-68},{-80,
          -68},{-80,-92},{-68,-92}},
                                color={0,0,127}));
  connect(speedSensor_type1.flange, mass1.flange_a)
    annotation (Line(points={{20,-68},{22,-68},{22,-92}}, color={0,127,0}));
  connect(Target_type1.y, quad_obj_func_type1.Target) annotation (Line(points={
          {-1,-46},{-8,-46},{-8,-64},{-14,-64}}, color={0,0,127}));
  connect(speedSensor_type1.v, quad_obj_func_type1.u)
    annotation (Line(points={{-1,-68},{-14,-68}}, color={0,0,127}));
  connect(quad_obj_func_type1.y, ES_type1.u)
    annotation (Line(points={{-38,-68},{-44.8235,-68}},
                                                   color={0,0,127}));
  connect(inertia2.flange_b,idealRollingWheel2. flangeR)
    annotation (Line(points={{-16,64},{-6,64}}));
  connect(idealRollingWheel2.flangeT,mass2. flange_a)
    annotation (Line(points={{14,64},{24,64}},   color={0,127,0}));
  connect(quadraticSpeedDependentForce2.flange,mass2. flange_b)
    annotation (Line(points={{56,64},{44,64}},   color={0,127,0}));
  connect(torque2.flange,inertia2. flange_a)
    annotation (Line(points={{-44,64},{-36,64}},   color={0,0,0}));
  connect(ES_cont.y, torque2.tau) annotation (Line(points={{-66.8333,88},{-76,
          88},{-76,64},{-66,64}}, color={0,0,127}));
  connect(speedSensor_cont.flange, mass2.flange_a)
    annotation (Line(points={{20,88},{24,88},{24,64}}, color={0,127,0}));
  connect(Target_cont.y, quad_obj_func_cont.Target) annotation (Line(points={{
          -1,110},{-8,110},{-8,92},{-14,92}}, color={0,0,127}));
  connect(speedSensor_cont.v, quad_obj_func_cont.u)
    annotation (Line(points={{-1,88},{-14,88}}, color={0,0,127}));
  connect(quad_obj_func_cont.y, ES_cont.u)
    annotation (Line(points={{-38,88},{-47.6667,88}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>
This model demonstrates the coupling between rotational and translational components:<br>
A torque (step) accelerates both the inertia (of the wheel) and the mass (of the vehicle).<br>
Du to a speed dependent force (like driving resistance), we find an equilibrium at 5 m/s after approx. 5 s.
</p>
</html>"),
       experiment(StopTime=500, Interval=0.001));
end RollingWheel;