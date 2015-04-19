unit AtalonTest;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, process, FileUtil, UTF8Process, SynEdit, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, StdCtrls, AsyncProcess;

type

  { TAtalonTestForm }

  TAtalonTestForm = class(TForm)
    Process1: TAsyncProcess;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    SynEdit1: TSynEdit;
    SynEdit2: TSynEdit;
    SynEdit3: TSynEdit;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupBox3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure Splitter2ChangeBounds(Sender: TObject);
    procedure Timer1StopTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Test;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  AtalonTestForm: TAtalonTestForm;

implementation
uses Main;
  var want2:boolean=false;
    fi,fo:string;
    deleteIO:boolean;
{$R *.lfm}

{ TAtalonTestForm }

procedure TAtalonTestForm.GroupBox3Click(Sender: TObject);
begin

end;

procedure TAtalonTestForm.Panel4Click(Sender: TObject);
begin

end;

procedure TAtalonTestForm.Test;
var s:string;
    i:longint;
begin
If not CheckBox1.Checked then
begin

i:=0;
while i<SynEdit2.Lines.Count do
begin
s:=SynEdit2.Lines[i];
if length(s)<>0 then
while s[length(s)]=' ' do delete(s,length(s),1);
If s='' then SynEdit2.Lines.Delete(i) else begin SynEdit2.Lines[i]:=s; inc(i);   end;
end;

i:=0;
while i<SynEdit3.Lines.Count do
begin
s:=SynEdit3.Lines[i];
if length(s)<>0 then
while s[length(s)]=' ' do delete(s,length(s),1);
If s='' then SynEdit3.Lines.Delete(i) else begin SynEdit3.Lines[i]:=s; inc(i);   end;
end;

end;

i:=0;
while (SynEdit2.Lines[i]=SynEdit3.Lines[i]) and (i<SynEdit2.Lines.Count)  and (i<SynEdit3.Lines.Count) do inc(i);

If  SynEdit3.Lines.Count<SynEdit2.Lines.Count then
begin
Panel2.Color:=clRed;
Panel2.Caption:='Слишком много строк';
end else
If  SynEdit3.Lines.Count<SynEdit2.Lines.Count then
begin
Panel2.Color:=clRed;
Panel2.Caption:='Слишком мало строк';
end else
if (SynEdit2.Lines[i]<>SynEdit3.Lines[i]) then
begin
Panel2.Color:=clRed;
Panel2.Caption:='Расхождение в строке №'+IntToStr(i+1);
end else
begin
Panel2.Color:=clGreen;
Panel2.Caption:='Совпадение';
end

end;

procedure TAtalonTestForm.RadioButton2Change(Sender: TObject);
begin
  Edit3.Enabled:=RadioButton2.Checked;
  Edit4.Enabled:=RadioButton2.Checked;
end;

procedure TAtalonTestForm.Splitter2ChangeBounds(Sender: TObject);
begin

end;

procedure TAtalonTestForm.Timer1StopTimer(Sender: TObject);
begin
  If Process1.Running then Process1.Terminate(0);
  Button3.Caption:='Запуск';
end;

procedure TAtalonTestForm.Timer1Timer(Sender: TObject);
var s:string;
begin
  If not Process1.Running then
  begin
  Timer1.Enabled:=false;

  If want2 then
  begin
  want2:=false;
  If RadioButton1.Checked then SynEdit2.Text:=readOutputData(Process1) else
    begin
    SynEdit2.Lines.LoadFromFile(fo);
    while deleteIO do
    begin
    deleteIO:=deleteIO and (not DeleteFileUTF8(fi));
    deleteIO:=deleteIO and (not DeleteFileUTF8(fo));
    If deleteIO then sleep(100);
    end;
    end;

  Process1.CommandLine:=AddDefines(Edit2.Text);
  Process1.CurrentDirectory:=ExtractFileDir(Process1.Executable);
  fi:=ExtractFileDir(Process1.Executable)+'\'+Edit3.Text;
  fo:=ExtractFileDir(Process1.Executable)+'\'+Edit4.Text;

  if RadioButton1.Checked then
  begin
  SynEdit1.Lines.SaveToFile(fi);
  SynEdit3.Lines.Clear;
  SynEdit3.Lines.SaveToFile(fo);
  end;

        try
      Process1.Execute;
   except
     ShowMessage('Невозможно запустить эталон '+Process1.CommandLine);
     Button3.Caption:='Запуск';
     want2:=false;
     exit;
   end;

  If RadioButton1.Checked then
  begin
  s:=SynEdit1.Text+LineEnding;
  Process1.Input.WriteBuffer(s[1],length(s));
  end;
  Process1.Resume;
  Timer1.Enabled:=true;
  end else



  begin
  If RadioButton1.Checked then SynEdit3.Text:=readOutputData(Process1) else begin
    SynEdit3.Lines.LoadFromFile(fo);
    while deleteIO do
    begin
    deleteIO:=deleteIO and (not DeleteFileUTF8(fi));
    deleteIO:=deleteIO and (not DeleteFileUTF8(fo));
    If deleteIO then sleep(100);
    end;
    end;
   ShowMessage(SynEdit2.Text);
   Test;
  end;

  end;
end;

procedure TAtalonTestForm.Button1Click(Sender: TObject);
begin
  If OpenDialog1.Execute then Edit1.Text:=OpenDialog1.FileName;
end;

procedure TAtalonTestForm.Button2Click(Sender: TObject);
begin
 If OpenDialog1.Execute then Edit2.Text:=OpenDialog1.FileName;
end;

procedure TAtalonTestForm.Button3Click(Sender: TObject);
var s:string;
begin
Panel2.Color:=clDefault;
Panel2.Caption:='Вердикт';

  If not Process1.Running then
  begin
   Button3.Caption:='Остановить';
   want2:=true;
   Process1.CommandLine:=AddDefines(Edit1.Text);
   Process1.CurrentDirectory:=ExtractFileDir(Process1.Executable);
   fi:=ExtractFileDir(Process1.Executable)+'\'+Edit3.Text;
   fo:=ExtractFileDir(Process1.Executable)+'\'+Edit4.Text;
   SynEdit2.Lines.Clear;
   SynEdit3.Lines.Clear;

      try
      Process1.Execute;
   except
     ShowMessage('Невозможно запустить программу '+Process1.CommandLine);
     Button3.Caption:='Запуск';
     exit;
   end;


   If  RadioButton2.Checked then
   begin
   deleteIO:=FileExistsUTF8(fi);
   SynEdit1.Lines.SaveToFile(fi);
   SynEdit2.Lines.SaveToFile(fo);
   end else
   begin
   deleteIO:=false;
   s:=SynEdit1.Text+LineEnding;
   Process1.Input.WriteBuffer(s[1],length(s));
   end;

   Process1.Resume;


  Timer1.Enabled:=true;
  end else
  begin

   Timer1.Enabled:=false;
   want2:=false;
   Button3.Caption:='Запуск';
  end;
end;

procedure TAtalonTestForm.FormShow(Sender: TObject);
begin
    (Sender as TForm).Left:=(Screen.Width - (Sender as TForm).Width) div 2;
  (Sender as TForm).Top:=(Screen.Height - (Sender as TForm).Height) div 2;
end;

end.

