within ExtremumSeeking.Examples.MechanicalExamples;
model SpringMassDamper "Use of damper models."

  extends Modelica.Icons.Example;

  Modelica.Mechanics.Translational.Components.Mass mass(
    s(start=3, fixed=true),
    v(start=0, fixed=true),
    m=1,
    L=0) annotation (Placement(transformation(extent={{-64,0},{-44,20}})));
  Modelica.Mechanics.Translational.Components.Damper damper(d=1)
    annotation (Placement(transformation(extent={{-32,0},{-12,20}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed(s0=4.5)
    annotation (Placement(transformation(extent={{8,0},{28,20}})));
  Modelica.Mechanics.Translational.Components.Spring spring(s_rel0=1, c=10)
    annotation (Placement(transformation(extent={{-32,-20},{-12,0}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(extent={{-32,20},{-12,40}})));
  Controllers.Continuous.ES_BASIC ES(
    probe_frequency=0.2,
    integrator_gain=3,
    probe_peak_amplitude=0.5)
    annotation (Placement(transformation(extent={{50,26},{70,46}})));
  Modelica.Mechanics.Translational.Sources.Force force
    annotation (Placement(transformation(extent={{-64,-24},{-44,-4}})));
  Modelica.Blocks.Sources.Constant Target(k=5)
    annotation (Placement(transformation(extent={{-32,44},{-12,64}})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function quadratic_objective_function
    annotation (Placement(transformation(extent={{18,26},{38,46}})));
equation
  connect(mass.flange_b, damper.flange_a)
    annotation (Line(points={{-44,10},{-32,10}}, color={0,191,0}));
  connect(damper.flange_b, spring.flange_b)
    annotation (Line(points={{-12,10},{-12,-10}}, color={0,191,0}));
  connect(damper.flange_a, spring.flange_a)
    annotation (Line(points={{-32,10},{-32,-10}}, color={0,191,0}));
  connect(damper.flange_b, fixed.flange)
    annotation (Line(points={{-12,10},{18,10}}, color={0,127,0}));
  connect(ES.y, force.f) annotation (Line(points={{71,36},{84,36},{84,72},{-72,
          72},{-72,-14},{-66,-14}}, color={0,0,127}));
  connect(positionSensor.flange, mass.flange_b)
    annotation (Line(points={{-32,30},{-44,30},{-44,10}}, color={0,127,0}));
  connect(positionSensor.s, quadratic_objective_function.u) annotation (Line(
        points={{-11,30},{-2,30},{-2,36},{16,36}}, color={0,0,127}));
  connect(Target.y, quadratic_objective_function.Target) annotation (Line(
        points={{-11,54},{-2,54},{-2,40},{16,40}}, color={0,0,127}));
  connect(quadratic_objective_function.y, ES.u)
    annotation (Line(points={{40,36},{48,36}}, color={0,0,127}));
  connect(force.flange, mass.flange_b)
    annotation (Line(points={{-44,-14},{-44,10}}, color={0,127,0}));
  annotation (Documentation(info="<html>
<p>
Demonstrate usage of damper components in different variants.
</p>
</html>"),
       experiment(StopTime=125, Interval=0.001),
    __Dymola_experimentSetupOutput);
end SpringMassDamper;
