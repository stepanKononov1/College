program b1zd3;
var arr: Array[1..20] of integer; max, min, mxcount, mncount, mk, mkcount: integer;
begin
  for i:integer:=1 to 20 do
    arr[i]:=random(118) - 52;
  for i:integer:=1 to 20 do
    for j:integer:=2 to 20 do
      if arr[i] = arr[j] then arr[j]:=arr[j]+1;
  max:=arr[1];
  mk:=1;
  min:= min.MaxValue;
  for i:integer:=2 to 20 do
  begin
    if max < arr[i] then begin max:=arr[i]; mxcount:=i end;
    if (arr[i]>0) and (min>arr[i]) then begin min:=arr[i]; mncount:=i end;
    if arr[i] mod 5 = 0 then begin mk:=arr[i]; mkcount:=i end;
  end;
  writeln('Массив: ', arr);
  writeln('Наибольший элемент массива и его номер: ', max, ' ', mxcount);
  if min = min.MaxValue then writeln('Наименьшего положительного элемента массива нет')
  else writeln('Наименьший положительный элемент массива и его номер: ', min, ' ', mncount);
  if mk = 1 then writeln('Нет элементов, кратных пяти')
  else writeln('Последний элемент, кратный пяти и его номер: ', mk, ' ', mkcount);
end.