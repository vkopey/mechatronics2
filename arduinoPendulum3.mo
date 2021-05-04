model arduinoPendulum3
  inner PlanarMechanics.PlanarWorld planarWorld(defaultN_to_m = 10, defaultWidthFraction = 10) annotation(
    Placement(visible = true, transformation(extent = {{-64, 34}, {-44, 54}}, rotation = 0)));
  PlanarMechanics.Sensors.CutForce cutForce(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_a) annotation(
    Placement(visible = true, transformation(extent = {{20, -10}, {40, 10}}, rotation = 0)));
  PlanarMechanics.Parts.FixedTranslation fixedTranslation(animate = true, r = {1, 0}) annotation(
    Placement(visible = true, transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PlanarMechanics.Joints.Revolute revolute(phi(displayUnit = "rad",fixed = true, start = 0), stateSelect = StateSelect.always, useFlange = true, w(fixed = true, start = 0)) annotation(
    Placement(visible = true, transformation(extent = {{-40, -10}, {-20, 10}}, rotation = 0)));
  PlanarMechanics.Parts.Fixed fixed(phi = 0) annotation(
    Placement(visible = true, transformation(origin = {-68, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  PlanarMechanics.Parts.Body body(I = 0.1, animate = true, enableGravity = true, m = 1, phi(displayUnit = "rad")) annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(
    Placement(visible = true, transformation(origin = {-14, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Encoder encoder(angle = 90) annotation(
    Placement(visible = true, transformation(origin = {46, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.RealToBoolean realToBoolean annotation(
    Placement(visible = true, transformation(origin = {74, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 10000) annotation(
    Placement(visible = true, transformation(origin = {112, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch sensorGround5V annotation(
    Placement(visible = true, transformation(extent = {{78, -102}, {98, -82}}, rotation = 0)));
  Arduino.Components.ArduinoUno arduinoUno annotation(
    Placement(visible = true, transformation(origin = {46, -84}, extent = {{-16, -20}, {16, 20}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 5) annotation(
    Placement(visible = true, transformation(origin = {-18, -94}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {46, -132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k =  57.29577951308232)  annotation(
    Placement(visible = true, transformation(origin = {16, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Arduino.Components.Servo servo annotation(
    Placement(visible = true, transformation(origin = {-70, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.ElastoBacklash elastoBacklash(b = -6.108652381980152, c = 1, d = 0.1, phi_rel(displayUnit = "rad"))  annotation(
    Placement(visible = true, transformation(origin = {-40, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PlanarMechanics.Sensors.Distance distance annotation(
    Placement(visible = true, transformation(origin = {60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PlanarMechanics.Parts.Fixed fixed1(phi = 0, r = {0, -1}) annotation(
    Placement(visible = true, transformation(origin = {112, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Potentiometer potentiometer(rConstant = 0.5, useRinput = true) annotation(
    Placement(visible = true, transformation(origin = {6, -84}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / 2)  annotation(
    Placement(visible = true, transformation(origin = {32, -48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-20, 0}, {-15, 0}, {-10, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(cutForce.frame_b, body.frame_a) annotation(
    Line(points = {{40, 0}, {60, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(revolute.frame_a, fixed.frame) annotation(
    Line(points = {{-40, 0}, {-58, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(fixedTranslation.frame_b, cutForce.frame_a) annotation(
    Line(points = {{10, 0}, {20, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(revolute.flange_a, angleSensor.flange) annotation(
    Line(points = {{-30, -10}, {-30, 46}, {-24, 46}}));
  connect(encoder.y, realToBoolean.u) annotation(
    Line(points = {{57, 46}, {62, 46}}, color = {0, 0, 127}));
  connect(sensorGround5V.n1, resistor.p) annotation(
    Line(points = {{98, -88}, {112, -88}, {112, -100}}, color = {0, 0, 255}));
  connect(arduinoUno.D2, sensorGround5V.p) annotation(
    Line(points = {{62, -93}, {78, -93}}, color = {0, 0, 255}));
  connect(sensorGround5V.n2, arduinoUno.Vin) annotation(
    Line(points = {{98, -92}, {108, -92}, {108, -64}, {46, -64}}, color = {0, 0, 255}));
  connect(constantVoltage.p, arduinoUno.Vin) annotation(
    Line(points = {{-18, -84}, {-18, -64}, {46, -64}}, color = {0, 0, 255}));
  connect(ground.p, arduinoUno.GND) annotation(
    Line(points = {{46, -122}, {46, -104}}, color = {0, 0, 255}));
  connect(constantVoltage.n, ground.p) annotation(
    Line(points = {{-18, -104}, {-18, -122}, {46, -122}}, color = {0, 0, 255}));
  connect(ground.p, resistor.n) annotation(
    Line(points = {{46, -122}, {112, -122}, {112, -120}}, color = {0, 0, 255}));
  connect(realToBoolean.y, sensorGround5V.control) annotation(
    Line(points = {{86, 46}, {88, 46}, {88, -80}}, color = {255, 0, 255}));
  connect(gain.y, encoder.u) annotation(
    Line(points = {{28, 46}, {34, 46}}, color = {0, 0, 127}));
  connect(angleSensor.phi, gain.u) annotation(
    Line(points = {{-2, 46}, {4, 46}}, color = {0, 0, 127}));
  connect(servo.GND, ground.p) annotation(
    Line(points = {{-80, -66}, {-80, -122}, {46, -122}}, color = {0, 0, 255}));
  connect(arduinoUno.D9, servo.SIG) annotation(
    Line(points = {{62, -78}, {72, -78}, {72, -142}, {-84, -142}, {-84, -58}, {-80, -58}}, color = {0, 0, 255}));
  connect(elastoBacklash.flange_b, revolute.flange_a) annotation(
    Line(points = {{-30, -62}, {-30, -10}}));
  connect(servo.flange, elastoBacklash.flange_a) annotation(
    Line(points = {{-60, -62}, {-50, -62}}));
  connect(distance.frame_b, fixed1.frame) annotation(
    Line(points = {{70, -30}, {91, -30}, {91, 0}, {102, 0}}));
  connect(potentiometer.pin_p, arduinoUno.Vin) annotation(
    Line(points = {{6, -74}, {6, -64}, {46, -64}}, color = {0, 0, 255}));
  connect(potentiometer.pin_n, ground.p) annotation(
    Line(points = {{6, -94}, {6, -122}, {46, -122}}, color = {0, 0, 255}));
  connect(potentiometer.contact, arduinoUno.A0) annotation(
    Line(points = {{16, -94}, {22, -94}, {22, -84}, {30, -84}}, color = {0, 0, 255}));
  connect(gain1.u, distance.distance) annotation(
    Line(points = {{44, -48}, {60, -48}, {60, -41}}, color = {0, 0, 127}));
  connect(potentiometer.r, gain1.y) annotation(
    Line(points = {{18, -74}, {22, -74}, {22, -48}}, color = {0, 0, 127}));
  connect(cutForce.frame_b, distance.frame_a) annotation(
    Line(points = {{40, 0}, {50, 0}, {50, -30}}));
  annotation(
    uses(PlanarMechanics(version = "1.4.1"), Modelica(version = "3.2.3"), Arduino(version = "0.1.0")));
end arduinoPendulum3;
