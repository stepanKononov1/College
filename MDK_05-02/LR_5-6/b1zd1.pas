Program b1zd1;
var arr: Array[1..20] of integer; x: integer;
begin
  for i:integer:=1 to 20 do
  begin
    writeln('Введите значение');
    read(x);
    if x > 0 then x:=0 else if x < 0 then x:=x*x;
    arr[i]:=x;
  end;
  writeln('Изменённый массив: ');
  writeln(arr);
end.