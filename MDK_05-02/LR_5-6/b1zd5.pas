program b1zd5;
var arr1, arr2: Array[0..19] of integer; sum1, sum2: integer;
begin
  sum1:=0;
  sum2:=0;
  for i:integer:= 0 to 19 do
  begin
    arr1[i]:=random(51) - 25;
    arr2[i]:=random(51) - 25;
  end;
  writeln('Первый массив: ');
  writeln(arr1);
  writeln('Второй массив: ');
  writeln(arr2);
  writeln;
  for i:integer:=0 to 19 do
  begin
    if arr1[i] > 0 then sum1:=sum1+arr1[i];
    if arr2[i] > 0 then sum2:=sum2+arr2[i];
  end;
  if sum1 > sum2 then for i:integer:=0 to 19 do arr1[i]:=arr1[i]*10;
  if sum2 > sum1 then for i:integer:=0 to 19 do arr2[i]:=arr2[i]*10;
  writeln('Результаты: ');
  if sum1 > sum2 then begin writeln('Изменён первый массив: '); writeln(arr1) end;
  if sum2 > sum1 then begin writeln('Изменён второй массив: '); writeln(arr2) end;
end.