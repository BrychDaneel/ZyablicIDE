unit calculator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, math, LCLType;

type

  { TCalculatorForm }

  TCalculatorForm = class(TForm)
    Button10: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    ButtonClearAll: TButton;
    ButtonClear: TButton;
    ButtonCenter: TButton;
    Button18: TButton;
    ButtonBackSpace: TButton;
    Button7: TButton;
    Button0: TButton;
    Button11: TButton;
    ButtonAnd: TButton;
    ButtonOr: TButton;
    ButtonXor: TButton;
    ButtonNot: TButton;
    ButtonFrack: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    MPButton: TButton;
    MMButton: TButton;
    MButton: TButton;
    MCButton: TButton;
    ButtonPlus: TButton;
    ButtonMinus: TButton;
    ButtonMUL: TButton;
    Button8: TButton;
    ButtonDIV: TButton;
    ButtonRaund: TButton;
    ButtonDEL: TButton;
    ButtonTrunc: TButton;
    ButtonRav: TButton;
    ButtonSqr: TButton;
    ButtonSqrY: TButton;
    ButtonSqrt: TButton;
    ButtonSqrtY: TButton;
    ButtonLn: TButton;
    Button9: TButton;
    ButtonLg: TButton;
    ButtonLog2: TButton;
    ButtonLogY: TButton;
    ButtonPi: TButton;
    ButtonByte: TButton;
    ButtonLong: TButton;
    ButtonExp: TButton;
    ButtonSin: TButton;
    ButtonCos: TButton;
    ButtonTan: TButton;
    Button4: TButton;
    ButtonCtg: TButton;
    ButtonAsin: TButton;
    ButtonAcos: TButton;
    ButtonAtan: TButton;
    ButtonActg: TButton;
    Button5: TButton;
    Button6: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    RadioButtonDeg: TRadioButton;
    RadioButtonRad: TRadioButton;
    RadioButtonBIN: TRadioButton;
    RadioButtonDEC: TRadioButton;
    RadioButtonHEX: TRadioButton;
    procedure Button0Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure ButtonCenterClick(Sender: TObject);
    procedure ButtonClearAllClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonFrackClick(Sender: TObject);
    procedure ButtonBackSpaceClick(Sender: TObject);
    procedure ButtonByteClick(Sender: TObject);
    procedure ButtonExpClick(Sender: TObject);
    procedure ButtonRavClick(Sender: TObject);
    procedure ButtonLongClick(Sender: TObject);
    procedure ButtonPiClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure MButtonClick(Sender: TObject);
    procedure MCButtonClick(Sender: TObject);
    procedure MMButtonClick(Sender: TObject);
    procedure MPButtonClick(Sender: TObject);
    procedure RadioButtonDECChange(Sender: TObject);
    procedure UnoOperator(Sender: TObject);
    procedure BinoOperator(Sender: TObject);
    procedure ShowValue;
    procedure AddNumber(number: byte);
    procedure Calculate;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  CalculatorForm: TCalculatorForm;
  value2,value1:Extended;
  op,ValueSys:longint;
  fr:extended = 0;
  itsmy: boolean = true;
  mem:Extended=0;
implementation
{$R *.lfm}


Function IntToBin(a: int64): String;
var
   ot: boolean;
begin
     ot:= a < 0;
     a:=abs(a);

     IntToBin:='';
     while a<>0 do
     begin
           IntToBin:= inttostr(a mod 2) + IntToBin;
           a:=a div 2;
     end;
     If IntToBin = '' then IntToBin:= '0';
     if ot then IntToBin:= '-' + IntToBin;
end;

procedure TCalculatorForm.ShowValue;
begin
   If (ValueSys<>10) and ((value1>power(10 , 18)) or (value1<-power(10 , 18))) then value1:=0;
   case ValueSys of
   2: Edit1.Text:=IntToBin(trunc(value1));
   10: Edit1.Text:=FloatToStr(value1);
   16: Edit1.Text:=IntToHex(trunc(value1), 1);
   end
end;

procedure TCalculatorForm.AddNumber(number: byte);
begin
  If fr = 0 then
     value1:=value1 * ValueSys + number
  else
    value1:=value1+number/fr;

  fr*=ValueSys;
  ShowValue;
end;

procedure TCalculatorForm.Button0Click(Sender: TObject);
begin
  If not itsmy then
     begin
       value2:=value1;
       value1:=0;
       fr:=0;
       itsmy:=true;
     end;
  AddNumber(TButton(Sender).Tag);
end;

procedure TCalculatorForm.Button11Click(Sender: TObject);
begin
  value1:=-value1;
  ShowValue;
end;

procedure TCalculatorForm.ButtonCenterClick(Sender: TObject);
var
  i:int32;
begin
    If not itsmy then
     begin
       value2:=value1;
       value1:=0;
       itsmy:=true;
     end;
  for i:=1 to TButton(Sender).Tag do
      value1*=ValueSys;
  ShowValue;
end;

procedure TCalculatorForm.ButtonClearAllClick(Sender: TObject);
begin
  op:=0;
  value1:=0;
  ShowValue;
end;

procedure TCalculatorForm.ButtonClearClick(Sender: TObject);
begin
  value1:=0;
  ShowValue;
end;

procedure TCalculatorForm.ButtonFrackClick(Sender: TObject);
begin
 If not itsmy then value1:=0;
    fr:=10;
 itsmy:=true;
end;

procedure TCalculatorForm.ButtonBackSpaceClick(Sender: TObject);
begin
 If not itsmy then
    begin
      value2:=value1;
      value1:=0;
      itsmy:=true;
    end;

fr:= fr / ValueSys;
If fr=1 then fr:=0;

If  ((value1>power(10 , 18)) or (value1<-power(10 , 18))) then value1:=value1/ValueSys else
  If fr > power(10 , 15) then value1:=trunc(value1) else

 If fr=0 then
    value1:=trunc(value1) div ValueSys
 else
    value1:=trunc(value1 * (fr / ValueSys) ) / (fr / ValueSys);


ShowValue;
end;

procedure TCalculatorForm.ButtonByteClick(Sender: TObject);
begin
 itsmy:=false;
  value1:=256;
  ShowValue;
end;

procedure TCalculatorForm.ButtonExpClick(Sender: TObject);
begin
 itsmy:=false;
  value1:=exp(1);
  ShowValue;
end;

procedure TCalculatorForm.ButtonRavClick(Sender: TObject);
begin
  Calculate;
  ShowValue;
end;

procedure TCalculatorForm.ButtonLongClick(Sender: TObject);
begin
 itsmy:=false;
  value1:=int64(1) shl 32;
  ShowValue;
end;

procedure TCalculatorForm.ButtonPiClick(Sender: TObject);
begin
  itsmy:=false;
  value1:=pi;
  ShowValue;
end;

procedure TCalculatorForm.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (key = VK_RETURN) and (Sender = Edit1) then ButtonRav.Click;
  If key = VK_BACK then ButtonBackSpace.Click;
end;

procedure TCalculatorForm.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  case key of
  '0':Button0.Click;
  '1':Button1.Click;
  '2':Button2.Click;
  '3':Button3.Click;
  '4':Button4.Click;
  '5':Button5.Click;
  '6':Button6.Click;
  '7':Button7.Click;
  '8':Button8.Click;
  '9':Button9.Click;
  '/':ButtonDel.Click;
  '*':ButtonMul.Click;
  '-':ButtonMinus.Click;
  '+':ButtonPlus.Click;
  '.':ButtonFrack.Click;
  '=':ButtonRav.Click;
  end;
end;

procedure TCalculatorForm.FormCreate(Sender: TObject);
begin
(Sender as TForm).Left:=(Screen.Width - (Sender as TForm).Width) div 2;
  (Sender as TForm).Top:=(Screen.Height - (Sender as TForm).Height) div 2;
  ValueSys:=10;
end;

procedure TCalculatorForm.MButtonClick(Sender: TObject);
begin
   If not itsmy then
     begin
       value2:=value1;
       value1:=mem;
       itsmy:=true;
     end;
   value1:=mem;
   ShowValue;
end;

procedure TCalculatorForm.MCButtonClick(Sender: TObject);
begin
  mem:=0;
end;

procedure TCalculatorForm.MMButtonClick(Sender: TObject);
begin
  mem-=value1;
end;

procedure TCalculatorForm.MPButtonClick(Sender: TObject);
begin
  mem+=value1;
end;

procedure TCalculatorForm.RadioButtonDECChange(Sender: TObject);
begin
  If RadioButtonBIN.Checked then ValueSys:=2;
  If RadioButtonDEC.Checked then ValueSys:=10;
  If RadioButtonHEX.Checked then ValueSys:=16;
  ShowValue;
  itsmy:=false;
  fr:=0;
end;

procedure TCalculatorForm.Calculate;
var
  rad, mn: Extended;
begin
if RadioButtonDeg.Checked then
   begin
   rad:=value1/180*pi;
   mn:=1/pi*180;
   end
else
    begin
   rad:=value1;
   mn:=1;
    end;


  try
case op of
1:value1:=value2+value1;
2:value1:=value2-value1;
3:value1:=value2*value1;
4:value1:=trunc(value2) div trunc(value1);
5:value1:=value2 / value1;
6:value1:=round(value1);
7:value1:=frac(value1);
8:value1:=sqr(value1);
9:value1:=power(value2,value1);
10:value1:=sqrt(value1);
11:value1:=exp(ln(value2)*(1/value1));
12:value1:=ln(value1);
13:value1:=log10(value1);
14:value1:=log2(value1);
15:value1:=ln(value2)/ln(value1);
16:value1:=sin(rad);
17:value1:=cos(rad);
18:value1:=tan(rad);
19:value1:=cotan(rad);
20:value1:=arcsin(value1)*mn;
21:value1:=arccos(value1)*mn;
22:value1:=arctan(value1)*mn;
23:value1:=arctan(1/value1)*mn;
24:value1:=trunc(value1) and trunc(value2);
25:value1:=trunc(value1) or trunc(value2);
26:value1:=trunc(value1) xor trunc(value2);
27:value1:=not trunc(value1);
end;
  except
  value1:=0;
  itsmy:=false;
  op:=0;
  ShowMessage('Математическая ошибка');
  exit;
  end;

itsmy:=false;
op:=0;
ShowValue;
end;


procedure TCalculatorForm.UnoOperator(Sender: TObject);
begin
 Calculate;
 op:=TButton(Sender).Tag;
 Calculate;
end;

procedure TCalculatorForm.BinoOperator(Sender: TObject);
begin
Calculate;
op:=TButton(Sender).Tag;
value2:=value1;
itsmy:=false;
end;

end.

