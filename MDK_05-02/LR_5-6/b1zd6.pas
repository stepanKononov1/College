program b1zd6;
var A, B: Array[0..9] of integer; k,x:integer;
begin
  for i:integer:=0 to 9 do
  begin
    writeln('Введите значение ячейки массива: ');
    readln(x);
    A[i] := x;
  end;
  writeln('Массив: ', A);
  writeln;
  B:=A;
  for i:integer:=0 to 8 do
        for j:integer:=0 to 8 do
            if A[j] > A[j+1] then
            begin
                k:=A[j];
                A[j]:=A[j+1];
                A[j+1]:=k
            end;
  if B=A then writeln('Элементы массива упорядоченны по возврастанию')
  else writeln('Элементы массива не упорядоченны по возврастанию');
end.