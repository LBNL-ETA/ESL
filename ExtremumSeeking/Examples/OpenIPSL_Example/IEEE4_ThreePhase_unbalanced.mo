within ExtremumSeeking.Examples.OpenIPSL_Example;
model IEEE4_ThreePhase_unbalanced
  extends Modelica.Icons.Example;
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60, S_b=100000000)
                                                      annotation (Placement(
        visible=true, transformation(
        origin={70,84},
        extent={{-12,-10},{12,10}},
        rotation=0)));
  Components.Dyn_wye_3Ph_unbalanced
                                  dyn_wye_3Ph_unbalanced(
    P0_a=0,
    Q0_a=0,
    P0_b=0,
    Q0_b=0,
    P0_c=0,
    Q0_c=0)
    annotation (Placement(transformation(extent={{70,-6},{90,14}})));
  ThreePhase.Buses.InfiniteBus InfiniteBus annotation (Placement(visible=true,
        transformation(
        origin={-88,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus1 annotation (Placement(visible=true,
        transformation(
        origin={-36,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Branches.Lines.Line_3Ph Line1(
    Bseraa=-3.9929,
    Bserab=1.5824,
    Bserac=1.0891,
    Bserbb=-4.1181,
    Bserbc=1.3055,
    Bsercc=-3.8154,
    Gseraa=1.8794,
    Gserab=-1.1096,
    Gserac=-0.5004,
    Gserbb=2.0690,
    Gserbc=-0.7714,
    Gsercc=1.6050) annotation (Placement(visible=true, transformation(
        origin={-20,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus2 annotation (Placement(visible=true,
        transformation(
        origin={-4,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus3(
    angle_A=-30,
    angle_B=-150,
    angle_C=90) annotation (Placement(visible=true, transformation(
        origin={28,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Branches.Lines.Line_3Ph Line2(
    Bseraa=-0.3687,
    Bserab=0.1265,
    Bserac=0.0822,
    Bserbb=-0.3821,
    Bserbc=0.1004,
    Bsercc=-0.3559,
    Gseraa=0.1779,
    Gserab=-0.0864,
    Gserac=-0.0312,
    Gserbb=0.1989,
    Gserbc=-0.0529,
    Gsercc=0.1598) annotation (Placement(visible=true, transformation(
        origin={44,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus4(
    angle_A=-30,
    angle_B=-150,
    angle_C=90) annotation (Placement(visible=true, transformation(
        origin={60,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Loads.WyeLoad_3Ph Load(
    AngA=0,
    ModelType=0,
    P_a=1200000,
    Q_a=790000,
    P_b=500000,
    Q_b=872000,
    P_c=2500000,
    Q_c=781000)
               annotation (Placement(visible=true, transformation(
        origin={108,52},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Branches.Transformer.Transformer_3Ph Trafo(
    Connection=0,
    R=0.16666667,
    X=1,
    tap=1) annotation (Placement(visible=true, transformation(
        origin={12,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function_n_inputs objective_function_1_input(nin=3)
    annotation (Placement(transformation(extent={{-18,-20},{2,0}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-8,-80},{12,-60}})));
  Controllers.Continuous.ES_ADV ES_ph_a(
    probe_peak_amplitude=0.0001,
    probe_frequency=5,
    integrator_gain=1)
    annotation (Placement(transformation(extent={{16,2},{36,22}})));
  Controllers.Continuous.ES_ADV ES_ph_b(
    probe_peak_amplitude=0.0001,
    probe_frequency=3,
    integrator_gain=1)
    annotation (Placement(transformation(extent={{16,-20},{36,0}})));
  Controllers.Continuous.ES_ADV ES_ph_c(
    probe_peak_amplitude=0.0001,
    probe_frequency=4,
    integrator_gain=1)
    annotation (Placement(transformation(extent={{16,-42},{36,-22}})));
  Modelica.Blocks.Routing.Replicator replicator(nout=3)
    annotation (Placement(transformation(extent={{28,-80},{48,-60}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_1
    annotation (Placement(transformation(extent={{46,-4},{66,16}})));
  Modelica.Blocks.Sources.Constant target_ph_a(k=1)
    annotation (Placement(transformation(extent={{-92,-24},{-72,-4}})));
  Modelica.Blocks.Sources.Constant target_ph_b(k=1.5)
    annotation (Placement(transformation(extent={{-92,-54},{-72,-34}})));
  Modelica.Blocks.Sources.Constant target_ph_c(k=2)
    annotation (Placement(transformation(extent={{-92,-84},{-72,-64}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_2
    annotation (Placement(transformation(extent={{-60,-54},{-40,-34}})));
  Components.MeasurementBus measurementBus
    annotation (Placement(transformation(extent={{-68,42},{-48,62}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_3 annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=-90,
        origin={-57,23})));
equation
  connect(Trafo.Cout,Bus3. p3) annotation (Line(points={{21,43},{28,43}},
                    color={0,0,255}));
  connect(Trafo.Bout,Bus3. p2)
    annotation (Line(points={{21,52},{28,52}},            color={0,0,255}));
  connect(Trafo.Aout,Bus3. p1)
    annotation (Line(points={{21,61},{28,61}},            color={0,0,255}));
  connect(Bus2.p3,Trafo. Cin) annotation (Line(points={{-4,43},{3,43}},
                    color={0,0,255}));
  connect(Bus2.p2,Trafo. Bin) annotation (Line(points={{-4,52},{3,52}},
                   color={0,0,255}));
  connect(Bus2.p1,Trafo. Ain)
    annotation (Line(points={{-4,61},{3,61}},               color={0,0,255}));
  connect(Bus4.p3,Load. C) annotation (Line(points={{60,43},{60,43.1},{97,43.1}},
                     color={0,0,255}));
  connect(Bus4.p2,Load. B)
    annotation (Line(points={{60,52},{97,52}},             color={0,0,255}));
  connect(Bus4.p1,Load. A) annotation (Line(points={{60,61},{60,60.9},{97,60.9}},
                 color={0,0,255}));
  connect(Line2.Cout,Bus4. p3) annotation (Line(points={{53.2857,43},{60,43}},
                           color={0,0,255}));
  connect(Line2.Bout,Bus4. p2) annotation (Line(points={{53.2857,52},{60,52}},
                      color={0,0,255}));
  connect(Line2.Aout,Bus4. p1) annotation (Line(points={{53.2857,61},{60,61}},
                      color={0,0,255}));
  connect(Bus3.p3,Line2. Cin) annotation (Line(points={{28,43},{34.7143,43}},
                         color={0,0,255}));
  connect(Bus3.p2,Line2. Bin) annotation (Line(points={{28,52},{34.7143,52}},
                       color={0,0,255}));
  connect(Bus3.p1,Line2. Ain) annotation (Line(points={{28,61},{34.7143,61}},
                       color={0,0,255}));
  connect(Line1.Cout,Bus2. p3) annotation (Line(points={{-10.7143,43},{-4,43}},
                              color={0,0,255}));
  connect(Line1.Bout,Bus2. p2) annotation (Line(points={{-10.7143,52},{-4,52}},
                       color={0,0,255}));
  connect(Line1.Aout,Bus2. p1) annotation (Line(points={{-10.7143,61},{-4,61}},
                       color={0,0,255}));
  connect(Bus1.p3,Line1. Cin) annotation (Line(points={{-36,43},{-29.2857,43}},
                          color={0,0,255}));
  connect(Bus1.p2,Line1. Bin) annotation (Line(points={{-36,52},{-29.2857,52}},
                         color={0,0,255}));
  connect(Bus1.p1,Line1. Ain) annotation (Line(points={{-36,61},{-29.2857,61}},
                         color={0,0,255}));
  connect(dyn_wye_3Ph_unbalanced.C, Load.C) annotation (Line(points={{71.1,15},
          {71.1,42},{72,42},{72,43.1},{97,43.1}},          color={0,0,255}));
  connect(dyn_wye_3Ph_unbalanced.B, Load.B)
    annotation (Line(points={{80,15},{80,52},{97,52}}, color={0,0,255}));
  connect(dyn_wye_3Ph_unbalanced.A, Load.A) annotation (Line(points={{88.9,15},
          {88.9,62},{88,62},{88,60.9},{97,60.9}},          color={0,0,255}));
  connect(const.y, replicator.u)
    annotation (Line(points={{13,-70},{26,-70}}, color={0,0,127}));
  connect(replicator.y, dyn_wye_3Ph_unbalanced.Q_in)
    annotation (Line(points={{49,-70},{74,-70},{74,-2}}, color={0,0,127}));
  connect(multiplex3_1.y, dyn_wye_3Ph_unbalanced.P_in)
    annotation (Line(points={{67,6},{74,6}}, color={0,0,127}));
  connect(multiplex3_1.u1[1], ES_ph_a.y) annotation (Line(points={{44,13},{40,
          13},{40,12},{36.625,12}},
                                color={0,0,127}));
  connect(multiplex3_1.u2[1], ES_ph_b.y) annotation (Line(points={{44,6},{38,6},
          {38,-10},{36.625,-10}},
                              color={0,0,127}));
  connect(multiplex3_1.u3[1], ES_ph_c.y) annotation (Line(points={{44,-1},{44,
          -32.5},{36.625,-32.5},{36.625,-32}},
                                       color={0,0,127}));
  connect(objective_function_1_input.obj_fn, ES_ph_a.u) annotation (Line(points={{4,-10},
          {8,-10},{8,12},{14.75,12}},      color={0,0,127}));
  connect(ES_ph_b.u, ES_ph_a.u) annotation (Line(points={{14.75,-10},{8,-10},{8,
          12},{14.75,12}},
                    color={0,0,127}));
  connect(ES_ph_c.u, ES_ph_a.u) annotation (Line(points={{14.75,-32},{8,-32},{8,
          12},{14.75,12}},
                    color={0,0,127}));
  connect(target_ph_b.y, multiplex3_2.u2[1])
    annotation (Line(points={{-71,-44},{-62,-44}}, color={0,0,127}));
  connect(target_ph_a.y, multiplex3_2.u1[1]) annotation (Line(points={{-71,-14},
          {-66,-14},{-66,-37},{-62,-37}}, color={0,0,127}));
  connect(target_ph_c.y, multiplex3_2.u3[1]) annotation (Line(points={{-71,-74},
          {-68,-74},{-68,-51},{-62,-51}}, color={0,0,127}));
  connect(objective_function_1_input.Targets, multiplex3_2.y) annotation (Line(
        points={{-20,-3.2},{-34,-3.2},{-34,-44},{-39,-44}}, color={0,0,127}));
  connect(InfiniteBus.p1, measurementBus.p4) annotation (Line(points={{-79,61},
          {-72.5,61},{-72.5,61},{-67,61}}, color={0,0,255}));
  connect(InfiniteBus.p2, measurementBus.p5)
    annotation (Line(points={{-79,52},{-67,52}}, color={0,0,255}));
  connect(InfiniteBus.p3, measurementBus.p6) annotation (Line(points={{-79,43},
          {-72.5,43},{-72.5,43},{-67,43}}, color={0,0,255}));
  connect(measurementBus.p1, Bus1.p1) annotation (Line(points={{-49,61},{-42.5,
          61},{-42.5,61},{-36,61}}, color={0,0,255}));
  connect(measurementBus.p2, Bus1.p2)
    annotation (Line(points={{-49,52},{-36,52}}, color={0,0,255}));
  connect(measurementBus.p3, Bus1.p3) annotation (Line(points={{-49,43},{-42.5,
          43},{-42.5,43},{-36,43}}, color={0,0,255}));
  connect(multiplex3_3.y, objective_function_1_input.Inputs) annotation (Line(
        points={{-57,15.3},{-57,-7.8},{-20,-7.8}}, color={0,0,127}));
  connect(measurementBus.ya, multiplex3_3.u1[1]) annotation (Line(points={{
          -52.8,39.6},{-52.8,35.8},{-52.1,35.8},{-52.1,31.4}}, color={0,0,127}));
  connect(measurementBus.yb, multiplex3_3.u2[1]) annotation (Line(points={{
          -57.8,39.6},{-57.8,35.8},{-57,35.8},{-57,31.4}}, color={0,0,127}));
  connect(measurementBus.yc, multiplex3_3.u3[1]) annotation (Line(points={{-63,
          39.6},{-63,35.8},{-61.9,35.8},{-61.9,31.4}}, color={0,0,127}));
  annotation (experiment(
      StopTime=10,
      Interval=0.0002,
      Tolerance=1e-06));
end IEEE4_ThreePhase_unbalanced;
