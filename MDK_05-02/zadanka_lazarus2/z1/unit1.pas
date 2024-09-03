unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button2Click(Sender: TObject);
var a, b, foo:real;
begin
a:=strtofloat(Edit3.Text);
b:=strtofloat(Edit1.Text);
Memo1.Lines.Clear;
Memo1.Lines.add('f=((x+1)/(x-1))^x+18*x*y^2');
Memo1.Lines.add(' ');
if a=1 then Memo1.Lines.add('Ошибка деления на ноль, x не может быть равен 1')
else if a<0 then begin
foo:=1/power((a+1)/(a-1), -a)+18*a*power(b, 2);
Memo1.Lines.add('f=' + floattostr(foo));
end
else begin
foo:=power((a+1)/(a-1), a)+18*a*power(b, 2);
Memo1.Lines.add('f=' + floattostr(foo));
end
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.Edit3Change(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;


end.

