block Encoder
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real angle(start=90);
equation
//y = if noEvent(mod(u,90) >= 0 and mod(u,90) <= 45) then 1 else 0;
  if noEvent(mod(u, angle) >= 0 and mod(u, angle) <= angle / 2) then
    y = 1;
  else
    y = 0;
  end if;
  annotation(
    Icon(graphics = {Text(origin = {1, 7.36122e-12}, extent = {{-97, 86}, {97, -86}}, textString = "Encoder")}));
end Encoder;
