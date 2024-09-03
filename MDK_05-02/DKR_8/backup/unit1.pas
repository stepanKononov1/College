unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  Grids, ExtCtrls;

type

  { TfMain }

  TfMain = class(TForm)
    Clear: TButton;
    ClearEntry: TButton;
    Clear_Last: TButton;
    comma: TButton;
    Divide: TButton;
    Divide_One_on_X: TButton;
    Edit1: TEdit;
    Eight: TButton;
    equal: TButton;
    Five: TButton;
    Four: TButton;
    displayMemory: TMemo;
    Image1: TImage;
    minus: TButton;
    Multiply: TButton;
    Nine: TButton;
    Null: TButton;
    One: TButton;
    Plus: TButton;
    RadioAdditional: TRadioButton;
    RadioBasic: TRadioButton;
    Seven: TButton;
    Six: TButton;
    sqrt_: TButton;
    square: TButton;
    Three: TButton;
    Two: TButton;
    procedure ClearEntryClick(Sender: TObject);
    procedure Clear_LastClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure sqrt_Click(Sender: TObject);
    procedure Divide_One_on_XClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure squareClick(Sender: TObject);
    procedure ClickZnak(Sender: TObject);
    procedure ClickBut(Sender: TObject);
    procedure equalClick(Sender: TObject);
    procedure commaClick(Sender: TObject);
    procedure radioMoreButton(Sender: TObject);

  private

  public

  end;

var
  fMain: TfMain;
  a, b, c: real;
  znak : string;
implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.Edit1Change(Sender: TObject);
begin

end;

procedure TfMain.commaClick(Sender: TObject);
var k2:AnsiString;
  k1:int64;
begin
  k2:=Edit1.Text;
  k1:= Pos(',',k2);
   if k1 = 0 then
      Edit1.Text:=Edit1.Text + (Sender as TButton).Caption
   else
    ShowMessage('Введите число');
end;

procedure TfMain.radioMoreButton(Sender: TObject);
begin
  if (Sender as TRadioButton).Caption = 'Basic' then
     begin
     sqrt_.Visible := False;
     square.Visible := False;
     Divide_One_on_X.Visible := False;
     end else
     begin
     sqrt_.Visible := True;
     square.Visible := True;
     Divide_One_on_X.Visible := True;
     end;
end;

procedure TfMain.ClickBut(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + (Sender as TButton).Caption;
end;


procedure TfMain.Clear_LastClick(Sender: TObject);
var
  str: string;
begin
  str:= Edit1.Text;
  if str <> '' then
  delete(str, Length(str),1);
  Edit1.Text:=str;
end;


procedure TfMain.equalClick(Sender: TObject);
begin
  if Edit1.Text = '' then
     ShowMessage('Ввидите число')
  else
  begin
  b:= strtoFLoat(Edit1.Text);
  Edit1.Clear;
  case znak of
  '+' : c:= a+b;
  '-' : c:= a-b;
  '*' : c:=a*b;
  '/': if b = 0 then
     showmessage('На ноль делить нельзая')
  else
  c:=a/b;
  end;
  end;
  Edit1.Text:= IntToStr(round(c));
  displayMemory.lines.clear();
  displayMemory.lines.add('Memory:');
  displayMemory.lines.add(IntToStr(round(c)));
end;


procedure TfMain.Divide_One_on_XClick(Sender: TObject);
begin
  if Edit1.Text = '' then
     ShowMessage('Введите число')
  else
  begin
  a:= strToFloat(Edit1.Text);
  if Edit1.Text = '0' then
     ShowMessage('На ноль делить нельзя')
  else
  begin
  a:= 1/(a);
  Edit1.Text:=FloatToStr(a);
  a:=0;
  end;
  end;
end;


procedure TfMain.ClearEntryClick(Sender: TObject);
begin
  Edit1.Clear;
end;

procedure TfMain.ClearClick(Sender: TObject);
begin
  Edit1.Clear;
  a:=0;
  b:=0;
  c:=0;
end;

procedure TfMain.Image1Click(Sender: TObject);
begin

end;



procedure TfMain.sqrt_Click(Sender: TObject);
begin
  if Edit1.Text = '' then
     ShowMessage('Введите числа')
  else
  begin
  a:= strToFloat(Edit1.Text);
  if a>0 then
  begin
  a:= sqrt(a);
  Edit1.Text:=FloatToStr(a);
  a:=0;
  end
  else
      ShowMessage('Корня из отрицательного числа не существует')
  end;
end;



procedure TfMain.squareClick(Sender: TObject);
begin
  if Edit1.Text = '' then
     ShowMessage('Введите числа')
  else
  begin
  a:= strToFloat(Edit1.Text);
  a:= sqr(a);
  Edit1.Text:=FloatToStr(a);
  a:=0;
  end; ;
end;

procedure TfMain.ClickZnak(Sender: TObject);
begin
   if Edit1.Text = '' then
      ShowMessage('Введите число')
   else
   begin
        a:= strToFloat(Edit1.Text);
        Edit1.clear;
        znak:=(Sender as TButton).Caption;
        displayMemory.lines.clear();
        displayMemory.lines.add('Memory:');
        displayMemory.lines.add(IntToStr(round(a)));
   end;
end;

end.

