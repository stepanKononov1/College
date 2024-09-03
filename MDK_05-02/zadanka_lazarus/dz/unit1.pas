unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
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
var a, b, h, i:real;
begin
a:=strtofloat(Edit3.Text); // начало
b:=strtofloat(Edit1.Text); // конец
h:=strtofloat(Edit2.Text); // шаг
Memo1.Lines.Clear;
Memo1.Lines.add('y=x^2');
i := a;
while i <= b do begin
   Memo1.Lines.add('y=' + floattostr(sqrt(i))+' | x='+floattostr(i));
   i := i + h;
end;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;


end.

