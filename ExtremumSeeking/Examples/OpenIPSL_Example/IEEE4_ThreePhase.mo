within ExtremumSeeking.Examples.OpenIPSL_Example;
model IEEE4_ThreePhase
  extends Modelica.Icons.Example;
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60, S_b=100000000)
                                                      annotation (Placement(
        visible=true, transformation(
        origin={70,84},
        extent={{-12,-10},{12,10}},
        rotation=0)));
  Components.Dyn_wye_3Ph_balanced dyn_wye_3Ph_balanced(P0=0, Q0=0)
    annotation (Placement(transformation(extent={{58,-22},{78,-2}})));
  ThreePhase.Buses.InfiniteBus InfiniteBus annotation (Placement(visible=true,
        transformation(
        origin={-88,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus1 annotation (Placement(visible=true,
        transformation(
        origin={-46,52},
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
        origin={-28,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus2 annotation (Placement(visible=true,
        transformation(
        origin={-12,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus3(
    angle_A=-30,
    angle_B=-150,
    angle_C=90) annotation (Placement(visible=true, transformation(
        origin={20,52},
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
        origin={36,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus4(
    angle_A=-30,
    angle_B=-150,
    angle_C=90) annotation (Placement(visible=true, transformation(
        origin={52,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Loads.WyeLoad_3Ph Load(
    AngA=0,
    ModelType=0,
    P_a=1000000,
    Q_a=790000,
    P_b=1000000,
    Q_b=872000,
    P_c=1000000,
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
        origin={4,52},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Objective_functions.Quadratic_objective_function objective_function_1_input
    annotation (Placement(transformation(extent={{-46,-20},{-26,0}})));
  Controllers.Continuous.ES_ADV eS_ADV(
    probe_frequency=5,
    probe_peak_amplitude=0.0001,
    integrator_gain=1)
    annotation (Placement(transformation(extent={{-2,-20},{18,0}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{20,-56},{40,-36}})));
  Modelica.Blocks.Sources.Constant target(k=2)
    annotation (Placement(transformation(extent={{-14,8},{-34,28}})));
  Components.MeasurementBus measurementBus
    annotation (Placement(transformation(extent={{-72,42},{-52,62}})));
equation
  connect(Trafo.Cout,Bus3. p3) annotation (Line(points={{13,43},{20,43}},
                    color={0,0,255}));
  connect(Trafo.Bout,Bus3. p2)
    annotation (Line(points={{13,52},{20,52}},            color={0,0,255}));
  connect(Trafo.Aout,Bus3. p1)
    annotation (Line(points={{13,61},{20,61}},            color={0,0,255}));
  connect(Bus2.p3,Trafo. Cin) annotation (Line(points={{-12,43},{-5,43}},
                    color={0,0,255}));
  connect(Bus2.p2,Trafo. Bin) annotation (Line(points={{-12,52},{-5,52}},
                   color={0,0,255}));
  connect(Bus2.p1,Trafo. Ain)
    annotation (Line(points={{-12,61},{-5,61}},             color={0,0,255}));
  connect(Bus4.p3,Load. C) annotation (Line(points={{52,43},{52,43.1},{97,43.1}},
                     color={0,0,255}));
  connect(Bus4.p2,Load. B)
    annotation (Line(points={{52,52},{97,52}},             color={0,0,255}));
  connect(Bus4.p1,Load. A) annotation (Line(points={{52,61},{52,60.9},{97,60.9}},
                 color={0,0,255}));
  connect(Line2.Cout,Bus4. p3) annotation (Line(points={{45.2857,43},{52,43}},
                           color={0,0,255}));
  connect(Line2.Bout,Bus4. p2) annotation (Line(points={{45.2857,52},{52,52}},
                      color={0,0,255}));
  connect(Line2.Aout,Bus4. p1) annotation (Line(points={{45.2857,61},{52,61}},
                      color={0,0,255}));
  connect(Bus3.p3,Line2. Cin) annotation (Line(points={{20,43},{26.7143,43}},
                         color={0,0,255}));
  connect(Bus3.p2,Line2. Bin) annotation (Line(points={{20,52},{26.7143,52}},
                       color={0,0,255}));
  connect(Bus3.p1,Line2. Ain) annotation (Line(points={{20,61},{26.7143,61}},
                       color={0,0,255}));
  connect(Line1.Cout,Bus2. p3) annotation (Line(points={{-18.7143,43},{-12,43}},
                              color={0,0,255}));
  connect(Line1.Bout,Bus2. p2) annotation (Line(points={{-18.7143,52},{-12,52}},
                       color={0,0,255}));
  connect(Line1.Aout,Bus2. p1) annotation (Line(points={{-18.7143,61},{-12,61}},
                       color={0,0,255}));
  connect(Bus1.p3,Line1. Cin) annotation (Line(points={{-46,43},{-37.2857,43}},
                          color={0,0,255}));
  connect(Bus1.p2,Line1. Bin) annotation (Line(points={{-46,52},{-37.2857,52}},
                         color={0,0,255}));
  connect(Bus1.p1,Line1. Ain) annotation (Line(points={{-46,61},{-37.2857,61}},
                         color={0,0,255}));
  connect(dyn_wye_3Ph_balanced.C, Load.C) annotation (Line(points={{59.1,-1},{
          59.1,42},{60,42},{60,43.1},{97,43.1}},      color={0,0,255}));
  connect(dyn_wye_3Ph_balanced.B, Load.B)
    annotation (Line(points={{68,-1},{68,52},{97,52}}, color={0,0,255}));
  connect(dyn_wye_3Ph_balanced.A, Load.A) annotation (Line(points={{76.9,-1},{
          76.9,62},{78,62},{78,60.9},{97,60.9}},      color={0,0,255}));
  connect(objective_function_1_input.y, eS_ADV.u)
    annotation (Line(points={{-24,-10},{-3.25,-10}}, color={0,0,127}));
  connect(eS_ADV.y, dyn_wye_3Ph_balanced.P_in)
    annotation (Line(points={{18.625,-10},{62,-10}}, color={0,0,127}));
  connect(const.y, dyn_wye_3Ph_balanced.Q_in) annotation (Line(points={{41,-46},
          {52,-46},{52,-18},{62,-18}},       color={0,0,127}));
  connect(target.y, objective_function_1_input.Target) annotation (Line(points=
          {{-35,18},{-52,18},{-52,-6},{-48,-6}}, color={0,0,127}));
  connect(measurementBus.p1, Bus1.p1) annotation (Line(points={{-53,61},{-49.5,
          61},{-49.5,61},{-46,61}}, color={0,0,255}));
  connect(measurementBus.p2, Bus1.p2)
    annotation (Line(points={{-53,52},{-46,52}}, color={0,0,255}));
  connect(measurementBus.p3, Bus1.p3) annotation (Line(points={{-53,43},{-49.5,
          43},{-49.5,43},{-46,43}}, color={0,0,255}));
  connect(InfiniteBus.p1, measurementBus.p4) annotation (Line(points={{-79,61},
          {-74.5,61},{-74.5,61},{-71,61}}, color={0,0,255}));
  connect(InfiniteBus.p2, measurementBus.p5)
    annotation (Line(points={{-79,52},{-71,52}}, color={0,0,255}));
  connect(InfiniteBus.p3, measurementBus.p6) annotation (Line(points={{-79,43},
          {-74.5,43},{-74.5,43},{-71,43}}, color={0,0,255}));
  connect(measurementBus.ya, objective_function_1_input.u) annotation (Line(
        points={{-56.8,39.6},{-56.8,-9.2},{-48,-9.2},{-48,-10}}, color={0,0,127}));
  annotation (experiment(
      StopTime=10,
      Interval=0.0002,
      Tolerance=1e-06));
end IEEE4_ThreePhase;
