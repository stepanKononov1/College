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
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
var i,t,k,k1:integer;
begin
k:=strtoint(Edit1.Text); // число
k1:=strtoint(Edit2.Text); // степень
i:=1; t:=1;
while i<=k1 do
begin
t:=t*k;
i:=i+1;
end;
Memo1.Lines.add('число '+Edit1.Text+' в степени '+Edit2.Text+' равно: '+IntToStr(t));
end;


end.
