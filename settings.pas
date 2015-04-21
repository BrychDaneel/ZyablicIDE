unit settings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, EditBtn;

type

  { TSettingForm }

  TSettingForm = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TComboBox;
    FontDialog1: TFontDialog;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Edit2: TLabeledEdit;
    Edit3: TLabeledEdit;
    Edit4: TLabeledEdit;
    Edit5: TLabeledEdit;
    Edit6: TLabeledEdit;
    Label2: TLabel;
    ListBox1: TListBox;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupBox2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SettingForm: TSettingForm;

implementation
 uses Main,AtalonTest;
{$R *.lfm}

 { TSettingForm }

 procedure TSettingForm.Button1Click(Sender: TObject);
 begin
   If FontDialog1.Execute then
   begin
    MainForm.MainSynEdit.Font:=FontDialog1.Font;
    MainForm.InputSynEdit.Font:=FontDialog1.Font;
    MainForm.OutputSynEdit.Font:=FontDialog1.Font;
    MainForm.MessageSynMemo.Font:=FontDialog1.Font;
    AtalonTestForm.SynEdit1.Font:=FontDialog1.Font;
    AtalonTestForm.SynEdit2.Font:=FontDialog1.Font;
    AtalonTestForm.SynEdit3.Font:=FontDialog1.Font;
   end;
 end;

procedure TSettingForm.ComboBox1Select(Sender: TObject);
begin
 Case ComboBox1.ItemIndex of
 0:MainForm.MainSynEdit.Highlighter:=MainForm.SynPasSyn1;
 1:MainForm.MainSynEdit.Highlighter:=MainForm.SynCppSyn1;
 end;
end;

procedure TSettingForm.ComboBox2Change(Sender: TObject);
begin
  LoadLanguageFromFile('language'+slash+ComboBox2.Text+'.lng');
end;

procedure TSettingForm.Edit1Change(Sender: TObject);
begin
  CompileCommand:=Edit1.Text;
end;

procedure TSettingForm.Edit2Change(Sender: TObject);
begin
  BuildCommand:=Edit2.Text;
end;

procedure TSettingForm.Edit3Change(Sender: TObject);
begin
  RunComand:=Edit3.Text;
end;

procedure TSettingForm.Edit4Change(Sender: TObject);
begin
  GdbComand:=Edit4.Text;
end;

procedure TSettingForm.Edit5Change(Sender: TObject);
begin
  youname:=Edit5.Text;
end;

procedure TSettingForm.Edit6Change(Sender: TObject);
begin
  email:=Edit6.Text;
end;

procedure TSettingForm.FormCreate(Sender: TObject);
begin
  Edit1.Text:=CompileCommand;
  Edit2.Text:=BuildCommand;
  Edit3.Text:=RunComand;
  Edit4.Text:=GdbComand;
  Edit5.Text:=youname;
  Edit6.Text:=email;


end;

procedure TSettingForm.FormShow(Sender: TObject);
begin
    (Sender as TForm).Left:=(Screen.Width - (Sender as TForm).Width) div 2;
  (Sender as TForm).Top:=(Screen.Height - (Sender as TForm).Height) div 2;
end;

procedure TSettingForm.GroupBox2Click(Sender: TObject);
begin

end;

end.

