uses GraphABC, math;
 
var x, y, x1, y1, lvl: integer;
 
procedure KeyDown(key: integer);
begin
  TextOut(0,0,'X - уменьшить глубину прорисовки');
  TextOut(0,15,'S - увеличить глубину прорисовки');
  TextOut(0,30,'Z - уменьшить масштаб');
  TextOut(0,45,'A - увеличить масштаб');
  TextOut(0,60,'Стрелки - двигать фигуру');
  case key of
    VK_Up: begin y := y - 15; y1 := y1 - 15 end;
    VK_Down: begin y += 15; y1 += 15 end;
    VK_Left: begin x := x - 15; x1 := x1 - 15 end;
    VK_Right: begin x := x + 15; x1 := x1 + 15 end;
    VK_A: begin x := x - 50; x1 +=50; end;
    VK_Z: begin x := x + 50; x1 -=50; end;
    vk_x: if lvl > 0 then lvl -= 1;
    vk_s: lvl += 1; 
  end; 
  Window.Clear; 
  draw(x, y, x1, y1, lvl);
  TextOut(0,0,'X - уменьшить глубину прорисовки');
  TextOut(0,15,'S - увеличить глубину прорисовки');
  TextOut(0,30,'Z - уменьшить масштаб');
  TextOut(0,45,'A - увеличить масштаб');
  TextOut(0,60,'Стрелки - двигать фигуру');
  redraw;
end;
 
begin
  LockDrawing;
  x := 100;
  y := 200;
  x1 := 400;
  y1 := 200;
  lvl:= 1;
  draw(x, y, x1, y1, lvl);
  redraw;
  onKeyDown := keydown;
end.