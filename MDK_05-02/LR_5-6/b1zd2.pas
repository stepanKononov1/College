program b1zd2;
var arr: Array[1..20] of integer; arr1: Array  of integer; count_parity0, product,x,y: integer;
begin
  count_parity0:=0;
  product:=1;
  for i:integer:=1 to 20 do
  begin
    arr[i]:=random(116) - 22;
    if (arr[i] mod 2 = 0) and (i mod 2 = 1) then count_parity0:=count_parity0+1
    else if arr[i] mod 2 = 1 then product:=product*arr[i];
    end;
  writeln('Массив: ',arr);
  writeln('Количество четных элементов массива, стоящих на нечетных местах: ',count_parity0);
  writeln('Произведение нечетных элементов массива: ',product);
  product:=0;
  writeln;
  writeln('Введите промежуток: ');
  while true do
  begin
    readln(x,y);
    if x > y then writeln('Первое число больше второго, введите заного: ')
    else break;
  end;
  SetLength(arr1, y-x+1);
  for i:integer:=0 to arr1.Length - 1 do
  begin
    arr1[i]:=x;
    product:=product+x;
    x:=x+1;
  end;
  writeln('Массив: ',arr1);
  writeln('Сумма элементов массива: ',product);
end.