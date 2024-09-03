program DoublyLinkedList;
uses CRT;

type
  NodePtr = ^Node;
  Node = record
    data: string;
    prev, next: NodePtr;
  end;

var
  head, tail, take: NodePtr;
  StaticList: Array[1..100] of string;
  index_take, mx: integer;
  chose: integer;

procedure AddNode(data: string);
var
  newNode: NodePtr;
begin
  New(newNode);
  newNode^.data := data;
  newNode^.next := nil;
  
  if head = nil then
  begin
    newNode^.prev := nil;
    head := newNode;
    tail := newNode;
  end
  else
  begin
    newNode^.prev := tail;
    tail^.next := newNode;
    tail := newNode;
  end;
  take := head;
end;

procedure DeleteNode;
begin
  if take = nil then begin writeln('Нечего удалять'); readln; end
  else
  if take = head then begin
    Dispose(take);
    head := head^.next;
    take := head;
  end
  else
  if take = tail then begin
    Dispose(take);
    tail := tail^.prev;
    tail^.next := nil;
    take := head;
  end
  else begin
    take^.prev^.next := take^.next;
    take^.next^.prev := take^.prev;
    Dispose(take);
    take := head;
  end;
end;

procedure DisplayList;
var
  current: NodePtr;
begin
  current := head;
  repeat
    write(current^.data, ' ');
    current := current^.next;
  until current = nil;
  writeln;
  current := head;
  repeat
    if current <> take then begin for i:integer:=1 to length(current^.data) do write(' '); write(' '); end
    else write('^');
    current := current^.next;
    if current = nil then break;
  until False;
  writeln;
end;

procedure message_node;
var
  chose: integer;
  data: string;
begin
  while True do begin
    clrscr;
    writeln('1 - Следующий объект');
    writeln('2 - Предыдущий объект');
    writeln('3 - Добавить объект');
    writeln('4 - Удалить объект');
    writeln('5 - Выйти');
    writeln;
    if head <> nil then begin
      writeln('Элементы:');
      DisplayList;
      if take = nil then take := head
    end;
    readln(chose);
    case chose of
      1: begin if take <> nil then if take^.next <> nil then take := take^.next; end;
      2: begin if take <> nil then if take^.prev <> nil then take := take^.prev; end;
      3: begin writeln; write('Введите данные: '); readln(data); Addnode(data);  end;
      4: begin DeleteNode; end;
      5: begin clrscr; break; end;
    end;
  end;
end;

procedure DisplayStaticList;
begin
  for i:integer:=1 to 100 do begin
    if staticlist[i] <> '' then
      write(staticlist[i] + ' ')
    else break;
  end;
  writeln;
  for i:integer:=1 to 100 do begin
    if i <> index_take then begin for j:integer:=1 to length(staticlist[i]) do write(' '); write(' '); end
    else begin write('^'); break; end;
  end;
  writeln;
end;

procedure Add(data: string);
begin
  for i:integer:=1 to 100 do
    if staticlist[i] = '' then begin staticlist[i] := data; break end;
  index_take := 1;
end;

procedure set_mx;
begin
  for i:integer:=1 to 100 do if staticlist[i] <> '' then continue
  else begin mx := i - 1; break; end;
end;

procedure Delete;
begin
  if staticlist[index_take] = '' then begin writeln('Нечего удалять'); readln; end
  else
  if index_take = 100 then staticlist[index_take]:='' else
  for i:integer:=index_take to 99 do
    staticlist[i] := staticlist[i+1];
  if index_take > 1 then
    dec(index_take);
end;

procedure message_static;
var
  chose: integer;
  data: string;
begin
  while True do begin
    clrscr;
    writeln('1 - Следующий объект');
    writeln('2 - Предыдущий объект');
    writeln('3 - Добавить объект');
    writeln('4 - Удалить объект');
    writeln('5 - Выйти');
    writeln;
    if staticlist[1] <> '' then begin
      writeln('Элементы:');
      DisplayStaticList;
    end;
    readln(chose);
    case chose of
      1: begin set_mx; if index_take < mx then inc(index_take); end;
      2: begin if index_take > 1 then dec(index_take); end;
      3: begin writeln; writeln('Введите данные:'); readln(data); add(data); end;
      4: begin delete; end;
      5: begin clrscr; break; end;
    end;
  end;
end;

begin
  while True do begin
    clrscr;
    writeln('Выбирите метод работы двусвязного списка:');
    writeln('1 - Статическая память');
    writeln('2 - Указатели');
    writeln('3 - Выйти');
    read(chose);
    case chose of
      1: begin message_static; end;
      2: begin message_node; end;
      3: break;
    end;
  end;
end.