program b2zd11;
var 
  arr:Array[0..19] of integer;
  arr1:Array[0..20] of integer;
  ln, first, count:integer;
  flag : boolean;
begin
  count:=0;
  flag:=True;
  for i:integer:=0 to 19 do
  begin
    arr[i]:=random(101) - 50;
    if arr[i] mod 2 = 0 then count:=count+1;
    if (arr[i] mod 2 = 0) and flag = True then 
    begin
      first := i;
      flag := False;
    end;
  end;
  
  writeln('Массив: ');
  writeln(arr);
  
  for i:integer:=0 to first do
    arr1[i]:=arr[i];
  arr1[first+1]:=count;
  for i:integer:=first + 2 to 19 do
    arr1[i]:=arr[i - 1];
  arr1[20]:=arr[19];
  
  writeln;
  writeln('Конечный результат');
  writeln(arr1);
end.