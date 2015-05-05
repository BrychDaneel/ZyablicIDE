unit lience;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TLienceForm }

  TLienceForm = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Memo2Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  LienceForm: TLienceForm;

implementation

{$R *.lfm}

{ TLienceForm }

procedure TLienceForm.FormShow(Sender: TObject);
begin
    (Sender as TForm).Left:=(Screen.Width - (Sender as TForm).Width) div 2;
  (Sender as TForm).Top:=(Screen.Height - (Sender as TForm).Height) div 2;
end;

procedure TLienceForm.Memo2Change(Sender: TObject);
begin

end;

end.

