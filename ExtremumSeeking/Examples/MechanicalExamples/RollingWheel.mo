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
  Modelica.Blocks.Sources.Constant Target_ES_MFS(k=1)
    annotation (Placement(transformation(extent={{56,6},{36,26}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-64,-22},{-44,-2}})));
  Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor_ES_MFS
    annotation (Placement(transformation(extent={{20,2},{0,22}})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function quad_obj_func_ES_MFS
    annotation (Placement(transformation(extent={{-16,2},{-36,22}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealRollingWheel1(radius=1)
    annotation (Placement(transformation(extent={{-6,-86},{14,-66}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(
    phi(fixed=true, start=0),
    w(fixed=true, start=0),
    J=1) annotation (Placement(transformation(extent={{-36,-86},{-16,-66}})));
  Modelica.Mechanics.Translational.Components.Mass mass1(L=0, m=1)
    annotation (Placement(transformation(extent={{24,-86},{44,-66}})));
  Modelica.Mechanics.Translational.Sources.QuadraticSpeedDependentForce quadraticSpeedDependentForce1(
    f_nominal=-10,
    ForceDirection=false,
    v_nominal=5)
    annotation (Placement(transformation(extent={{76,-86},{56,-66}})));
  Modelica.Blocks.Sources.Constant Target_ES_SFS(k=1)
    annotation (Placement(transformation(extent={{56,-58},{36,-38}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque1
    annotation (Placement(transformation(extent={{-64,-86},{-44,-66}})));
  Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor_ES_SFS
    annotation (Placement(transformation(extent={{20,-62},{0,-42}})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function quad_obj_func_ES_SFS
    annotation (Placement(transformation(extent={{-14,-62},{-34,-42}})));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel idealRollingWheel2(radius=1)
    annotation (Placement(transformation(extent={{-6,38},{14,58}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(
    phi(fixed=true, start=0),
    w(fixed=true, start=0),
    J=1) annotation (Placement(transformation(extent={{-36,38},{-16,58}})));
  Modelica.Mechanics.Translational.Components.Mass mass2(L=0, m=1)
    annotation (Placement(transformation(extent={{24,38},{44,58}})));
  Modelica.Mechanics.Translational.Sources.QuadraticSpeedDependentForce quadraticSpeedDependentForce2(
    f_nominal=-10,
    ForceDirection=false,
    v_nominal=5)
    annotation (Placement(transformation(extent={{76,38},{56,58}})));
  Modelica.Blocks.Sources.Constant Target_ES(k=1)
    annotation (Placement(transformation(extent={{56,66},{36,86}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque2
    annotation (Placement(transformation(extent={{-64,38},{-44,58}})));
  Controllers.Continuous.ES_BASIC ES(
    probe_peak_amplitude=0.05,
    probe_frequency=0.05,
    delay_compensation=0,
    integrator_gain=0.005)
    annotation (Placement(transformation(extent={{-48,62},{-68,82}})));
  Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor_ES
    annotation (Placement(transformation(extent={{20,62},{0,82}})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function quad_obj_func_ES
    annotation (Placement(transformation(extent={{-16,62},{-36,82}})));
  Controllers.Discrete.discrete_ES_MFS discrete_ES_MFS(probe_frequency=0.05,
      control_gain=0.2)
    annotation (Placement(transformation(extent={{-36,4},{-72,20}})));
  Controllers.Discrete.discrete_ES_SFS discrete_ES_SFS(
    probe_frequency=0.05,
    T_update=20,
    min_control=0)
    annotation (Placement(transformation(extent={{-40,-60},{-74,-44}})));
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
  connect(speedSensor_ES_MFS.flange, mass.flange_a)
    annotation (Line(points={{20,12},{24,12},{24,-12}}, color={0,127,0}));
  connect(Target_ES_MFS.y, quad_obj_func_ES_MFS.Target) annotation (Line(points={{35,16},
          {28,16},{28,22},{-8,22},{-8,16},{-14,16}},
                                             color={0,0,127}));
  connect(speedSensor_ES_MFS.v, quad_obj_func_ES_MFS.u)
    annotation (Line(points={{-1,12},{-14,12}}, color={0,0,127}));
  connect(inertia1.flange_b, idealRollingWheel1.flangeR)
    annotation (Line(points={{-16,-76},{-6,-76}}));
  connect(idealRollingWheel1.flangeT, mass1.flange_a)
    annotation (Line(points={{14,-76},{24,-76}}, color={0,127,0}));
  connect(quadraticSpeedDependentForce1.flange, mass1.flange_b)
    annotation (Line(points={{56,-76},{44,-76}}, color={0,127,0}));
  connect(torque1.flange, inertia1.flange_a)
    annotation (Line(points={{-44,-76},{-36,-76}}, color={0,0,0}));
  connect(speedSensor_ES_SFS.flange, mass1.flange_a)
    annotation (Line(points={{20,-52},{24,-52},{24,-76}}, color={0,127,0}));
  connect(Target_ES_SFS.y, quad_obj_func_ES_SFS.Target) annotation (Line(points={{35,-48},
          {28,-48},{28,-42},{-6,-42},{-6,-48},{-12,-48}},
                                                 color={0,0,127}));
  connect(speedSensor_ES_SFS.v, quad_obj_func_ES_SFS.u)
    annotation (Line(points={{-1,-52},{-12,-52}}, color={0,0,127}));
  connect(inertia2.flange_b,idealRollingWheel2. flangeR)
    annotation (Line(points={{-16,48},{-6,48}}));
  connect(idealRollingWheel2.flangeT,mass2. flange_a)
    annotation (Line(points={{14,48},{24,48}},   color={0,127,0}));
  connect(quadraticSpeedDependentForce2.flange,mass2. flange_b)
    annotation (Line(points={{56,48},{44,48}},   color={0,127,0}));
  connect(torque2.flange,inertia2. flange_a)
    annotation (Line(points={{-44,48},{-36,48}},   color={0,0,0}));
  connect(ES.y, torque2.tau) annotation (Line(points={{-69,72},{-80,72},{-80,48},
          {-66,48}}, color={0,0,127}));
  connect(speedSensor_ES.flange, mass2.flange_a)
    annotation (Line(points={{20,72},{24,72},{24,48}}, color={0,127,0}));
  connect(Target_ES.y, quad_obj_func_ES.Target) annotation (Line(points={{35,76},
          {28,76},{28,82},{-6,82},{-6,76},{-14,76}},
                                           color={0,0,127}));
  connect(speedSensor_ES.v, quad_obj_func_ES.u)
    annotation (Line(points={{-1,72},{-14,72}}, color={0,0,127}));
  connect(quad_obj_func_ES.y, ES.u)
    annotation (Line(points={{-38,72},{-46,72}}, color={0,0,127}));
  connect(quad_obj_func_ES_MFS.y, discrete_ES_MFS.u)
    annotation (Line(points={{-38,12},{-46,12}}, color={0,0,127}));
  connect(discrete_ES_MFS.y, torque.tau) annotation (Line(points={{-69,12},{-80,
          12},{-80,-12},{-66,-12}}, color={0,0,127}));
  connect(quad_obj_func_ES_SFS.y, discrete_ES_SFS.u)
    annotation (Line(points={{-36,-52},{-46,-52}}, color={0,0,127}));
  connect(discrete_ES_SFS.y, torque1.tau) annotation (Line(points={{-69,-52},{
          -80,-52},{-80,-76},{-66,-76}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>
This model demonstrates the coupling between rotational and translational components:<br>
A torque (step) accelerates both the inertia (of the wheel) and the mass (of the vehicle).<br>
Du to a speed dependent force (like driving resistance), we find an equilibrium at 5 m/s after approx. 5 s.
</p>
</html>"),
       experiment(StopTime=500, Interval=0.001));
end RollingWheel;
