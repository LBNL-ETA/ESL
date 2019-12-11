within ExtremumSeeking.Signals;
model Pyramid_signal
  parameter Real probe_peak_amplitude = 1;
  parameter Modelica.SIunits.Frequency probe_frequency = 1;
  Modelica.Blocks.Sources.Pulse Pulse_2(
    period=1/probe_frequency,
    offset=0,
    width=100/8*3,
    startTime=1/probe_frequency/8,
    amplitude=probe_peak_amplitude/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={18,-54})));
  Modelica.Blocks.Sources.Pulse Pulse_1(
    period=1/probe_frequency,
    offset=0,
    width=100/8,
    startTime=1/probe_frequency/8*2,
    amplitude=probe_peak_amplitude/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-12,-54})));
  Modelica.Blocks.Math.MultiSum multiSum2(nu=2) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={4,-26})));
  Modelica.Blocks.Sources.Pulse Pulse_3(
    period=1/probe_frequency,
    offset=0,
    width=100/8*3,
    startTime=1/probe_frequency/8*5,
    amplitude=probe_peak_amplitude/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-44,-54})));
  Modelica.Blocks.Sources.Pulse Pulse_7(
    period=1/probe_frequency,
    offset=0,
    width=100/8,
    startTime=1/probe_frequency/8*6,
    amplitude=probe_peak_amplitude/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-72,-54})));
  Modelica.Blocks.Math.MultiSum multiSum3(nu=2) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-56,-26})));
  Modelica.Blocks.Math.Gain gain1(k=-1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-56,10})));
  Modelica.Blocks.Math.MultiSum multiSum1(nu=2) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-24,48})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(Pulse_1.y, multiSum2.u[1]) annotation (Line(points={{-12,-43},{-4,
          -43},{-4,-32},{1.9,-32}},
                               color={0,0,127}));
  connect(Pulse_2.y, multiSum2.u[2]) annotation (Line(points={{18,-43},{12,
          -43},{12,-32},{6.1,-32}},
                               color={0,0,127}));
  connect(Pulse_7.y, multiSum3.u[1]) annotation (Line(points={{-72,-43},{
          -64,-43},{-64,-32},{-58.1,-32}},
                                  color={0,0,127}));
  connect(Pulse_3.y, multiSum3.u[2]) annotation (Line(points={{-44,-43},{
          -50,-43},{-50,-32},{-53.9,-32}},
                                  color={0,0,127}));
  connect(multiSum3.y, gain1.u)
    annotation (Line(points={{-56,-18.98},{-56,-2}},color={0,0,127}));
  connect(gain1.y, multiSum1.u[1]) annotation (Line(points={{-56,21},{-56,
          32},{-26,32},{-26,42},{-26.1,42}},
                                    color={0,0,127}));
  connect(multiSum2.y, multiSum1.u[2]) annotation (Line(points={{4,-18.98},
          {4,32},{-21.9,32},{-21.9,42}},                 color={0,0,127}));
  connect(multiSum1.y, y) annotation (Line(points={{-24,55.02},{-24,72},{90,72},
          {90,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Pyramid_signal;
