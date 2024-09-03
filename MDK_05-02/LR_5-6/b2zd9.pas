program b2zd9;
var 
  arr:Array of integer;
  first, min:integer;
begin
  setlength(arr, 20);
  for i:integer:=0 to 19 do
    arr[i]:=random(101) - 50;
  
  writeln('Массив: ');
  writeln(arr);
  
  for i:integer:=0 to 19 do
    if arr[i] >= 0 then begin first := i; break; end;

  for i:integer:=first to 18 do
    arr[i]:=arr[i+1];
  setlength(arr, 19);
  
  min:=min.MaxValue;
  for i:integer:=0 to 18 do
    if min>arr[i] then min:=i;
  
  for i:integer:=min to 17 do
    arr[i]:=arr[i+1];
  setlength(arr, 18);
  
  writeln;
  writeln('Конечный результат:');
  writeln(arr);
end.