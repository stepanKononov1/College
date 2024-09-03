program b2zd10;
var 
  arr:Array[0..19] of integer; 
  arr1:Array of integer; 
  ln, j1:integer;
begin
  ln:=0;
  for i:integer:=0 to 19 do
  begin
    arr[i]:=random(101) - 50;
    if arr[i] < 0 then ln:=ln+1;
  end;
  
  writeln('Массив: ');
  writeln(arr);
  
  setlength(arr1, ln);
  
  j1:=0;
  for i:integer:=0 to ln do
    for j:integer:=j1 to 19 do
      if arr[j] < 0 then begin arr1[i]:=arr[j]; j1:=j+1; break; end;
    
  writeln;
  writeln('Конечный результат:');
  writeln(arr1);
end.