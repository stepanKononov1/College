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
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var x1, x2, perimeter, square, diff: real;
begin
  x1 := strtofloat(Edit1.Text);
  x2 := strtofloat(Edit2.Text);
  Memo1.lines.add('Площадь и периметр квадрата!');
  Memo1.lines.add(' ');
  diff := abs(x1-x2);
  perimeter := diff*4;
  square := power(diff, 2);
  Memo1.lines.add('Периметр: ' + floattostr(perimeter));
  Memo1.lines.add('Площадь: ' + floattostr(square));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Label6Click(Sender: TObject);
begin

end;

end.

