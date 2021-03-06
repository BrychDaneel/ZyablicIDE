unit ansiitable;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Grids, StdCtrls, Spin;

type

  { TAnsiiTableForm }

  TAnsiiTableForm = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    SpinEdit1: TSpinEdit;
    StringGrid1: TStringGrid;
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; aCol, aRow: Integer;
      var CanSelect: Boolean);
    function IntToHEX(a:longint):ansistring;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  AnsiiTableForm: TAnsiiTableForm;

implementation

{$R *.lfm}

{ TAnsiiTableForm }

procedure TAnsiiTableForm.FormCreate(Sender: TObject);
var i,ii:longint;
begin
  For i:=0 to 15 do
  for ii:=0 to 15 do StringGrid1.Cells[ii,i]:=AnsiToUtf8(char(i*16+ii));
end;

procedure TAnsiiTableForm.FormShow(Sender: TObject);
begin
      (Sender as TForm).Left:=(Screen.Width - (Sender as TForm).Width) div 2;
  (Sender as TForm).Top:=(Screen.Height - (Sender as TForm).Height) div 2;
end;

procedure TAnsiiTableForm.SpinEdit1Change(Sender: TObject);
var a:byte;
begin
  IF SpinEdit1.Value>255 then SpinEdit1.Value:=255;
  IF SpinEdit1.Value<0 then SpinEdit1.Value:=0;
  SpinEdit1.Invalidate;

  a:=SpinEdit1.Value;
  StringGrid1.Selection:=TGridRect(rect(a mod 16,a div 16,a mod 16,a div 16));
  Edit2.Text:=IntToHEX(a);
  Edit1.Text:=AnsiToUtf8(chr(a));
end;

procedure TAnsiiTableForm.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  Edit1.Text:='';
  StringGrid1.Selection:=TGridRect(rect(ord(key)mod 16,ord(key)div 16,ord(key)mod 16,ord(key)div 16));
  SpinEdit1.Value:=ord(key);
  Edit2.Text:=IntToHEX(ord(key));
end;

procedure TAnsiiTableForm.Edit2Change(Sender: TObject);
var a:longint;
  s:string;
begin
s:=Edit2.Text;
a:=0;
if length(s)>0 then
case s[1] of
'A'..'Z':a:=ord(s[1])-ORD('A')+10;
'0'..'9':a:=ord(s[1])-ORD('0');
end;

if length(s)>1 then
case s[2] of
'A'..'Z':a:=a*16+ord(s[2])-ORD('A')+10;
'0'..'9':a:=a*16+ord(s[2])-ORD('0');
end;

If a>255 then a:=255;
If a<0 then a:=0;

StringGrid1.Selection:=TGridRect(rect(a mod 16,a div 16,a mod 16,a div 16));
SpinEdit1.Value:=a;
Edit1.Text:=AnsiToUtf8(chr(a));
end;

procedure TAnsiiTableForm.Edit2KeyPress(Sender: TObject; var Key: char);
begin
  Key:=upcase(key);
  If not ((key in ['0'..'9']) or (key in ['A'..'F'])) then key:=#0;
end;

function TAnsiiTableForm.IntToHEX(a:longint):ansistring;
begin
  case a div 16 of
  0..9:IntToHEX:=char(a div 16+48);
  10..15:IntToHEX:=char(a div 16-10+65);
  end;

  case a mod 16 of
  0..9:IntToHEX:=IntToHEX+char(a mod 16+48);
  10..15:IntToHEX:=IntToHEX+char(a mod 16-10+65);
  end;
end;

procedure TAnsiiTableForm.StringGrid1SelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
var a:byte;
begin
  a:=aRow*16+aCol;
  Edit1.Text:=AnsiToUtf8(chr(a));
  SpinEdit1.Value:=a;
  Edit2.Text:=IntToHEX(a);
end;


end.

