unit Multitest;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, UTF8Process, SynEdit, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, EditBtn, Spin;

type

  { TMultiTestForm }

  TMultiTestForm = class(TForm)
    Button3: TButton;
    CheckBox1: TCheckBox;
    Edit3: TEdit;
    Edit4: TEdit;
    FileNameEdit1: TFileNameEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    TestProcess: TProcessUTF8;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ScrollBox1: TScrollBox;
    SpinEdit1: TSpinEdit;
    TestOutputTimer: TTimer;
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit1ChangeBounds(Sender: TObject);
    procedure NextTest;
    procedure TestOutputTimerTimer(Sender: TObject);
    procedure CheckTest;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  MultiTestForm: TMultiTestForm;
  TestNumber: int32=0;
  deleteIO:boolean=false;
  fi, fo: String;
implementation
  uses main;
{$R *.lfm}

{ TMultiTestForm }
const IOWidth=200;
      IOHeight=150;

var oldvalue:int32=0;
    PanArray:array [1..100] of TGroupBox;
    InputArray,OutputArray,AnswerArray:array [1..100] of TSynEdit;

procedure TMultiTestForm.SpinEdit1Change(Sender: TObject);
var i, q: int32;
begin
If oldvalue<SpinEdit1.Value then
   for i:=oldvalue+1 to SpinEdit1.Value do
   begin
        PanArray[i]:=TGroupBox.Create(ScrollBox1);
        with PanArray[i] do
        begin
             Parent:=ScrollBox1;
             AutoSize:=true;
             Caption:=strTest+IntToStr(i);

             InputArray[i]:=TSynEdit.Create(PanArray[i]);
             with InputArray[i] do
             begin
                  Parent:=PanArray[i];
                  Width:=IOWidth;
                  Height:=IOHeight;
                  Gutter.Parts.Part[0].Free;
                  Text:=strInput;
             end;

             AnswerArray[i]:=TSynEdit.Create(PanArray[i]);
             with AnswerArray[i] do
             begin
                  Parent:=PanArray[i];
                  Width:=IOWidth;
                  Height:=IOHeight;
                  Gutter.Parts.Part[0].Free;
                  Top:=IOHeight;
                  Text:=strAnswer;
             end;

             OutputArray[i]:=TSynEdit.Create(PanArray[i]);
             with OutputArray[i] do
             begin
                  Parent:=PanArray[i];
                  Width:=IOWidth;
                  Height:=IOHeight;
                  Gutter.Parts.Part[0].Free;
                  Top:=IOHeight*2;
                  Text:=strOutput;
             end;
        end;
   end
else
    for i:=oldvalue downto SpinEdit1.Value+1 do
          PanArray[i].Destroy;


ScrollBox1.Height:=IOHeight*3+20;
ScrollBox1.Width:=IOWidth*SpinEdit1.Value;
for i:=oldvalue+1 to SpinEdit1.Value do
    PanArray[i].Left:=(i-1)*IOWidth;


oldvalue:=SpinEdit1.Value;
Invalidate;
end;

procedure TMultiTestForm.NextTest;
var
   s:String;
begin
inc(TestNumber);
PanArray[TestNumber].Color:=clBlue;

try
    TestProcess.Execute;
except
  ShowMessage(StrCantRunProg+TestProcess.CommandLine);
  Button3.Caption:=strStart;
  TestNumber:=0;
  exit;
end;

If  RadioButton2.Checked then
begin
deleteIO:=FileExistsUTF8(fi);
InputArray[TestNumber].Lines.SaveToFile(fi);
OutputArray[TestNumber].Lines.Clear;
OutputArray[TestNumber].Lines.SaveToFile(fo);
end else
begin
deleteIO:=false;
s:=InputArray[TestNumber].Text+LineEnding;
TestProcess.Input.WriteBuffer(s[1],length(s));
end;

TestProcess.Resume;
TestOutputTimer.Enabled:=true;
end;


procedure TMultiTestForm.CheckTest;
var s:string;
    i:longint;
begin
If not CheckBox1.Checked then
begin

i:=0;
while i<AnswerArray[TestNumber].Lines.Count do
begin
s:=AnswerArray[TestNumber].Lines[i];
if length(s)<>0 then
while s[length(s)]=' ' do delete(s,length(s),1);
If s='' then AnswerArray[TestNumber].Lines.Delete(i) else begin AnswerArray[TestNumber].Lines[i]:=s; inc(i);   end;
end;

i:=0;
while i<OutputArray[TestNumber].Lines.Count do
begin
s:=OutputArray[TestNumber].Lines[i];
if length(s)<>0 then
while s[length(s)]=' ' do delete(s,length(s),1);
If s='' then OutputArray[TestNumber].Lines.Delete(i) else begin OutputArray[TestNumber].Lines[i]:=s; inc(i);   end;
end;

end;

i:=0;
while (AnswerArray[TestNumber].Lines[i]=OutputArray[TestNumber].Lines[i]) and (i<AnswerArray[TestNumber].Lines.Count)  and (i<OutputArray[TestNumber].Lines.Count) do inc(i);

If  AnswerArray[TestNumber].Lines.Count<OutputArray[TestNumber].Lines.Count then
begin
PanArray[TestNumber].Color:=clRed;
end else
If  AnswerArray[TestNumber].Lines.Count>OutputArray[TestNumber].Lines.Count then
begin
PanArray[TestNumber].Color:=clRed;
end else
if (AnswerArray[TestNumber].Lines[i]<>OutputArray[TestNumber].Lines[i]) then
begin
PanArray[TestNumber].Color:=clRed;
end else
begin
PanArray[TestNumber].Color:=clGreen;
end

end;

procedure TMultiTestForm.TestOutputTimerTimer(Sender: TObject);
var
   s: string;
begin
  if not TestProcess.Running then
  begin
  IF TestProcess.ExitCode<>0 then OutputArray[TestNumber].Text:='Exit code: '+IntToStr(TestProcess.ExitCode) else
  If  RadioButton2.Checked then
begin
     OutputArray[TestNumber].Lines.LoadFromFile(fo);
end else
begin
     s:=readOutputData(TestProcess);
     OutputArray[TestNumber].Text:=s;
end;

CheckTest;
If TestNumber=SpinEdit1.Value then
begin
   If deleteIO then
   begin
        DeleteFileUTF8(fi);
        DeleteFileUTF8(fo);
   end;
   TestOutputTimer.Enabled:=false;
   Button3.Caption:=strStart;
   TestNumber:=0;
end else
    NextTest;
  end;
end;

procedure TMultiTestForm.Button3Click(Sender: TObject);
var
   i: int32;
begin


  If TestNumber=0 then
  begin
  If SpinEdit1.Value=0 then Exit;

  for i:=1 to SpinEdit1.Value do
      PanArray[i].Color:=clDefault;
   Button3.Caption:=strStop;

   TestProcess.CommandLine:=AddDefines(FileNameEdit1.Text);
   TestProcess.CurrentDirectory:=ExtractFileDir(TestProcess.Executable);
   fi:=TestProcess.CurrentDirectory+slash+Edit3.Text;
   fo:=TestProcess.CurrentDirectory+slash+Edit4.Text;

    TestNumber:=0;
   nexttest;
  end else
  begin
   TestOutputTimer.Enabled:=false;
   TestProcess.Terminate(0);
   PanArray[TestNumber].Color:=clDefault;
   TestNumber:=0;
   Button3.Caption:=strStart;
  end;
end;

procedure TMultiTestForm.FormShow(Sender: TObject);
begin
      (Sender as TForm).Left:=(Screen.Width - (Sender as TForm).Width) div 2;
  (Sender as TForm).Top:=(Screen.Height - (Sender as TForm).Height) div 2;
end;

procedure TMultiTestForm.RadioButton1Change(Sender: TObject);
begin
     If RadioButton1.Checked then
  begin
       Edit3.Enabled:=false;
       Edit4.Enabled:=false;
  end;
end;

procedure TMultiTestForm.RadioButton2Change(Sender: TObject);
begin
  If RadioButton2.Checked then
  begin
       Edit3.Enabled:=true;
       Edit4.Enabled:=true;
  end;
end;

procedure TMultiTestForm.SpinEdit1ChangeBounds(Sender: TObject);
begin

end;

end.

