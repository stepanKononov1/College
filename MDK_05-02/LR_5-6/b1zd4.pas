program b1zd4;
var A: Array[0..29] of integer; B: Array of integer; ln, j: integer;
begin
  ln:=0;
  for i:integer:=0 to 29 do
  begin
    A[i]:=random(167) - 99;
    if A[i] mod 10 = 0 then ln:=ln+1;
  end;
  setlength(B, ln);
  j:=0;
  for i:integer:=0 to 29 do
    if A[i] mod 10 = 0 then begin B[j]:=A[i]; j:=j+1; end;
  writeln('Массив: ');
  writeln(A);
  writeln('Массив чётных элементов ');
  writeln(B);
end.