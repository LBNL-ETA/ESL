within ExtremumSeeking.Examples.OpenIPSL_Example;
model IEEE13_ThreePhase
  extends Modelica.Icons.Example;
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60) annotation (Placement(
        visible=true, transformation(
        origin={470,282},
        extent={{-12,-10},{12,10}},
        rotation=0)));
  ThreePhase.Buses.InfiniteBus InfBus(
    P_A=1000000,
    P_B=1000000,
    P_C=1000000,
    Q_A=0,
    Q_B=0,
    Q_C=0,
    V_A=1.0625,
    V_B=1.05,
    V_C=1.0687,
    angle_A=0,
    angle_B=-2.0943951023932,
    angle_C=2.0943951023932)
                 annotation (Placement(visible=true, transformation(
        origin={-48,88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus632
    annotation (Placement(visible=true, transformation(
        origin={148,88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus671
    annotation (Placement(visible=true, transformation(
        origin={364,88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Branches.Lines.Line_3Ph L632_671(
    Bseraa=-0.5712,
    Bserab=0.2112,
    Bserac=0.1579,
    Bserbb=-0.5413,
    Bserbc=0.1206,
    Bsercc=-0.5106,
    Gseraa=0.1982,
    Gserab=-0.0841,
    Gserac=-0.0460,
    Gserbb=0.1735,
    Gserbc=-0.0219,
    Gsercc=0.1535) annotation (Placement(visible=true, transformation(
        origin={294,88},
        extent={{-14,-10},{14,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph Bus633
    annotation (Placement(visible=true, transformation(
        origin={204,192},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Branches.Lines.Line_3Ph L632_633(
    Bseraa=-1.2346,
    Bserab=0.2606,
    Bserac=0.2925,
    Bserbb=-1.2224,
    Bserbc=0.2392,
    Bsercc=-1.2262,
    Gseraa=0.9630,
    Gserab=-0.2587,
    Gserac=-0.3702,
    Gserbb=0.8495,
    Gserbc=-0.1883,
    Gsercc=0.8980) annotation (Placement(visible=true, transformation(
        origin={204,144},
        extent={{-14,-10},{14,10}},
        rotation=90)));
  ThreePhase.Loads.WyeLoad_3Ph SpotLoad634(
    ModelType=0,
    P_a=160000,
    P_b=120000,
    P_c=120000,
    Q_a=110000,
    Q_b=90000,
    Q_c=90000)
              annotation (Placement(visible=true, transformation(
        origin={204,268},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  ThreePhase.Buses.Bus_3Ph Bus675
    annotation (Placement(visible=true, transformation(
        origin={382,210},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Branches.Lines.Line_3Ph L692_675(
    Bseraa=-1.3443,
    Bserab=0.5197,
    Bserac=0.4255,
    Bserbb=-1.4001,
    Bserbc=0.5197,
    Bsercc=-1.3443,
    Gseraa=1.7857,
    Gserab=-0.4189,
    Gserac=-0.1865,
    Gserbb=1.9810,
    Gserbc=-0.4189,
    Gsercc=1.7857) annotation (Placement(visible=true, transformation(
        origin={382,184},
        extent={{-14,-10},{14,10}},
        rotation=90)));
  ThreePhase.Loads.WyeLoad_3Ph SpotLoad675(
    ModelType=0,
    P_a=485000,
    P_b=68000,
    P_c=290000,
    Q_a=190000,
    Q_b=60000,
    Q_c=212000)
               annotation (Placement(visible=true, transformation(
        origin={382,256},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  ThreePhase.Loads.WyeLoad_3Ph DistLoad671(
    ModelType=0,
    P_a=8500,
    P_b=33000,
    P_c=58500,
    Q_a=5000,
    Q_b=19000,
    Q_c=34000) annotation (Placement(visible=true, transformation(
        origin={320,48},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Loads.WyeLoad_3Ph DisLoad632(
    ModelType=0,
    P_a=8500,
    P_b=33000,
    P_c=58500,
    Q_a=5000,
    Q_b=19000,
    Q_c=34000) annotation (Placement(visible=true, transformation(
        origin={226,50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Banks.CapacitorBank_3Ph CapBank675(
    Q_a=200000,
    Q_b=200000,
    Q_c=200000)
             annotation (Placement(visible=true, transformation(
        origin={420,226},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Buses.Bus_3Ph Bus634
    annotation (Placement(visible=true, transformation(
        origin={204,238},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Branches.Transformer.Transformer_3Ph XFM1(
    Connection=0,
    R=2.2,
    X=4,
    tap=1) annotation (Placement(visible=true, transformation(
        origin={204,216},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  OpenIPSL.Electrical.Events.Breaker breaker annotation (Placement(visible=true,
        transformation(
        origin={374,116},
        extent={{-4,-4},{4,4}},
        rotation=90)));
  OpenIPSL.Electrical.Events.Breaker breaker2 annotation (Placement(visible=
          true, transformation(
        origin={382,122},
        extent={{-4,-4},{4,4}},
        rotation=90)));
  OpenIPSL.Electrical.Events.Breaker breaker3 annotation (Placement(visible=
          true, transformation(
        origin={390,116},
        extent={{-4,-4},{4,4}},
        rotation=90)));
  ThreePhase.Buses.Bus_3Ph Bus692
    annotation (Placement(visible=true, transformation(
        origin={382,138},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Branches.Lines.Line_2Ph L632_645(
    Bseraa=-0.69,
    Bserab=0.1038,
    Bserbb=-0.6931,
    Gseraa=0.7502,
    Gserab=-0.25,
    Gserbb=0.7450) annotation (Placement(visible=true, transformation(
        origin={166,48},
        extent={{-14,-10},{14,10}},
        rotation=-90)));
  ThreePhase.Buses.Bus_2Ph Bus645(
    V_1=1,
    V_2=1,
    angle_1=-120,
    angle_2=120) annotation (Placement(visible=true, transformation(
        origin={166,8},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ThreePhase.Branches.Lines.Line_2Ph L645_646(
    Bseraa=-1.1499,
    Bserab=0.1729,
    Bserbb=-1.1552,
    Gseraa=1.2503,
    Gserab=-0.4167,
    Gserbb=1.2417) annotation (Placement(visible=true, transformation(
        origin={166,-20},
        extent={{-14,-10},{14,10}},
        rotation=-90)));
  ThreePhase.Buses.Bus_2Ph Bus646(
    V_1=1,
    V_2=1,
    angle_1=-120,
    angle_2=120) annotation (Placement(visible=true, transformation(
        origin={166,-44},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ThreePhase.Loads.WyeLoad_1Ph SpotLoad645(
    AngA=-2.0943951023932,
    P_a=170000,
    Q_a=125000,
    VA=1) annotation (Placement(visible=true, transformation(
        origin={190,0},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Buses.Bus_3Ph Bus680
    annotation (Placement(visible=true, transformation(
        origin={456,88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Branches.Lines.Line_3Ph L671_680(
    Bseraa=-1.1424,
    Bserab=0.4224,
    Bserac=0.3157,
    Bserbb=-1.0825,
    Bserbc=0.2411,
    Bsercc=-1.0212,
    Gseraa=0.3963,
    Gserab=-0.1682,
    Gserac=-0.0921,
    Gserbb=0.3471,
    Gserbc=-0.0437,
    Gsercc=0.3069) annotation (Placement(visible=true, transformation(
        origin={422,88},
        extent={{-14,-10},{14,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_2Ph Bus684(angle_2=120) annotation (Placement(visible=
          true, transformation(
        origin={390,12},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ThreePhase.Branches.Lines.Line_2Ph L671_684(
    Bseraa=-1.1552,
    Bserab=0.1729,
    Bserbb=-1.1499,
    Gseraa=1.2417,
    Gserab=-0.4167,
    Gserbb=1.2503) annotation (Placement(visible=true, transformation(
        origin={390,44},
        extent={{-14,-10},{14,10}},
        rotation=-90)));
  ThreePhase.Branches.Lines.Line_1Ph L684_652(Bser=-0.2834, Gser=0.7426)
    annotation (Placement(visible=true, transformation(
        origin={422,-10},
        extent={{-14,-10},{14,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_1Ph Bus652 annotation (Placement(visible=true,
        transformation(
        origin={442,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Loads.WyeLoad_1Ph SpotLoad652(
    C_pa=100,
    ModelType=1,
    P_a=128000,
    Q_a=86000) annotation (Placement(visible=true, transformation(
        origin={460,-10},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Buses.Bus_1Ph Bus611(angle_1=120) annotation (Placement(visible=
          true, transformation(
        origin={386,-62},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ThreePhase.Branches.Lines.Line_1Ph L684_611(Bser=-1.1456, Gser=1.1301)
    annotation (Placement(visible=true, transformation(
        origin={386,-32},
        extent={{-14,-10},{14,10}},
        rotation=-90)));
  ThreePhase.Loads.WyeLoad_1Ph SpotLoad611(
    AngA=2.0943951023932,
    B_pa=100,
    ModelType=1,
    P_a=0.17,
    Q_a=0.08) annotation (Placement(visible=true, transformation(
        origin={386,-88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Banks.CapacitorBank_1Ph CapacitorBank611(AngA=2.0943951023932, Q_a=
       100000)
    annotation (Placement(visible=true, transformation(
        origin={420,-88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Branches.Lines.Line_3Ph LRG60_632(
    Bseraa=-0.5712,
    Bserab=0.2112,
    Bserac=0.1579,
    Bserbb=-0.5413,
    Bserbc=0.1206,
    Bsercc=-0.5106,
    Gseraa=0.1982,
    Gserab=-0.0841,
    Gserac=-0.046,
    Gserbb=0.1735,
    Gserbc=-0.0219,
    Gsercc=0.1535) annotation (Placement(visible=true, transformation(
        origin={114,88},
        extent={{-14,-10},{14,10}},
        rotation=0)));
  ThreePhase.Buses.Bus_3Ph BusRG60(
    V_A=1.0625,
    V_B=1.05,
    V_C=1.0687) annotation (Placement(visible=true, transformation(
        origin={76,88},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Loads.DeltaLoad_3Ph SpotLoad671(
    P_ab=385000,
    P_bc=385000,
    P_ca=385000,
    Q_ab=220000,
    Q_bc=220000,
    Q_ca=220000)
               annotation (Placement(visible=true, transformation(
        origin={344,50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ThreePhase.Loads.DeltaLoad_2Ph SpotLoad692(
    AngA=2.0943951023932,
    AngB=0,
    B_ab=100,
    ModelType=1,
    P_ab=170000,
    Q_ab=151000,
    VA=1,
    VB=1) annotation (Placement(visible=true, transformation(
        origin={420,154},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThreePhase.Loads.DeltaLoad_2Ph SpotLoad646(
    AngA=-2.0943951023932,
    AngB=2.0943951023932,
    C_ab=100,
    ModelType=1,
    P_ab=230000,
    Q_ab=132000)
                annotation (Placement(visible=true, transformation(
        origin={166,-106},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Components.MeasurementBus measurementBus
    annotation (Placement(transformation(extent={{-6,78},{14,98}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_3 annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=-90,
        origin={5,59})));
  ExtremumSeeking.Objective_functions.Quadratic_objective_function_n_inputs objective_function_1_input(nin=6)
    annotation (Placement(transformation(extent={{22,-10},{42,10}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_1 annotation (Placement(
        transformation(
        extent={{7,-7},{-7,7}},
        rotation=180,
        origin={27,117})));
  Modelica.Blocks.Routing.Multiplex2 multiplex2_1(n1=3, n2=3)
                                                  annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=-90,
        origin={1,31})));
  Modelica.Blocks.Sources.Constant target_p_a(k=1)
    annotation (Placement(transformation(extent={{-56,-32},{-36,-12}})));
  Modelica.Blocks.Sources.Constant target_p_b(k=1.5)
    annotation (Placement(transformation(extent={{-56,-62},{-36,-42}})));
  Modelica.Blocks.Sources.Constant target_p_c(k=2)
    annotation (Placement(transformation(extent={{-56,-92},{-36,-72}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_2
    annotation (Placement(transformation(extent={{-24,-62},{-4,-42}})));
  Modelica.Blocks.Sources.Constant target_q_a(k=-0.2)
    annotation (Placement(transformation(extent={{-56,-124},{-36,-104}})));
  Modelica.Blocks.Sources.Constant target_q_b(k=-0.3)
    annotation (Placement(transformation(extent={{-56,-154},{-36,-134}})));
  Modelica.Blocks.Sources.Constant target_q_c(k=-0.1)
    annotation (Placement(transformation(extent={{-56,-184},{-36,-164}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_4
    annotation (Placement(transformation(extent={{-24,-154},{-4,-134}})));
  Modelica.Blocks.Routing.Multiplex2 multiplex2_2(n1=3, n2=3)
                                                  annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=90,
        origin={5,-21})));
  Components.Dyn_wye_3Ph_unbalanced dyn_wye_3Ph_unbalanced(
    P0_a=0,
    Q0_a=0,
    P0_b=0,
    Q0_b=0,
    P0_c=0,
    Q0_c=0) annotation (Placement(transformation(extent={{260,42},{280,62}})));
  Components.Dyn_wye_3Ph_unbalanced dyn_wye_3Ph_unbalanced1(
    P0_a=0,
    Q0_a=0,
    P0_b=0,
    Q0_b=0,
    P0_c=0,
    Q0_c=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={480,88})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_5
    annotation (Placement(transformation(extent={{234,-124},{254,-104}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_6
    annotation (Placement(transformation(extent={{238,-188},{258,-168}})));
  Components.Dyn_wye_2Ph_unbalanced dyn_wye_2Ph_unbalanced(
    P0_a=0,
    Q0_a=0,
    P0_b=0,
    Q0_b=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={142,-70})));
  Components.Dyn_wye_1Ph dyn_wye_1Ph(P0=0, Q0=0)
    annotation (Placement(transformation(extent={{344,-98},{364,-78}})));
  Modelica.Blocks.Routing.Multiplex2 multiplex2_4
    annotation (Placement(transformation(extent={{110,6},{130,26}})));
  Modelica.Blocks.Routing.Multiplex2 multiplex2_3
    annotation (Placement(transformation(extent={{110,-48},{130,-28}})));
  ExtremumSeeking.Controllers.Continuous.ES_ADV_2D eS_2D_cont(
    prob_amplitude_1=0.0001,
    integrator_gain_1=0.000002,
    prob_amplitude_2=0.0001,
    integrator_gain_2=0.000002,
    probe_frequency=sqrt(2))
    annotation (Placement(transformation(extent={{68,8},{88,28}})));
  ExtremumSeeking.Controllers.Continuous.ES_ADV_2D eS_2D_cont1(
    prob_amplitude_1=0.0001,
    integrator_gain_1=0.000002,
    prob_amplitude_2=0.0001,
    integrator_gain_2=0.000002,
    probe_frequency=sqrt(3))
    annotation (Placement(transformation(extent={{68,-50},{88,-30}})));
  ExtremumSeeking.Controllers.Continuous.ES_ADV_2D eS_2D_cont2(
    prob_amplitude_1=0.0001,
    integrator_gain_1=0.000002,
    prob_amplitude_2=0.0001,
    integrator_gain_2=0.000002,
    probe_frequency=sqrt(5)/2)
    annotation (Placement(transformation(extent={{194,-136},{214,-116}})));
  ExtremumSeeking.Controllers.Continuous.ES_ADV_2D eS_2D_cont3(
    prob_amplitude_1=0.0001,
    integrator_gain_1=0.000002,
    prob_amplitude_2=0.0001,
    integrator_gain_2=0.000002,
    probe_frequency=sqrt(7)/2)
    annotation (Placement(transformation(extent={{194,-162},{214,-142}})));
  ExtremumSeeking.Controllers.Continuous.ES_ADV_2D eS_2D_cont4(
    prob_amplitude_1=0.0001,
    integrator_gain_1=0.000002,
    prob_amplitude_2=0.0001,
    integrator_gain_2=0.000002,
    probe_frequency=sqrt(11/3))
    annotation (Placement(transformation(extent={{194,-190},{214,-170}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_9
    annotation (Placement(transformation(extent={{456,-132},{476,-112}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_10
    annotation (Placement(transformation(extent={{456,-188},{476,-168}})));
  ExtremumSeeking.Controllers.Continuous.ES_ADV_2D eS_2D_cont5(
    prob_amplitude_1=0.0001,
    integrator_gain_1=0.000002,
    prob_amplitude_2=0.0001,
    integrator_gain_2=0.000002,
    probe_frequency=sqrt(13)/3)
    annotation (Placement(transformation(extent={{410,-138},{430,-118}})));
  ExtremumSeeking.Controllers.Continuous.ES_ADV_2D eS_2D_cont6(
    prob_amplitude_1=0.0001,
    integrator_gain_1=0.000002,
    prob_amplitude_2=0.0001,
    integrator_gain_2=0.000002,
    probe_frequency=sqrt(17)/4)
    annotation (Placement(transformation(extent={{410,-164},{430,-144}})));
  ExtremumSeeking.Controllers.Continuous.ES_ADV_2D eS_2D_cont7(
    prob_amplitude_1=0.0001,
    integrator_gain_1=0.000002,
    prob_amplitude_2=0.0001,
    integrator_gain_2=0.000002,
    probe_frequency=sqrt(19)/4)
    annotation (Placement(transformation(extent={{410,-192},{430,-172}})));
  ExtremumSeeking.Controllers.Continuous.ES_ADV_2D eS_2D_cont8(
    prob_amplitude_1=0.0001,
    integrator_gain_1=0.000002,
    prob_amplitude_2=0.0001,
    integrator_gain_2=0.000002,
    probe_frequency=sqrt(23/4))
    annotation (Placement(transformation(extent={{318,-100},{338,-80}})));
equation
  connect(Bus646.p2, SpotLoad646.B) annotation (Line(points={{161.5,-44},{162,
          -44},{162,-95},{161.5,-95}},
                                  color={0,0,255}));
  connect(Bus646.p1, SpotLoad646.A) annotation (Line(points={{170.5,-44},{170,
          -44},{170,-95},{170.5,-95}},
                                  color={0,0,255}));
  connect(SpotLoad692.B, Bus692.p1) annotation (Line(points={{409,149.5},{372,
          149.5},{372,138},{373,138}}, color={0,0,255}));
  connect(SpotLoad692.A, Bus692.p3) annotation (Line(points={{409,158.5},{392,
          158.5},{392,138},{391,138}}, color={0,0,255}));
  connect(Bus671.p3, SpotLoad671.C) annotation (Line(points={{364,79},{336,79},
          {336,61},{335.1,61}}, color={0,0,255}));
  connect(Bus671.p2, SpotLoad671.B) annotation (Line(points={{364,88},{344,88},
          {344,61},{344,61}}, color={0,0,255}));
  connect(Bus671.p1, SpotLoad671.A) annotation (Line(points={{364,97},{352,97},
          {352,61},{352.9,61}}, color={0,0,255}));
  connect(BusRG60.p3, LRG60_632.Cin) annotation (Line(points={{76,79},{102,79},
          {102,79},{101,79}}, color={0,0,255}));
  connect(BusRG60.p2, LRG60_632.Bin) annotation (Line(points={{76,88},{102,88},
          {102,88},{101,88}}, color={0,0,255}));
  connect(BusRG60.p1, LRG60_632.Ain) annotation (Line(points={{76,97},{102,97},
          {102,97},{101,97}}, color={0,0,255}));
  connect(LRG60_632.Cout, Bus632.p3) annotation (Line(points={{127,79},{148,79},
          {148,79},{148,79}}, color={0,0,255}));
  connect(LRG60_632.Bout, Bus632.p2) annotation (Line(points={{127,88},{148,88},
          {148,88},{148,88}}, color={0,0,255}));
  connect(LRG60_632.Aout, Bus632.p1) annotation (Line(points={{127,97},{148,97},
          {148,97},{148,97}}, color={0,0,255}));
  connect(Bus632.p2, L632_633.Bin)
    annotation (Line(points={{148,88},{204,88},{204,131}}, color={0,0,255}));
  connect(Bus632.p3, L632_633.Cin)
    annotation (Line(points={{148,79},{213,79},{213,131}}, color={0,0,255}));
  connect(Bus632.p1, L632_633.Ain)
    annotation (Line(points={{148,97},{195,97},{195,131}}, color={0,0,255}));
  connect(Bus632.p1, L632_671.Ain)
    annotation (Line(points={{148,97},{182,97},{182,92},{214,92},{214,97},{281,
          97}},                                  color={0,0,255}));
  connect(Bus632.p3, L632_671.Cin)
    annotation (Line(points={{148,79},{182,79},{182,74},{214,74},{214,79},{281,
          79}},                                  color={0,0,255}));
  connect(Bus632.p2, L632_671.Bin)
    annotation (Line(points={{148,88},{182,88},{182,84},{214,84},{214,88},{281,
          88}},                                  color={0,0,255}));
  connect(Bus632.p3, DisLoad632.C) annotation (Line(points={{148,79},{217.1,79},
          {217.1,61}}, color={0,0,255}));
  connect(Bus632.p2, DisLoad632.B)
    annotation (Line(points={{148,88},{226,88},{226,61}}, color={0,0,255}));
  connect(Bus632.p1, DisLoad632.A) annotation (Line(points={{148,97},{236,97},{
          236,61},{234.9,61}}, color={0,0,255}));
  connect(Bus632.p2, L632_645.Ain) annotation (Line(points={{148,88},{170.5,88},
          {170.5,61}}, color={0,0,255}));
  connect(Bus632.p3, L632_645.Bin) annotation (Line(points={{148,79},{161.5,79},
          {161.5,61}}, color={0,0,255}));
  connect(Bus611.p1, CapacitorBank611.A) annotation (Line(points={{386,-62},{
          386,-72},{420,-72},{420,-77}}, color={0,0,255}));
  connect(SpotLoad611.A, Bus611.p1) annotation (Line(points={{386,-77},{386,-77},
          {386,-62},{386,-62}}, color={0,0,255}));
  connect(Bus684.p2, L684_611.Ain) annotation (Line(points={{385.5,12},{386,12},
          {386,-19},{386,-19}}, color={0,0,255}));
  connect(Bus611.p1, L684_611.Aout) annotation (Line(points={{386,-62},{386,-62},
          {386,-45},{386,-45}}, color={0,0,255}));
  connect(Bus652.p1, SpotLoad652.A) annotation (Line(points={{442,-10},{449,-10}},
                                color={0,0,255}));
  connect(L684_652.Aout, Bus652.p1) annotation (Line(points={{435,-10},{442,-10}},
                                color={0,0,255}));
  connect(L684_652.Ain, Bus684.p1) annotation (Line(points={{409,-10},{394,-10},
          {394,12},{394.5,12}}, color={0,0,255}));
  connect(L671_684.Bout, Bus684.p2) annotation (Line(points={{385.5,31},{385.5,
          31},{385.5,12},{385.5,12}}, color={0,0,255}));
  connect(L671_684.Aout, Bus684.p1) annotation (Line(points={{394.5,31},{394.5,
          31},{394.5,12},{394.5,12}}, color={0,0,255}));
  connect(Bus671.p3, L671_684.Bin) annotation (Line(points={{364,79},{386,79},{
          386,57},{385.5,57}}, color={0,0,255}));
  connect(Bus671.p1, L671_684.Ain) annotation (Line(points={{364,97},{394,97},{
          394,57},{394.5,57}}, color={0,0,255}));
  connect(L671_680.Cout, Bus680.p3) annotation (Line(points={{435,79},{456,79},
          {456,79},{456,79}}, color={0,0,255}));
  connect(L671_680.Bout, Bus680.p2) annotation (Line(points={{435,88},{456,88},
          {456,88},{456,88}}, color={0,0,255}));
  connect(L671_680.Aout, Bus680.p1) annotation (Line(points={{435,97},{456,97},
          {456,97},{456,97}}, color={0,0,255}));
  connect(Bus671.p3, L671_680.Cin) annotation (Line(points={{364,79},{408,79},{
          408,79},{409,79}}, color={0,0,255}));
  connect(Bus671.p2, L671_680.Bin) annotation (Line(points={{364,88},{408,88},{
          408,88},{409,88}}, color={0,0,255}));
  connect(Bus671.p1, L671_680.Ain) annotation (Line(points={{364,97},{408,97},{
          408,97},{409,97}}, color={0,0,255}));
  connect(Bus645.p1, SpotLoad645.A) annotation (Line(points={{170.5,8},{170,8},
          {170,8.88178e-16},{179,8.88178e-16}},
                                    color={0,0,255}));
  connect(L645_646.Bout, Bus646.p2) annotation (Line(points={{161.5,-33},{161.5,
          -44}},                         color={0,0,255}));
  connect(L645_646.Aout, Bus646.p1) annotation (Line(points={{170.5,-33},{170.5,
          -44}},                         color={0,0,255}));
  connect(Bus645.p2, L645_646.Bin) annotation (Line(points={{161.5,8},{162,8},{
          162,-7},{161.5,-7}},  color={0,0,255}));
  connect(Bus645.p1, L645_646.Ain) annotation (Line(points={{170.5,8},{170,8},{
          170,-7},{170.5,-7}},  color={0,0,255}));
  connect(L632_645.Bout, Bus645.p2) annotation (Line(points={{161.5,35},{161.5,
          8}},                        color={0,0,255}));
  connect(L632_645.Aout, Bus645.p1) annotation (Line(points={{170.5,35},{170.5,
          8}},                        color={0,0,255}));
  connect(Bus692.p3, L692_675.Cin) annotation (Line(points={{391,138},{391,145},
          {391,145},{391,171}}, color={0,0,255}));
  connect(Bus692.p2, L692_675.Bin)
    annotation (Line(points={{382,138},{382,171}}, color={0,0,255}));
  connect(L692_675.Ain, Bus692.p1)
    annotation (Line(points={{373,171},{373,171},{373,138}}, color={0,0,255}));
  connect(L692_675.Bout, Bus675.p2)
    annotation (Line(points={{382,197},{382,210}}, color={0,0,255}));
  connect(Bus675.p1, L692_675.Aout)
    annotation (Line(points={{373,210},{373,197}}, color={0,0,255}));
  connect(Bus675.p3, L692_675.Cout)
    annotation (Line(points={{391,210},{391,197}}, color={0,0,255}));
  connect(Bus671.p3, breaker3.s) annotation (Line(points={{364,79},{390,79},{390,
          112},{390,112}},     color={0,0,255}));
  connect(Bus671.p2, breaker2.s) annotation (Line(points={{364,88},{382,88},{382,
          118},{382,118}},     color={0,0,255}));
  connect(Bus671.p1, breaker.s) annotation (Line(points={{364,97},{374,97},{374,
          112},{374,112}}, color={0,0,255}));
  connect(breaker3.r, Bus692.p3) annotation (Line(points={{390,120},{390,120},{390,
          138},{391,138}},     color={0,0,255}));
  connect(breaker2.r, Bus692.p2) annotation (Line(points={{382,126},{382,126},{382,
          138},{382,138}},     color={0,0,255}));
  connect(breaker.r, Bus692.p1) annotation (Line(points={{374,120},{374,120},{374,
          138},{373,138}},     color={0,0,255}));
  connect(Bus671.p3, DistLoad671.C) annotation (Line(points={{364,79},{312,79},{
          312,59},{311.1,59}},  color={0,0,255}));
  connect(Bus671.p2, DistLoad671.B) annotation (Line(points={{364,88},{320,88},{
          320,59}},           color={0,0,255}));
  connect(Bus671.p1, DistLoad671.A) annotation (Line(points={{364,97},{330,97},{
          330,59},{328.9,59}},  color={0,0,255}));
  connect(CapBank675.A, Bus675.p1) annotation (Line(points={{409,234.9},{374,
          234.9},{374,210},{373,210}}, color={0,0,255}));
  connect(Bus675.p2, CapBank675.B) annotation (Line(points={{382,210},{382,210},
          {382,226},{409,226},{409,226}}, color={0,0,255}));
  connect(Bus675.p3, CapBank675.C) annotation (Line(points={{391,210},{390,210},
          {390,217.1},{409,217.1}}, color={0,0,255}));
  connect(SpotLoad675.C, Bus675.p3) annotation (Line(points={{390.9,245},{390.9,
          228},{391,228},{391,210}}, color={0,0,255}));
  connect(SpotLoad675.B, Bus675.p2)
    annotation (Line(points={{382,245},{382,210}}, color={0,0,255}));
  connect(SpotLoad675.A, Bus675.p1) annotation (Line(points={{373.1,245},{372.1,
          245},{372.1,210},{373,210}}, color={0,0,255}));
  connect(L632_671.Aout, Bus671.p1)
    annotation (Line(points={{307,97},{364,97}}, color={0,0,255}));
  connect(L632_671.Bout, Bus671.p2)
    annotation (Line(points={{307,88},{364,88}}, color={0,0,255}));
  connect(L632_671.Cout, Bus671.p3)
    annotation (Line(points={{307,79},{364,79}}, color={0,0,255}));
  connect(SpotLoad634.C, Bus634.p3) annotation (Line(points={{212.9,257},{214,
          257},{214,238},{213,238}}, color={0,0,255}));
  connect(SpotLoad634.B, Bus634.p2) annotation (Line(points={{204,257},{204,257},
          {204,238},{204,238}}, color={0,0,255}));
  connect(Bus634.p1, SpotLoad634.A) annotation (Line(points={{195,238},{194,238},
          {194,257},{195.1,257}}, color={0,0,255}));
  connect(XFM1.Cout, Bus634.p3) annotation (Line(points={{213,225},{213,225},{
          213,238},{213,238}}, color={0,0,255}));
  connect(XFM1.Bout, Bus634.p2) annotation (Line(points={{204,225},{204,225},{
          204,238},{204,238}}, color={0,0,255}));
  connect(XFM1.Aout, Bus634.p1) annotation (Line(points={{195,225},{195,225},{
          195,238},{195,238}}, color={0,0,255}));
  connect(XFM1.Cin, Bus633.p3) annotation (Line(points={{213,207},{213,207},{
          213,192},{213,192}}, color={0,0,255}));
  connect(XFM1.Bin, Bus633.p2) annotation (Line(points={{204,207},{204,207},{
          204,192},{204,192}}, color={0,0,255}));
  connect(XFM1.Ain, Bus633.p1) annotation (Line(points={{195,207},{195,207},{
          195,192},{195,192}}, color={0,0,255}));
  connect(L632_633.Cout, Bus633.p3) annotation (Line(points={{213,157},{213,157},
          {213,192},{213,192}}, color={0,0,255}));
  connect(L632_633.Aout, Bus633.p1)
    annotation (Line(points={{195,157},{195,192}}, color={0,0,255}));
  connect(L632_633.Bout, Bus633.p2)
    annotation (Line(points={{204,157},{204,192}}, color={0,0,255}));
  connect(InfBus.p1, measurementBus.p4)
    annotation (Line(points={{-39,97},{-5,97}}, color={0,0,255}));
  connect(measurementBus.p1, BusRG60.p1)
    annotation (Line(points={{13,97},{76,97}}, color={0,0,255}));
  connect(InfBus.p2, measurementBus.p5)
    annotation (Line(points={{-39,88},{-5,88}}, color={0,0,255}));
  connect(measurementBus.p2, BusRG60.p2)
    annotation (Line(points={{13,88},{76,88}}, color={0,0,255}));
  connect(InfBus.p3, measurementBus.p6)
    annotation (Line(points={{-39,79},{-5,79}}, color={0,0,255}));
  connect(measurementBus.p3, BusRG60.p3)
    annotation (Line(points={{13,79},{76,79}}, color={0,0,255}));
  connect(measurementBus.pc, multiplex3_3.u3[1]) annotation (Line(points={{-1,75.6},
          {-1,70.8},{0.1,70.8},{0.1,67.4}}, color={0,0,127}));
  connect(measurementBus.pb, multiplex3_3.u2[1]) annotation (Line(points={{4.2,75.6},
          {4.2,70.8},{5,70.8},{5,67.4}}, color={0,0,127}));
  connect(measurementBus.pa, multiplex3_3.u1[1]) annotation (Line(points={{9.2,75.6},
          {9.2,70.8},{9.9,70.8},{9.9,67.4}}, color={0,0,127}));
  connect(multiplex3_1.u1[1], measurementBus.qa) annotation (Line(points={{18.6,
          112.1},{18.6,111.05},{10,111.05},{10,99}}, color={0,0,127}));
  connect(multiplex3_1.u2[1], measurementBus.qb) annotation (Line(points={{18.6,
          117},{18.6,115.5},{4,115.5},{4,99}}, color={0,0,127}));
  connect(multiplex3_1.u3[1], measurementBus.qc) annotation (Line(points={{18.6,
          121.9},{18.6,120.95},{-1,120.95},{-1,99}}, color={0,0,127}));
  connect(multiplex3_3.y, multiplex2_1.u1) annotation (Line(points={{5,51.3},{5,
          45.65},{5.2,45.65},{5.2,39.4}}, color={0,0,127}));
  connect(multiplex3_1.y, multiplex2_1.u2) annotation (Line(points={{34.7,117},{
          46,117},{46,132},{-20,132},{-20,39.4},{-3.2,39.4}}, color={0,0,127}));
  connect(multiplex2_1.y, objective_function_1_input.Inputs) annotation (Line(
        points={{1,23.3},{1.5,23.3},{1.5,2.2},{20,2.2}}, color={0,0,127}));
  connect(target_p_b.y, multiplex3_2.u2[1])
    annotation (Line(points={{-35,-52},{-26,-52}}, color={0,0,127}));
  connect(target_p_a.y, multiplex3_2.u1[1]) annotation (Line(points={{-35,-22},{
          -30,-22},{-30,-45},{-26,-45}}, color={0,0,127}));
  connect(target_p_c.y, multiplex3_2.u3[1]) annotation (Line(points={{-35,-82},{
          -32,-82},{-32,-59},{-26,-59}}, color={0,0,127}));
  connect(target_q_b.y, multiplex3_4.u2[1])
    annotation (Line(points={{-35,-144},{-26,-144}}, color={0,0,127}));
  connect(target_q_a.y, multiplex3_4.u1[1]) annotation (Line(points={{-35,-114},
          {-30,-114},{-30,-137},{-26,-137}}, color={0,0,127}));
  connect(target_q_c.y, multiplex3_4.u3[1]) annotation (Line(points={{-35,-174},
          {-32,-174},{-32,-151},{-26,-151}}, color={0,0,127}));
  connect(multiplex3_2.y, multiplex2_2.u1) annotation (Line(points={{-3,-52},{0,
          -52},{0,-29.4},{0.8,-29.4}}, color={0,0,127}));
  connect(multiplex3_4.y, multiplex2_2.u2) annotation (Line(points={{-3,-144},{9.2,
          -144},{9.2,-29.4}}, color={0,0,127}));
  connect(multiplex2_2.y, objective_function_1_input.Targets) annotation (Line(
        points={{5,-13.3},{5,6.35},{20,6.35},{20,6.8}}, color={0,0,127}));
  connect(Bus680.p1, dyn_wye_3Ph_unbalanced1.A) annotation (Line(points={{456,97},
          {463,97},{463,96.9},{469,96.9}}, color={0,0,255}));
  connect(Bus680.p2, dyn_wye_3Ph_unbalanced1.B)
    annotation (Line(points={{456,88},{469,88}}, color={0,0,255}));
  connect(Bus680.p3, dyn_wye_3Ph_unbalanced1.C) annotation (Line(points={{456,79},
          {463,79},{463,79.1},{469,79.1}}, color={0,0,255}));
  connect(multiplex3_5.y, dyn_wye_3Ph_unbalanced.P_in) annotation (Line(points={{255,
          -114},{258,-114},{258,54},{264,54}},  color={0,0,127}));
  connect(dyn_wye_3Ph_unbalanced.Q_in, multiplex3_6.y) annotation (Line(points={{264,46},
          {264,-178},{259,-178}},                 color={0,0,127}));
  connect(dyn_wye_3Ph_unbalanced.C, L632_671.Cin) annotation (Line(points={{261.1,
          63},{260,78},{260,79},{281,79}}, color={0,0,255}));
  connect(dyn_wye_3Ph_unbalanced.B, L632_671.Bin)
    annotation (Line(points={{270,63},{270,88},{281,88}}, color={0,0,255}));
  connect(dyn_wye_3Ph_unbalanced.A, L632_671.Ain) annotation (Line(points={{278.9,
          63},{276,96},{276,97},{281,97}}, color={0,0,255}));
  connect(dyn_wye_1Ph.A, Bus611.p1) annotation (Line(points={{354.1,-77},{354,
          -77},{354,-72},{386,-72},{386,-62}}, color={0,0,255}));
  connect(dyn_wye_2Ph_unbalanced.A, SpotLoad646.A) annotation (Line(points={{
          153,-74.9},{170,-74.9},{170,-95},{170.5,-95}}, color={0,0,255}));
  connect(dyn_wye_2Ph_unbalanced.B, SpotLoad646.B) annotation (Line(points={{
          153,-65},{162,-65},{162,-95},{161.5,-95}}, color={0,0,255}));
  connect(multiplex2_3.y, dyn_wye_2Ph_unbalanced.Q_in)
    annotation (Line(points={{131,-38},{136,-38},{136,-64}}, color={0,0,127}));
  connect(multiplex2_4.y, dyn_wye_2Ph_unbalanced.P_in)
    annotation (Line(points={{131,16},{144,16},{144,-64}}, color={0,0,127}));
  connect(eS_2D_cont.y, multiplex2_4.u1[1])
    annotation (Line(points={{89,22},{108,22}}, color={0,0,127}));
  connect(eS_2D_cont.y1, multiplex2_3.u1[1]) annotation (Line(points={{89,14},{94,
          14},{94,-32},{108,-32}}, color={0,0,127}));
  connect(eS_2D_cont1.y1, multiplex2_3.u2[1])
    annotation (Line(points={{89,-44},{108,-44}}, color={0,0,127}));
  connect(eS_2D_cont1.y, multiplex2_4.u2[1]) annotation (Line(points={{89,-36},{
          100,-36},{100,10},{108,10}}, color={0,0,127}));
  connect(eS_2D_cont4.y1, multiplex3_6.u3[1]) annotation (Line(points={{215,-184},
          {212,-184},{212,-185},{236,-185}}, color={0,0,127}));
  connect(eS_2D_cont3.y1, multiplex3_6.u2[1]) annotation (Line(points={{215,-156},
          {230,-156},{230,-178},{236,-178}}, color={0,0,127}));
  connect(eS_2D_cont2.y1, multiplex3_6.u1[1]) annotation (Line(points={{215,-130},
          {234,-130},{234,-171},{236,-171}}, color={0,0,127}));
  connect(eS_2D_cont2.y, multiplex3_5.u1[1]) annotation (Line(points={{215,-122},
          {218,-122},{218,-107},{232,-107}}, color={0,0,127}));
  connect(multiplex3_5.u2[1], eS_2D_cont3.y) annotation (Line(points={{232,-114},
          {222,-114},{222,-148},{215,-148}}, color={0,0,127}));
  connect(multiplex3_5.u3[1], eS_2D_cont4.y) annotation (Line(points={{232,-121},
          {226,-121},{226,-176},{215,-176}}, color={0,0,127}));
  connect(eS_2D_cont7.y1, multiplex3_10.u3[1]) annotation (Line(points={{431,-186},
          {428,-186},{428,-185},{454,-185}}, color={0,0,127}));
  connect(eS_2D_cont6.y1, multiplex3_10.u2[1]) annotation (Line(points={{431,-158},
          {446,-158},{446,-178},{454,-178}}, color={0,0,127}));
  connect(eS_2D_cont5.y1, multiplex3_10.u1[1]) annotation (Line(points={{431,-132},
          {450,-132},{450,-171},{454,-171}}, color={0,0,127}));
  connect(eS_2D_cont5.y, multiplex3_9.u1[1]) annotation (Line(points={{431,-124},
          {434,-124},{434,-115},{454,-115}}, color={0,0,127}));
  connect(multiplex3_9.u2[1], eS_2D_cont6.y) annotation (Line(points={{454,-122},
          {438,-122},{438,-150},{431,-150}}, color={0,0,127}));
  connect(multiplex3_9.u3[1], eS_2D_cont7.y) annotation (Line(points={{454,-129},
          {442,-129},{442,-178},{431,-178}}, color={0,0,127}));
  connect(multiplex3_10.y, dyn_wye_3Ph_unbalanced1.Q_in) annotation (Line(
        points={{477,-178},{486,-178},{486,82}}, color={0,0,127}));
  connect(multiplex3_9.y, dyn_wye_3Ph_unbalanced1.P_in) annotation (Line(points=
         {{477,-122},{478,-122},{478,82}}, color={0,0,127}));
  connect(eS_2D_cont8.y, dyn_wye_1Ph.P_in)
    annotation (Line(points={{339,-86},{348,-86}}, color={0,0,127}));
  connect(eS_2D_cont8.y1, dyn_wye_1Ph.Q_in)
    annotation (Line(points={{339,-94},{348,-94}}, color={0,0,127}));
  connect(objective_function_1_input.obj_fn, eS_2D_cont.u)
    annotation (Line(points={{44,0},{56,0},{56,18},{66,18}}, color={0,0,127}));
  connect(eS_2D_cont1.u, objective_function_1_input.obj_fn) annotation (Line(
        points={{66,-40},{56,-40},{56,0},{44,0}}, color={0,0,127}));
  connect(eS_2D_cont2.u, objective_function_1_input.obj_fn) annotation (Line(
        points={{192,-126},{56,-126},{56,0},{44,0}}, color={0,0,127}));
  connect(eS_2D_cont3.u, objective_function_1_input.obj_fn) annotation (Line(
        points={{192,-152},{56,-152},{56,0},{44,0}}, color={0,0,127}));
  connect(eS_2D_cont4.u, objective_function_1_input.obj_fn) annotation (Line(
        points={{192,-180},{56,-180},{56,0},{44,0}}, color={0,0,127}));
  connect(eS_2D_cont7.u, objective_function_1_input.obj_fn) annotation (Line(
        points={{408,-182},{306,-182},{306,-198},{56,-198},{56,0},{44,0}},
        color={0,0,127}));
  connect(eS_2D_cont6.u, objective_function_1_input.obj_fn) annotation (Line(
        points={{408,-154},{306,-154},{306,-198},{56,-198},{56,0},{44,0}},
        color={0,0,127}));
  connect(eS_2D_cont5.u, objective_function_1_input.obj_fn) annotation (Line(
        points={{408,-128},{306,-128},{306,-198},{56,-198},{56,0},{44,0}},
        color={0,0,127}));
  connect(eS_2D_cont8.u, objective_function_1_input.obj_fn) annotation (Line(
        points={{316,-90},{306,-90},{306,-198},{56,-198},{56,0},{44,0}}, color={
          0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-60,-280},{500,300}})),
    Icon(coordinateSystem(extent={{-60,-280},{500,300}})),
    __OpenModelica_commandLineOptions="",
    experiment(
      StopTime=70,
      Interval=0.001,
      Tolerance=1e-06));
end IEEE13_ThreePhase;
