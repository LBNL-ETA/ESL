within ExtremumSeeking.Controllers.Discrete.Support;
block DiscreteLimIntegrator
  extends Modelica.Blocks.Interfaces.DiscreteSISO;
  parameter Real max_control = 10e30 "Maximal control signal (including probe signal)";
  parameter Real min_control = -max_control "Minimum control signal (including probe signal)";


  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=max_control,uMin = min_control)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Discrete.ZeroOrderHold zeroOrderHold(samplePeriod=samplePeriod)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
equation
  connect(add.y,limiter. u)
    annotation (Line(points={{-19,0},{-12,0}},
                                             color={0,0,127}));
  connect(limiter.y,zeroOrderHold. u)
    annotation (Line(points={{11,0},{18,0}}, color={0,0,127}));
  connect(zeroOrderHold.y,add. u1) annotation (Line(points={{41,0},{46,0},{46,18},
          {-46,18},{-46,6},{-42,6}},      color={0,0,127}));
  connect(u, add.u2) annotation (Line(points={{-120,0},{-90,0},{-90,-6},{-42,-6}},
        color={0,0,127}));
  connect(y, zeroOrderHold.y)
    annotation (Line(points={{110,0},{41,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-52,22},{50,-18}},
          lineColor={0,140,72},
          pattern=LinePattern.Dash,
          lineThickness=1),          Text(
          extent={{-52,30},{46,24}},
          lineColor={0,140,72},
          textString="Limited Integrator")}));
end DiscreteLimIntegrator;
