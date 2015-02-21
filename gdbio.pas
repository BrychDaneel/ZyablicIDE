unit GDBIO;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,LCLType;

type

  { TGDBForm }

  TGDBForm = class(TForm)
    InputEdit: TEdit;
    OutputMemo: TMemo;
    procedure InputEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { private declarations }
  public
    { public declarations }
  end;

procedure PrintGDB(s:string);
Procedure CleanGDBOutput;

var
  GDBForm: TGDBForm;

implementation

  uses Main;

{$R *.lfm}

{ TGDBForm }
Procedure CleanGDBOutput;
begin
GDBForm.OutputMemo.Lines.Clear;
end;

procedure PrintGDB(s:string);
begin
If s<>'' then GDBForm.OutputMemo.Lines.Add(s);
GDBForm.OutputMemo.SelStart:=length(GDBForm.OutputMemo.Text);
end;

procedure TGDBForm.InputEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key=VK_RETURN then
  begin
   MainForm.WriteGDB(InputEdit.Text);
   InputEdit.Text:='';
  end;
end;

end.

