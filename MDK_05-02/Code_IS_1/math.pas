Unit math;
uses GraphABC;

procedure RLine(x, y, x1, y1: real) := Line(Round(x), Round(y), Round(x1), Round(y1));

function GetAngle(x, y, x2, y2: real): real;
begin
  if (x2 = x) and (y2 = y) then
    Result := 0
  else begin
  var angle := Abs(RadToDeg(ArcTan((y2 - y) / (x2 - x))));
  if x2 > x then
    if y2 > y then Result := angle else Result := 360 - angle
    else
  if y2 > y then Result := 180 - angle else Result := 180 + angle;
  end;
end;

function Distance(x, y, x1, y1: real) := Sqrt(Sqr(x1 - x) + Sqr(y1 - y)); 
procedure Draw(x, y, x1, y1, lvl: real);
begin
  var r := Distance(x, y, x1, y1);
  if lvl < 1 then
    RLine(x, y, x1, y1)
  else
  begin
    var angle := GetAngle(x, y, x1, y1);
    var angleP := DegToRad(angle + 90);
    var angleM := DegToRad(angle - 90);
    r /= 4;
    var dx := (x1 - x) / 4;
    var dy := (y1 - y) / 4;
    var xA := x + dx;
    var yA := y + dy;
    var xB := xA + dx;
    var yB := yA + dy;
    var xC := xB + dx;
    var yC := yB + dy;
    var x2 := xA + r * Cos(angleP);
    var y2 := yA + r * Sin(angleP);
    var x3 := xB + r * Cos(angleP);
    var y3 := yB + r * Sin(angleP);
    var x4 := xB + r * Cos(angleM);
    var y4 := yB + r * Sin(angleM);
    var x5 := xC + r * Cos(angleM);
    var y5 := yC + r * Sin(angleM);
    Draw(x, y, xA, yA, lvl - 1);
    Draw(xA, yA, x2, y2, lvl - 1);
    Draw(x2, y2, x3, y3, lvl - 1);
    Draw(x3, y3, xB, yB, lvl - 1);
    Draw(xB, yB, x4, y4, lvl - 1);
    Draw(x4, y4, x5, y5, lvl - 1);
    Draw(x5, y5, xC, yC, lvl - 1);
    Draw(xC, yC, x1, y1, lvl - 1);
  end;
end;

begin
  
end. 