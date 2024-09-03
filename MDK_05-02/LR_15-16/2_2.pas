program lr14_22;

type
  PNode = ^Node;{ Определяем тип указателя на узел }
  Node = record { Определяем сам узел }
    Count: Integer; { Номер узла }
    Elem: String; { Информация в узле }
    Next: PNode; { Указатель на следующий узел в списке }
  end;

var
  newNode, head, tail: pNode;
  f: text;
  alf: array [1..10] of string;

begin
  Assign(f, 'File_2_2.txt');
  Reset(f);
  for i:integer:=1 to 10 do
    readln(f, alf[i]);
  Close(f);
  writeln('весь список:');
  for i:integer:= 1 to 10 do
  begin
    new(newNode);
    newNode^.elem := alf[i]; // Задаем значение новому элементу
    newNode^.count := i; // Номер пишем
    newNode^.next := nil; // Устанавливаем указатель на следующий элемент в nil
    
    if head = nil then head := newNode // Если список пуст, новый элемент становится головой
    else
    begin
      tail := head;
      while tail^.next <> nil do
        tail := tail^.next;  // Проходим до последнего элемента списка
      tail^.next := newNode; // Связываем последний элемент с новым элементом
    end;
    writeln(newNode^.elem);
  end;
  
  writeln;
  writeln('четные элементы списка:');
  var pp := Head;
  while (pp <> nil) do 
  begin
    if (pp^.count mod 2 = 0) then writeln(pp^.elem);
    pp := pp^.next;
  end;
end.