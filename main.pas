unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, process, FileUtil, UTF8Process, SynEdit, SynHighlighterPas,
  SynMemo, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls, StdCtrls,
  Menus, SynEditMarks, SynEditTypes, SynHighlighterCpp, {KGrids,} LCLType,
  ExtDlgs, dateutils, LazUTF8Classes, lazutf8, types;

type
  { TMainForm }

  TMainForm = class(TForm)
    MenuItem22: TMenuItem;
    CompProcess: TProcessUTF8;
    GDBProcess: TProcessUTF8;
    RunProcess: TProcessUTF8;
    SynCppSyn1: TSynCppSyn;
    BrLineTimer: TTimer;
    UpdateProcess: TProcessUTF8;
    CalculatorDialog1: TCalculatorDialog;
    BookMarkImageList: TImageList;
    FindDialog1: TFindDialog;
    MenuImageList: TImageList;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItemInputFile: TMenuItem;
    MenuItemInputEmulate: TMenuItem;
    MenuItemInputConsole: TMenuItem;
    MenuItemReplase: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItemStop: TMenuItem;
    MenuItemVr: TMenuItem;
    MenuItem1Copy: TMenuItem;
    MenuItemPaste: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItemFind: TMenuItem;
    MenuItemFindNext: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItemHelp: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItemAbout: TMenuItem;
    MenuItemStep: TMenuItem;
    MenuItemStepOver: TMenuItem;
    MenuItemToCursor: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItemWath: TMenuItem;
    MenuItemGDBLine: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItemUnDo: TMenuItem;
    MenuItemReDo: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItemSaveAll: TMenuItem;
    MenuItemRun: TMenuItem;
    MenuItemCompil: TMenuItem;
    MenuItemCompile: TMenuItem;
    MenuItemExit: TMenuItem;
    MenuItemCloseAll: TMenuItem;
    MenuItemClose: TMenuItem;
    MenuItemSave: TMenuItem;
    MenuItemSaveAs: TMenuItem;
    MenuItemOpen: TMenuItem;
    MenuItemCreate: TMenuItem;
    OpenDialog1: TOpenDialog;
    OutputNameEdit: TEdit;
    InputNameEdit: TEdit;
    InputPanel: TPanel;
    InputLabel: TLabel;
    OutputLabel: TLabel;
    OutputPanel: TPanel;
    InputCaptionPanel: TPanel;
    OutputCaptionPanel: TPanel;
    ReplaceDialog1: TReplaceDialog;
    SaveDialog1: TSaveDialog;
    CompilMessageTimer: TTimer;
    GDBMessageTimer: TTimer;
    RunMessageTimer: TTimer;
    WatchPanel: TPanel;
    SynEditPanel: TPanel;
    MessagePanel: TPanel;
    Splitter1: TSplitter;
    InputSynEdit: TSynEdit;
    OutputSynEdit: TSynEdit;
    MainSynEdit: TSynEdit;
    MessageSynMemo: TSynMemo;
    SynPasSyn1: TSynPasSyn;
    TerminalEdit: TEdit;
    TerminalMemo: TMemo;
    TerminalGroupBox: TGroupBox;
    IOGroupBox: TGroupBox;
    MainMenu1: TMainMenu;
    MenuIFile: TMenuItem;
    IOPanel: TPanel;
    MidlePanel: TPanel;
    HorizontalSplitter: TSplitter;
    MidleToolBar: TToolBar;
    IOToolBar: TToolBar;
    TabControl1: TTabControl;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton2: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    VerticalSplitter: TSplitter;
    Status: TStatusBar;
    BotonTabControl: TTabControl;
    procedure BrLineTimerStartTimer(Sender: TObject);
    procedure BrLineTimerTimer(Sender: TObject);
    procedure CompilMessageTimerTimer(Sender: TObject);
    procedure BotonTabControlChange(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure GDBMessageTimerStopTimer(Sender: TObject);
    procedure GDBMessageTimerTimer(Sender: TObject);
    procedure HorizontalSplitterCanResize(Sender: TObject;
      var NewSize: Integer; var Accept: Boolean);
    procedure HorizontalSplitterChangeBounds(Sender: TObject);
    procedure HorizontalSplitterMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure HorizontalSplitterMoved(Sender: TObject);
    procedure InputNameEditChange(Sender: TObject);
    procedure KGrid1CellChanging(Sender: TObject; AOldCol, AOldRow, ANewCol,
      ANewRow: Integer);
    procedure KGrid1Changed(Sender: TObject; ACol, ARow: Integer);
    procedure KGrid1Enter(Sender: TObject);
    procedure KGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure MainSynEditGutterClick(Sender: TObject; X, Y, Line: integer;
      mark: TSynEditMark);
    procedure MainSynEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MainSynEditKeyPress(Sender: TObject; var Key: char);
    procedure MainSynEditPaint(Sender: TObject; ACanvas: TCanvas);
    procedure MainSynEditSpecialLineColors(Sender: TObject; Line: integer;
      var Special: boolean; var FG, BG: TColor);
    procedure MainSynEditStatusChange(Sender: TObject;
      Changes: TSynStatusChanges);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem1CopyClick(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItemAboutClick(Sender: TObject);
    procedure MenuItemHelpClick(Sender: TObject);
    procedure MenuItemInputConsoleClick(Sender: TObject);
    procedure MenuItemInputEmulateClick(Sender: TObject);
    procedure MenuItemInputFileClick(Sender: TObject);
    procedure MenuItemGDBLineClick(Sender: TObject);
    procedure MenuItemToCursorClick(Sender: TObject);
    procedure MenuItemCloseAllClick(Sender: TObject);
    procedure MenuItemCloseClick(Sender: TObject);
    procedure MenuItemCompilClick(Sender: TObject);
    procedure MenuItemCreateClick(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemFindClick(Sender: TObject);
    procedure MenuItemFindNextClick(Sender: TObject);
    procedure MenuItemOpenClick(Sender: TObject);
    procedure MenuItemPasteClick(Sender: TObject);
    procedure MenuItemReDoClick(Sender: TObject);
    procedure MenuItemReplaseClick(Sender: TObject);
    procedure MenuItemRunClick(Sender: TObject);
    procedure MenuItemSaveAllClick(Sender: TObject);
    procedure MenuItemSaveAsClick(Sender: TObject);
    procedure MenuItemSaveClick(Sender: TObject);
    procedure MenuItemStepClick(Sender: TObject);
    procedure MenuItemStepOverClick(Sender: TObject);
    procedure MenuItemStopClick(Sender: TObject);
    procedure MenuItemUnDoClick(Sender: TObject);
    procedure MenuItemVrClick(Sender: TObject);
    procedure MenuItemWathClick(Sender: TObject);
    procedure MessageSynMemoKeyPress(Sender: TObject; var Key: char);
    procedure MessageSynMemoSpecialLineColors(Sender: TObject; Line: integer;
      var Special: boolean; var FG, BG: TColor);
    procedure OutputNameEditChange(Sender: TObject);
    procedure ReplaceDialog1Find(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
    procedure RunMessageTimerStopTimer(Sender: TObject);
    procedure RunMessageTimerTimer(Sender: TObject);
    procedure Splitter1ChangeBounds(Sender: TObject);
    procedure StatusTimerTimer(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure Reselect(new:SmallInt);
    procedure SaveFile(index:SmallInt);
    procedure SaveFileAs(index:SmallInt);
    procedure Closefile(index:longint);
    procedure ReloadFrom(index:longint);
    procedure ReloadTo(index:longint);
    procedure CloseCarefully(index:smallint);
    procedure TerminalEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UpdateState;
    procedure Run;
    procedure SetRunButtons(Erun,Estop:boolean);
    procedure ParseByLine(var source,s:string);
    procedure breakline(s:string);
    procedure VerticalSplitterChangeBounds(Sender: TObject);
   // procedure WatchValueListEditorColRowDeleted(Sender: TObject;
      //IsColumn: Boolean; sIndex, tIndex: Integer);
   // procedure WatchValueListEditorExit(Sender: TObject);
    procedure WatchValueListEditorGetEditText(Sender: TObject; ACol,
      ARow: Integer; var Value: string);
  //  procedure WatchValueListEditorSelectCell(Sender: TObject; aCol,
      //aRow: Integer; var CanSelect: Boolean);
    Procedure WriteGDB(s:string);
   // Procedure ChangeWatch(ACol,ARow:integer;OldValue,NewValue:string);
    Procedure LockInterface;
    Procedure UnLockInterface;
    function LinuxStyleSlash(s:string):string;
    function WindowsStyleSlash(s:string):string;
    procedure CorrectWatch(var s:string);
    procedure openfile(const filename:string);
  private
    { private declarations }
  public

    { public declarations }
  end;

  function AddDefines(s:String):String;
  function readOutputData(process:TProcess):string;
var
  MainForm: TMainForm;
   WaitForExecute:boolean=false;
       GNUGPL:string='{'+LineEnding+
   '%f'+LineEnding+
            LineEnding+
   'Copyright $YEAR $NAME <$EMAIL>'+LineEnding+
                                                  LineEnding+
   'This program is free software; you can redistribute it and/or modify'+LineEnding+
   'it under the terms of the GNU General Public License as published by' +LineEnding+
   'the Free Software Foundation; either version 2 of the License, or' +LineEnding+
   '(at your option) any later version.'        +LineEnding+
                                                LineEnding+
   'This program is distributed in the hope that it will be useful,'+LineEnding+
   'but WITHOUT ANY WARRANTY; without even the implied warranty of'+LineEnding+
   'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the' +LineEnding+
   'GNU General Public License for more details.'+LineEnding+
                                                 LineEnding+
   'You should have received a copy of the GNU General Public License'  +LineEnding+
   'along with this program; if not, write to the Free Software'  +LineEnding+
   'Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,' +LineEnding+
   'MA 02110-1301, USA.' +LineEnding+
   '}' +LineEnding;
   youname:string='Brychikov Daneel';
   email:string='BrychDaneel@mail.ru';

   CompileCommand,RunComand,GdbComand,BuildCommand:string;
   wantUpdate:boolean=false;
   {$IFDEF WINDOWS}
   slash:string='\';
   {$ELSE}
   slash:string='/';
   {$ENDIF}

implementation
 uses GDBIO,settings,ansiitable,lience,about,AtalonTest;
{$R *.lfm}

{ TMainForm }
Type
WriteProgramState=(wpsEdit,wpsCompil,wpsRun,wpsDebug);
MyInputType=(iptFile,iptConsole,iptEmulate);

Myfile=record
name,fullpath:String;
Lines,InputContent,OutputContent,TerminalContent:TStringList;
bookmarks:array of longint;
bc:longint;
saved:boolean;
empty:boolean;
inputname,outputname:String;
FileInputType:MyInputType;
end;


var  AllFile:array [1..100] of MyFile;
     FileCount,sel:smallint;
     stopline:integer=-1;
     errorLine:integer=-1;
     crash:boolean=false;
     State:WriteProgramState=wpsEdit;
     InputType:MyInputType=iptFile;
     wantdebug,wantcursor:boolean;
     wantcursorpos:integer;
     fi,fo:string;
     removeIO:boolean=true;

     wasEdit:boolean=false;
     skipBreak:boolean=false;
     lastvalue:string;
     lastx,lasty:longint;


procedure swap(var a,b:Myfile);
var w:Myfile;
begin
w:=a;
a:=b;
b:=w;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var prpath:string;
     pr:TStringListUTF8;
     par,val,s:string;
     i,q:longint;
 begin
  ForceDirectoriesUTF8(AddDefines('%t'));
  SetCurrentDirUTF8(ExtractFilePath(ParamStrUTF8(0)));

  FileCount:=1;
  sel:=1;
  allfile[FileCount].name:='Untitle.pas';
  allfile[FileCount].fullpath:='';
  allfile[FileCount].Lines:=TStringList.Create;
  allfile[FileCount].saved:=false;
  allfile[FileCount].empty:=true;
  allfile[FileCount].inputname:='input.txt';
  allfile[FileCount].outputname:='output.txt';
  allfile[FileCount].InputContent:=TStringList.Create;
  allfile[FileCount].OutputContent:=TStringList.Create;
  allfile[FileCount].TerminalContent:=TStringList.Create;


  prpath:=ExtractFileDir(ParamStr(0));
  CompileCommand:='bin/fpc.exe -g -vwne -WC -FE"%t" "%f"';
  BuildCommand:='bin/fpc.exe -g -vwne -WC "%f"';
  RunComand:='"%t/%n.exe"';
  GdbComand:='bin/gdb.exe -q -f';

  wantdebug:=false;
  wantcursor:=false;

  {KGrid1.Cols[1].Extent:=3000;
  KGrid1.Cells[0,0]:='Выражение';
  KGrid1.Cells[1,0]:='Значение';
 // KGrid1.ColCount:=2;   }

 If FileExistsUTF8('setings.ini') then
 begin
 pr:=TStringListUTF8.Create;
 pr.LoadFromFile('setings.ini');
 for i:=0 to pr.Count-1 do
     if pos('=',pr[i])<>0 then
     begin
     par:=copy(pr[i],1,pos('=',pr[i])-1);
     val:=copy(pr[i],pos('=',pr[i])+1,length(pr[i])-pos('=',pr[i]));
     {$B-}
     while (par<>'') and (par[1]=' ') do delete(par,1,1);
     while (par<>'') and (par[length(par)]=' ') do delete(par,length(par),1);
     while (val<>'') and (val[1]=' ') do delete(val,1,1);
     while (val<>'') and (val[length(val)]=' ') do delete(val,length(val),1);
     {$B+}
     par:=LowerCase(par);
     If par=LowerCase('CompileCommand') then  CompileCommand:=val;
     If par=LowerCase('BuildCommand') then  BuildCommand:=val;
     If par=LowerCase('RunComand') then  RunComand:=val;
     If par=LowerCase('GdbComand') then  GdbComand:=val;
     if par=LowerCase('NAME') then youname:=val;
     if par=LowerCase('E-MAIL') then email:=val;
     end;
  pr.Free;
 end;

for i:=2 to Paramcount do
begin
     s:=ParamStrUTF8(i-1);
     OpenFile(s);
end;

end;

procedure TMainForm.FormDropFiles(Sender: TObject;
  const FileNames: array of String);
var
   i: int32;
begin
     for i:=1 to length(FileNames) do
         openfile(FileNames[i-1]);
end;

procedure TMainForm.GDBMessageTimerStopTimer(Sender: TObject);
var w:longint;
     rd:boolean;
begin
    if GDBProcess.Running then  GDBProcess.Terminate(0);
    stopline:=-1;
  SetRunButtons(true,false);
  MainSynEdit.Invalidate;
  state:=wpsEdit;
  UnLockInterface;



  w:=1;
  while GDBProcess.Running do
  begin
  sleep(50);
  Application.ProcessMessages;
  inc(w);
  If w>100 then begin ShowMessage('Невозможно завершить приложение'); exit end;
  end;

  w:=1;
    while (not FileIsReadable(fi)) or (not FileIsReadable(fo))  do
  begin
  sleep(50);
  Application.ProcessMessages;
  inc(w);
  If w>100 then begin ShowMessage('Невозможно прочитать вывод'); exit end;
  end;



    w:=1;
  rd:=false;
  InputSynEdit.ClearAll;
  OutputSynEdit.ClearAll;
  repeat
  inc(w);
  sleep(50);
  try
  InputSynEdit.Lines.LoadFromFile(fi);
  OutputSynEdit.Lines.LoadFromFile(fo);
  If removeIO then
  begin
  DeleteFile(fi);
  DeleteFile(fo);
  end;
  finally  rd:=true;
  end;

  until (rd) or (w>100);

  if not rd then  begin ShowMessage('Невозможно прочитать вывод'); exit end;


end;

procedure TMainForm.ParseByLine(var source,s:string);
begin
  If pos(LineEnding,source)=0 then
  begin
  s:=source;
  source:='';
  end else
  begin
  s:=Copy(source,1,pos(LineEnding,source)-1);
  delete(source,1,pos(LineEnding,source)+Length(LineEnding)-1);
  while pos('(gdb)',s)<>0 do delete(s,pos('(gdb)',s),6)
  end;
end;

procedure TMainForm.breakline(s:string);
var ss:string;
begin
 If skipBreak then begin skipBreak:=false; exit; end;
 if pos(LinuxStyleSlash(AllFile[sel].fullpath),s)=0 then
    If not crash then WriteGDB('finish')  else  WriteGDB('up 1') else
    begin
    delete(s,1,pos(LinuxStyleSlash(AllFile[sel].fullpath),s)+length(LinuxStyleSlash(AllFile[sel].fullpath)));
    stopline:=StrToInt(copy(s,1,pos(':',s)-1));
    BrLineTimer.Enabled:=false;
    MainSynEdit.CaretY:=stopline;
    SetRunButtons(true,true);
    state:=wpsDebug;
    MainSynEdit.Invalidate;
    end;
end;

procedure TMainForm.VerticalSplitterChangeBounds(Sender: TObject);
begin
      MainForm.Repaint;
end;

{procedure TMainForm.WatchValueListEditorColRowDeleted(Sender: TObject;
  IsColumn: Boolean; sIndex, tIndex: Integer);
begin
 wasEdit:=false;
 lastx:=0;
 lasty:=1;
 WatchValueListEditor.Col:=0;
 WatchValueListEditor.Row:=1;
end;}

{procedure TMainForm.WatchValueListEditorExit(Sender: TObject);
begin
  If wasEdit then ChangeWatch(lastx,lasty,lastvalue,WatchValueListEditor.Cells[lastx,lasty]);
wasEdit:=false;
end;}

procedure TMainForm.WatchValueListEditorGetEditText(Sender: TObject; ACol,
  ARow: Integer; var Value: string);
begin
  If not wasEdit then
  begin
  lastvalue:=Value;
  lastx:=ACol;
  lasty:=ARow;
  end;
  wasedit:=true;
end;

{procedure TMainForm.WatchValueListEditorSelectCell(Sender: TObject; aCol,
  aRow: Integer; var CanSelect: Boolean);
begin
If wasEdit then
begin
ChangeWatch(lastx,lasty,lastvalue,WatchValueListEditor.Cells[lastx,lasty]);
CanSelect:=false;
exit;
end;

if acol=0 then WatchValueListEditor.Options:=WatchValueListEditor.Options+[goEditing] else WatchValueListEditor.Options:=WatchValueListEditor.Options-[goEditing];
end; }

procedure TMainForm.GDBMessageTimerTimer(Sender: TObject);
var s,ss,per:string;
     l:TStringList;
     i,code:longint;
begin
  s:=readOutputData(GDBProcess);

  while s<>'' do
  begin
  ParseByLine(s,ss);
  PrintGDB(ss);

  if ss='' then Continue;

  if (pos('exited with code',ss)<>0) then
  begin
  i:=length(ss);
  while not (ss[i] in['0'..'9']) do dec(i);
  while ss[i]<>' ' do dec(i);
  delete(ss,1,i);
  while not (ss[length(ss)] in['0'..'9']) do delete(ss,length(ss),1);
  code:=StrToInt(ss);
  GDBMessageTimer.Enabled:=false;


  If code<>0 then ShowMessage('Программа завершилась с кодом ошибки: '+IntToStr(code));
  end else

  If pos(#26#26,ss)<>0 then breakline(copy(ss,pos(#26#26,ss),length(ss)-pos(#26#26,ss)+1)) else

  If (State=wpsDebug) and (ss[1] in ['0'..'9']) and (pos(': ',ss)<>0) and (pos(': ',ss)<pos('= ',ss)) then
  begin
  delete(ss,1,pos(': ',ss)+1);
  per:=copy(ss,1,pos(' = ',ss)-1);
  delete(ss,1,pos(' = ',ss)+2);
 { for i:=2 to KGrid1.RowCount do
      If UPCASE(KGrid1.Cells[0,i-1])=UPCASE(per) then KGrid1.Cells[1,i-1]:=ss;}
  end else

  if (pos('Program received signal ',ss)<>0) then
  begin
  crash:=true;
  ShowMessage('В программе возникло асинхронное событие');
  end else

  if  (not GDBProcess.Running) or (pos('exited normally',ss)<>0) then
  begin
  GDBMessageTimer.Enabled:=false;
  end;
  end;

  end;

procedure TMainForm.HorizontalSplitterCanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin

end;

procedure TMainForm.HorizontalSplitterChangeBounds(Sender: TObject);
begin
    MainForm.Repaint;
end;

procedure TMainForm.HorizontalSplitterMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TMainForm.HorizontalSplitterMoved(Sender: TObject);
begin

end;




procedure TMainForm.InputNameEditChange(Sender: TObject);
begin
    If InputNameEdit.Enabled then AllFile[sel].inputname:=InputNameEdit.Text;
end;

procedure TMainForm.KGrid1CellChanging(Sender: TObject; AOldCol, AOldRow,
  ANewCol, ANewRow: Integer);
begin
   // if (ANewCol=1) then KGrid1.EditorMode:=false;
    //KGrid1.Options:=KGrid1.Options+[goEditing] else KGrid1.Options:=KGrid1.Options-[goEditing];

end;

procedure TMainForm.KGrid1Changed(Sender: TObject; ACol, ARow: Integer);
var s:string;
begin
{s:=KGrid1.Cells[ACol, ARow];
CorrectWatch(s);
KGrid1.Cells[ACol, ARow]:=s;

  If (s<>'') and (ARow=KGrid1.RowCount-1) then
    begin
    KGrid1.RowCount:=KGrid1.RowCount+1;
    KGrid1.Col:=0;
    KGrid1.Row:=KGrid1.RowCount-1;
    If (State=wpsRun) or (State=wpsDebug) then WriteGDB('display '+s);
    end else

 If (s='') and (ARow<>KGrid1.RowCount-1) then KGrid1.DeleteRow(aRow) else

 If (State=wpsRun) or (State=wpsDebug) then
 begin

 WriteGDB('display '+s);
 end; }
end;

procedure TMainForm.KGrid1Enter(Sender: TObject);
begin
  end;

procedure TMainForm.KGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin

end;


procedure TMainForm.BotonTabControlChange(Sender: TObject);
begin
  case BotonTabControl.TabIndex of
  0:MessagePanel.BringToFront;
  1:WatchPanel.BringToFront;
  end;
end;

procedure TMainForm.setrunbuttons(Erun,Estop:boolean);
begin
 ToolButton11.Enabled:=erun;
 ToolButton12.Enabled:=estop;
end;

function ReadOutputData(process:TProcess):string;
begin
readOutputData:='';
while Process.Output.NumBytesAvailable<>0 do  readOutputData+=char(Process.Output.ReadByte);
end;

procedure TMainForm.TerminalEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var s:string;
begin
    If (key=VK_RETURN) and (RunMessageTimer.Enabled) then
  begin
  s:=TerminalEdit.Text+LineEnding;
  RunProcess.Input.WriteBuffer(s[1],length(s));
  TerminalMemo.Lines.Add(TerminalEdit.Text);
  TerminalEdit.Text:='';
  end;
end;

procedure TMainForm.run;
var s:string;
i:longint;
begin
state:=wpsRun;
CleanGDBOutput;
TerminalMemo.Lines.Clear;
crash:=false;


If InputType=iptConsole then
begin
RunProcess.CommandLine:='"'+AddDefines(RunComand)+'"';
RunProcess.CurrentDirectory:=ExtractFileDir(Allfile[sel].fullpath);
try
RunProcess.Execute;
except
  ShowMessage('Невозможно запустить программу');
    SetRunButtons(true,false);
    wantdebug:=false;
wantcursor:=false;
 exit;
end;
wantcursor:=false;
RunMessageTimer.Enabled:=true;
TerminalMemo.Lines.Add('Программа запущена');
exit;
end;

GDBProcess.CommandLine:=AddDefines(GdbComand);
GDBProcess.CurrentDirectory:=ExtractFileDir(Allfile[sel].fullpath);
try
GDBProcess.Execute;
except
  ShowMessage('Невозможно запустить GDB');
  SetRunButtons(true,false);
  wantdebug:=false;
wantcursor:=false;
 exit;
end;

WriteGDB('set width 0');
WriteGDB('file "'+LinuxStyleSlash(AddDefines(RunComand))+'"');

If wantdebug then WriteGDB('b main');
If wantcursor then WriteGDB('b "'+ExtractFileName(Allfile[sel].fullpath)+'":'+IntToStr(wantcursorpos));
for i:=1 to MainSynEdit.Marks.Count do  WriteGDB('b '+ExtractFileName(Allfile[sel].fullpath)+':'+IntToStr(MainSynEdit.Marks[i-1].Line));

If InputType=iptFile then
begin
fi:=ExtractFileDir(AllFile[sel].fullpath)+slash+InputNameEdit.Text;
fo:=ExtractFileDir(AllFile[sel].fullpath)+slash+OutputNameEdit.Text;

removeIO:=not FileExists(fi);
InputSynEdit.Lines.SaveToFile(fi);
OutputSynEdit.Lines.SaveToFile(fo);

WriteGDB('r');
end;

If InputType=iptEmulate then
begin
fi:=ExtractFileDir(AllFile[sel].fullpath)+slash+ExtractFileNameOnly(AllFile[sel].fullpath)+'.input.tmp';
fo:=ExtractFileDir(AllFile[sel].fullpath)+slash+ExtractFileNameOnly(AllFile[sel].fullpath)+'.output.tmp';

removeIO:=true;
InputSynEdit.Lines.SaveToFile(fi);
OutputSynEdit.Lines.SaveToFile(fo);


{$IFDEF Windows}
If not wantdebug then WriteGDB('b main');
WriteGDB('r');
WriteGDB('p dup2(open("'+LinuxStyleSlash(fi)+'", 0), 0) ');
WriteGDB('p dup2(open("'+LinuxStyleSlash(fo)+'", 1), 1) ');
If not wantdebug then
begin
WriteGDB('c');
skipBreak:=true;
end;
{$ELSE}
 WriteGDB('r <"'+LinuxStyleSlash(fi)+'" >"'+LinuxStyleSlash(fo)+'"');
{$ENDIF}
end;


//for i:=2 to KGrid1.RowCount-1 do WriteGDB('display '+ KGrid1.Cells[0,i-1]);

GDBMessageTimer.Enabled:=true;
wantcursor:=false;
wantdebug:=false;
end;

procedure TMainForm.CompilMessageTimerTimer(Sender: TObject);
var s,ss:string;
begin
    s:=ReadOutputData(CompProcess);
while s<>'' do
begin
ParseByLine(s,ss);
if s<>'' then
begin
MessageSynMemo.Lines.Add(ss);
If errorLine=-1 then MessageSynMemo.CaretY:=MessageSynMemo.Lines.Count;
end;
If ((errorLine=-1) and ((pos('Error:',ss)<>0) or (pos('Fatal:',ss)<>0))) and (copy(ss,1,pos('(',ss)-1)=ExtractFileName(AllFile[sel].fullpath)) then
   begin
   errorLine:=strtoint(copy(ss,pos('(',ss)+1,pos(',',ss)-pos('(',ss)-1));
   MainSynEdit.CaretY:=errorLine;
   MainSynEdit.Invalidate;
   end;
end;

if not CompProcess.Running then
begin
CompilMessageTimer.Enabled:=false;
State:=wpsEdit;
If CompProcess.ExitStatus=0 then MessageSynMemo.Lines.Add('Успешно') else begin  MessageSynMemo.Lines.Add('Ошибка компиляции');   SetRunButtons(true,false); wantcursor:=false; wantdebug:=false; UnLockInterface;  end;
If (errorLine=-1) then MessageSynMemo.CaretY:=MessageSynMemo.Lines.Count;
If WaitForExecute then
begin
WaitForExecute:=false;
If CompProcess.ExitStatus=0 then Run  else SetRunButtons(true,false);
end else UnLockInterface;
end;
end;

var brst:boolean;
procedure TMainForm.BrLineTimerStartTimer(Sender: TObject);
begin
brst:=false;
end;

procedure TMainForm.BrLineTimerTimer(Sender: TObject);
begin
  If not brst then brst:=true else
  begin
  stopline:=-1;
  BrLineTimer.Enabled:=false;
  end;
end;

function FdToSso(a:TFindOptions):TSynSearchOptions;
begin
 FdToSso:=[];

 If not (TFindOption.frDown in a) then  FdToSso+=[TSynSearchOption.ssoBackwards];
 If TFindOption.frEntireScope  in a then  FdToSso:=FdToSso+[ssoEntireScope];
If TFindOption.frFindNext  in a then     FdToSso+=[ssoFindContinue];
 If TFindOption.frMatchCase  in a then    FdToSso+=[TSynSearchOption.ssoMatchCase];
 If TFindOption.frReplace  in a  then    FdToSso+=[TSynSearchOption.ssoReplace] ;
If TFindOption.frPromptOnReplace   in a  then   FdToSso+=[TSynSearchOption.ssoSearchInReplacement]+ [TSynSearchOption.ssoPrompt];
 If TFindOption.frReplaceAll   in a  then    FdToSso+=[TSynSearchOption.ssoReplaceAll ];
 If TFindOption.frWholeWord in a then    FdToSso+=[TSynSearchOption.ssoWholeWord];

end;


procedure TMainForm.FindDialog1Find(Sender: TObject);
begin
MainSynEdit.SearchReplace(FindDialog1.FindText,FindDialog1.FindText,FdToSso(FindDialog1.Options));
end;

procedure TMainForm.FormClick(Sender: TObject);
begin

end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var pr:TStringListUTF8;
begin
     If GDBProcess.Running then GDBProcess.Terminate(0);
     If CompProcess.Running then CompProcess.Terminate(0);
     If RunProcess.Running then RunProcess.Terminate(0);
  DeleteDirectory(ExtractFileDir(ParamStr(0))+'\temp',true);

  pr:=TStringListUTF8.Create;
  pr.Add('CompileCommand='+CompileCommand);
  pr.Add('BuildCommand='+BuildCommand);
  pr.Add('RunComand='+RunComand);
  pr.Add('GdbComand='+GdbComand);
  pr.Add('NAME='+youname);
  pr.Add('E-MAIL='+email);

  pr.SaveToFile('setings.ini');
  pr.Free;

  If wantUpdate then
  begin
  UpdateProcess.CommandLine:='zup.exe '+ParamStr(0)+'.tmp '+ParamStr(0);
  UpdateProcess.Execute;
  end;
end;

procedure TMainForm.MainSynEditGutterClick(Sender: TObject; X, Y,
  Line: integer; mark: TSynEditMark);
var m:TSynEditMark;
begin
If MainSynEdit.Marks.Line[Line]<>nil then
   begin
   MainSynEdit.Marks.Remove(MainSynEdit.Marks.Line[Line][0]);
   If (State=wpsDebug) or (State=wpsRun) then WriteGDB('clear '+IntToStr(line));
   end
   else
begin
m := TSynEditMark.Create(MainSynEdit);
m.Line := Line;
m.ImageList := BookMarkImageList;
m.ImageIndex := 0;
m.Visible := true;
MainSynEdit.Marks.Add(m);
If (State=wpsDebug) or (State=wpsRun) then WriteGDB('b '+IntToStr(line))
end;

MainSynEdit.Invalidate;
end;

procedure TMainForm.MainSynEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  If (ssCtrl in Shift) and (key=VK_G) then MainSynEdit.InsertTextAtCaret(AddDefines(GNUGPL));
end;

procedure TMainForm.MainSynEditKeyPress(Sender: TObject; var Key: char);
begin
  Status.Invalidate;
end;

procedure TMainForm.MainSynEditPaint(Sender: TObject; ACanvas: TCanvas);
begin
  UpdateState;
end;

procedure TMainForm.MainSynEditSpecialLineColors(Sender: TObject;
  Line: integer; var Special: boolean; var FG, BG: TColor);
begin
  If MainSynEdit.Marks.Line[line]<>nil then
  begin
  Special:=true;
  BG:=clYellow;
  end;

  if (line=stopline) and (state=wpsDebug) then
  begin
  Special:=true;
  BG:=clBlue;
  FG:=clYellow;
  end;

  If (line=errorLine) and (state=wpsEdit) then
  begin
  Special:=true;
  BG:=clRed;
  FG:=clYellow;
  end;
end;

procedure TMainForm.MainSynEditStatusChange(Sender: TObject;
  Changes: TSynStatusChanges);
begin
    if (scModified in Changes) and (MainSynEdit.Modified=true)  then
    begin
    AllFile[sel].saved:=false;
    allfile[sel].empty:=false;
    errorLine:=-1;
    end;
end;

procedure TMainForm.MenuItem11Click(Sender: TObject);
begin
  AtalonTestForm.Show;
end;

procedure TMainForm.MenuItem14Click(Sender: TObject);
begin
  lience.LienceForm.Show;
end;

procedure TMainForm.MenuItem18Click(Sender: TObject);
begin
  SettingForm.Show;
end;

procedure TMainForm.MenuItem1CopyClick(Sender: TObject);
begin
  MainSynEdit.CopyToClipboard;
end;

procedure TMainForm.MenuItem22Click(Sender: TObject);
begin
  If State<>wpsEdit then exit;

SaveFile(sel);

if not AllFile[sel].saved then
begin
WaitForExecute:=false;
SetRunButtons(true,false);
Exit;
end;

BotonTabControl.TabIndex:=0;
MessagePanel.BringToFront;
LockInterface;

errorLine:=-1;
State:=wpsCompil;
MessageSynMemo.Lines.Clear;
MessageSynMemo.Lines.Add('Компиляция...');
CompProcess.CommandLine:=AddDefines(BuildCommand);
CompProcess.Execute;
CompilMessageTimer.Enabled:=true;
end;

procedure TMainForm.MenuItem7Click(Sender: TObject);
begin
  CalculatorDialog1.Execute;
end;

procedure TMainForm.MenuItem8Click(Sender: TObject);
begin
  ansiitable.AnsiiTableForm.Show;
end;

procedure TMainForm.MenuItemAboutClick(Sender: TObject);
begin
  AboutForm.Show;
end;

procedure TMainForm.MenuItemHelpClick(Sender: TObject);
begin
  ShowMessage('Пока нету');
end;

procedure TMainForm.MenuItemInputConsoleClick(Sender: TObject);
begin
  InputType:=iptConsole;
  ToolButton20.Down:=false;
    ToolButton22.Down:=false;
    ToolButton24.Down:=true;
    IOGroupBox.Visible:=false;
    TerminalGroupBox.Visible:=true;
    TerminalGroupBox.BringToFront;
end;


procedure TMainForm.MenuItemInputEmulateClick(Sender: TObject);
begin
    InputType:=iptEmulate;
    ToolButton20.Down:=false;
    ToolButton22.Down:=true;
    ToolButton24.Down:=false;
    IOGroupBox.Visible:=true;
    TerminalGroupBox.Visible:=false;
    IOGroupBox.BringToFront;
    InputNameEdit.Enabled:=false;
    InputNameEdit.Text:='Эмуляция клавиатуры';
    OutputNameEdit.Enabled:=false;
    OutputNameEdit.Text:='Эмуляция клавиатуры';
end;

procedure TMainForm.MenuItemInputFileClick(Sender: TObject);
begin
  InputType:=iptFile;
  ToolButton20.Down:=true;
  ToolButton22.Down:=false;
  ToolButton24.Down:=false;
  IOGroupBox.Visible:=true;
  TerminalGroupBox.Visible:=false;
  IOGroupBox.BringToFront;
  InputNameEdit.Enabled:=true;
  InputNameEdit.Text:=AllFile[sel].inputname;
  OutputNameEdit.Enabled:=true;
  OutputNameEdit.Text:=AllFile[sel].outputname;
end;

procedure TMainForm.MenuItemGDBLineClick(Sender: TObject);
begin
  GDBForm.Show;
end;

procedure TMainForm.MenuItemToCursorClick(Sender: TObject);
begin
   If State=wpsDebug then
   begin
    BrLineTimer.Enabled:=true;
   MainSynEdit.Invalidate;
   SetRunButtons(false,true);
  WriteGDB('tb '+ExtractFileName(AllFile[sel].fullpath)+':'+IntToStr(MainSynEdit.CaretY));
  WriteGDB('c');
  state:=wpsRun;
   end;

   if State=wpsEdit then
  begin
  wantcursor:=true;
  wantcursorpos:=MainSynEdit.CaretY;
  MenuItemRunClick(sender);
  end;
end;

procedure TMainForm.MenuItemCloseAllClick(Sender: TObject);
var i:longint;
begin
   if State<>wpsEdit then exit;
  For i:=1 to FileCount do CloseCarefully(i);
end;

procedure TMainForm.closefile(index:longint);
var i:longint;
begin
if FileCount=1 then
begin
 allfile[1].name:='Untitle.pas';
  allfile[1].fullpath:='';
  allfile[1].Lines.Clear;
  allfile[1].saved:=false;
  allfile[1].empty:=true;
  TabControl1.Tabs[0]:='Untitle.pas';

  allfile[1].inputname:='input.txt';
  allfile[1].outputname:='output.txt';
  allfile[1].InputContent.Clear;
  allfile[1].OutputContent.Clear;
  allfile[1].TerminalContent.Clear;

 ReloadFrom(1);
  exit;
end;

For i:=sel to FileCount-1 do swap(allfile[i],AllFile[i+1]);
AllFile[FileCount].Lines.Free;
AllFile[FileCount].InputContent.Free;
AllFile[FileCount].OutputContent.Free;
AllFile[FileCount].TerminalContent.Free;
dec(FileCount);

 If index>FileCount then  index:=FileCount;
MainSynEdit.Lines.Clear;
For i:=1 to AllFile[index].Lines.Count do MainSynEdit.Lines.Add(AllFile[index].Lines[i-1]);


TabControl1.Tabs.Delete(index-1);
end;


procedure TMainForm.closecarefully(index:smallint);
begin

if not AllFile[index].saved then
Case MessageDlg('Файл '+AllFile[index].name+' не сохранён. Сохранить?',mtConfirmation,mbYesNoCancel,0) of
mrYes:begin SaveFile(index); if  AllFile[index].saved then Closefile(index); end;
mrNo:Closefile(index);
end else
begin
closefile(index);
end;

end;

procedure TMainForm.MenuItemCloseClick(Sender: TObject);
begin
if State<>wpsEdit then exit;

closecarefully(sel);
end;

procedure TMainForm.MenuItemCompilClick(Sender: TObject);
begin
If State<>wpsEdit then exit;


SaveFile(sel);

if not AllFile[sel].saved then
begin
WaitForExecute:=false;
SetRunButtons(true,false);
Exit;
end;

BotonTabControl.TabIndex:=0;
MessagePanel.BringToFront;
LockInterface;

errorLine:=-1;
State:=wpsCompil;
MessageSynMemo.Lines.Clear;
MessageSynMemo.Lines.Add('Компиляция...');
CompProcess.CommandLine:=AddDefines(CompileCommand);
ShowMessage(CompProcess.CommandLine);
try
CompProcess.Execute;
except
 MessageSynMemo.Lines.Add('Невозможно запустить компилятор');
 State:=wpsEdit;
 UnLockInterface;
 exit;
end;
CompilMessageTimer.Enabled:=true;
end;


procedure TMainForm.ReloadTo(index:longint);
var i:longint;
begin
 if (index<1) or (index>FileCount) then exit;

 allfile[index].Lines.Clear;
 for i:=1 to MainSynEdit.Lines.Count do  allfile[index].Lines.Add(MainSynEdit.Lines[i-1]);

 allfile[index].bc:=MainSynEdit.Marks.Count;
 SetLength(allfile[index].bookmarks,allfile[index].bc+1);
 for i:=1 to allfile[index].bc do allfile[index].bookmarks[i]:=MainSynEdit.Marks[i-1].Line;

{ AllFile[index].inputname:=InputNameEdit.Text;
 AllFile[index].outputname:=OutputNameEdit.Text; }

 AllFile[index].InputContent.Clear;
 For i:=1 to InputSynEdit.Lines.Count do AllFile[index].InputContent.Add( InputSynEdit.Lines[i-1]);

 AllFile[index].OutputContent.Clear;
 For i:=1 to OutputSynEdit.Lines.Count do AllFile[index].OutputContent.Add(OutputSynEdit.Lines[i-1]);

  AllFile[index].TerminalContent.Clear;
 For i:=1 to TerminalMemo.Lines.Count do AllFile[index].TerminalContent.Add(TerminalMemo.Lines[i-1]);

 AllFile[index].FileInputType:=InputType;

end;

procedure TMainForm.ReloadFrom(index:longint);
var i:longint;
     m:TSynEditMark;
begin
if (index<1) or (index>FileCount) then exit;
 MainSynEdit.Lines.Clear;
  for i:=1 to  allfile[index].Lines.Count do
      MainSynEdit.Lines.Add(allfile[index].Lines[i-1]);

  For i:=1 to MainSynEdit.Marks.Count do
      MainSynEdit.Marks.Delete(0);

 for i:=1 to allfile[index].bc do
     begin
     m := TSynEditMark.Create(MainSynEdit);
     m.Line := allfile[index].bookmarks[i];
     m.ImageList := BookMarkImageList;
     m.ImageIndex := 0;
     m.Visible := true;
     MainSynEdit.Marks.Add(m);
     end;

 InputNameEdit.Text:=AllFile[index].inputname;
 OutputNameEdit.Text:=AllFile[index].outputname;

 InputSynEdit.Lines.Assign(AllFile[index].InputContent);
 OutputSynEdit.Lines.Assign(AllFile[index].OutputContent);
 TerminalMemo.Lines.Assign(AllFile[index].TerminalContent);

 case AllFile[index].FileInputType  of
 iptConsole:MenuItemInputConsoleClick(MainForm);
 iptEmulate:MenuItemInputEmulateClick(MainForm);
 iptFile:MenuItemInputFileClick(MainForm);
 end;
end;

procedure TMainForm.MenuItemCreateClick(Sender: TObject);
begin
if State<>wpsEdit then exit;

     Inc(FileCount);
  allfile[FileCount].name:='Untitle.pas';
  allfile[FileCount].fullpath:='';
  allfile[FileCount].Lines:=TStringList.Create;
  allfile[FileCount].saved:=false;
  allfile[FileCount].empty:=true;
  allfile[FileCount].bc:=0;

  allfile[FileCount].inputname:='input.txt';
  allfile[FileCount].outputname:='output.txt';
  allfile[FileCount].InputContent:=TStringList.Create;
  allfile[FileCount].OutputContent:=TStringList.Create;
  allfile[FileCount].TerminalContent:=TStringList.Create;

  TabControl1.Tabs.Add('Untitle.pas');


  Reselect(FileCount);
end;

procedure TMainForm.MenuItemExitClick(Sender: TObject);
begin
  MenuItemCloseAllClick(MainForm);
  MainForm.Close;
end;

procedure TMainForm.MenuItemFindClick(Sender: TObject);
begin
If State<>wpsEdit then exit;
FindDialog1.Execute
end;

procedure TMainForm.MenuItemFindNextClick(Sender: TObject);
begin
If State<>wpsEdit then exit;
  MainSynEdit.SearchReplace(FindDialog1.FindText,FindDialog1.FindText,FdToSso(FindDialog1.Options));
end;

Procedure TMainForm.WriteGDB(s:string);
begin
If (State=wpsDebug) or (State=wpsRun) then
begin
PrintGDB(s);
s:=s+LineEnding;
s:=UTF8ToConsole(s);
GDBProcess.Input.WriteBuffer(s[1],length(s));
end;
end;


procedure loadtxt(source:string);
var t:TextFile;
     s:string;
begin
assign(t,(source));
reset(t);
read(t,s);
close(t);
end;

procedure TMainForm.openfile(const filename:string);
var q:longint;
begin
If not allfile[sel].empty then
begin
Inc(FileCount);
q:=FileCount;
TabControl1.Tabs.Add(ExtractFileName(FileName))
end else
begin
q:=sel;
TabControl1.Tabs[q-1]:=ExtractFileName(FileName);
end;

 with allfile[q] do
 begin
 fullpath:=(FileName);
 name:=ExtractFileName(FileName);
 Lines:=TStringList.Create;
 empty:=false;
 bc:=0;
 FileInputType:=iptFile;
 inputname:='input.txt';
 outputname:='output.txt';
 InputContent:=TStringList.Create;
 OutputContent:=TStringList.Create;
 TerminalContent:=TStringList.Create;

 LoadStringsFromFileUTF8(Lines,FileName);

 saved:=true;
 end;



if sel=q then reloadfrom(q) else Reselect(q);
end;



procedure TMainForm.MenuItemOpenClick(Sender: TObject);
begin

if State<>wpsEdit then exit;

If not OpenDialog1.Execute then exit;

openfile(OpenDialog1.FileName)

end;

procedure TMainForm.MenuItemPasteClick(Sender: TObject);
begin
   MainSynEdit.PasteFromClipboard;
end;

procedure TMainForm.MenuItemReDoClick(Sender: TObject);
begin
  MainSynEdit.Redo;
end;

procedure TMainForm.MenuItemReplaseClick(Sender: TObject);
begin
If State<>wpsEdit then exit;
  ReplaceDialog1.Execute;
end;

procedure TMainForm.MenuItemRunClick(Sender: TObject);
begin
If State=wpsDebug then
begin
BrLineTimer.Enabled:=true;
MainSynEdit.Invalidate;
WriteGDB('c');
state:=wpsRun;
SetRunButtons(false,true);
end else
begin
SetRunButtons(false,true);
WaitForExecute:=true;
MenuItemCompilClick(sender);
end;
end;



procedure TMainForm.SaveFileAs(index:SmallInt);
var i:longint;
begin
If MainForm.SaveDialog1.Execute then
with allfile[index] do
 begin
 fullpath:=MainForm.SaveDialog1.FileName;
 If (SaveDialog1.FilterIndex=1) and (copy(fullpath,length(fullpath)-3,4)<>'.pas') then fullpath+='.pas';
 name:=ExtractFileName(fullpath);
 MainForm.TabControl1.Tabs[index-1]:=name;
 ReloadTo(index);
 If index=sel then MainSynEdit.Lines.SaveToFile(allfile[index].fullpath) else SaveStringsToFileUTF8(allfile[index].Lines,allfile[index].fullpath);
 If index=sel then MainSynEdit.Modified:=false;
 allfile[index].saved:=true;
 end;
end;

procedure TMainForm.SaveFile(index:SmallInt);
var i:longint;
begin
  If AllFile[index].fullpath<>'' then
  begin
  ReloadTo(index);
  If index=sel then MainSynEdit.Lines.SaveToFile(allfile[index].fullpath) else SaveStringsToFileUTF8(allfile[index].Lines,allfile[index].fullpath);
  allfile[index].saved:=true;
  If index=sel then MainSynEdit.Modified:=false;
  end else SaveFileAs(index);
end;

procedure TMainForm.MenuItemSaveAllClick(Sender: TObject);
var i:longint;
begin
  For i:=1 to FileCount do savefile(i);
end;

procedure TMainForm.MenuItemSaveAsClick(Sender: TObject);
begin
 SaveFileAs(sel);
end;

procedure TMainForm.MenuItemSaveClick(Sender: TObject);
begin
 SaveFile(sel);
end;

procedure TMainForm.MenuItemStepClick(Sender: TObject);
begin
  If State=wpsDebug then
  begin
    BrLineTimer.Enabled:=true;
    MainSynEdit.Invalidate;
    SetRunButtons(false,true);
  WriteGDB('s');
  state:=wpsRun;

  end;

  if State=wpsEdit then
  begin
  wantdebug:=true;
  MenuItemRunClick(sender);
  end;
end;

procedure TMainForm.MenuItemStepOverClick(Sender: TObject);
begin
    If State=wpsDebug then
    begin
        BrLineTimer.Enabled:=true;
        MainSynEdit.Invalidate;
        SetRunButtons(false,true);
    WriteGDB('n');
    state:=wpsRun;
    end;

if State=wpsEdit then
  begin
  wantdebug:=true;
  MenuItemRunClick(sender);
  end;
end;

procedure TMainForm.MenuItemStopClick(Sender: TObject);
begin

If GDBProcess.Running then
begin
GDBMessageTimer.Enabled:=false;
end;

if RunProcess.Running then
begin
RunMessageTimer.Enabled:=false;
end;

end;

procedure TMainForm.MenuItemUnDoClick(Sender: TObject);
begin
  MainSynEdit.Undo;
end;

procedure TMainForm.MenuItemVrClick(Sender: TObject);
var q:string;
begin
  MainSynEdit.CopyToClipboard;
  q:=MainSynEdit.Text;
  Delete(q,MainSynEdit.SelStart,MainSynEdit.SelEnd-MainSynEdit.SelStart);
  MainSynEdit.Text:=q;
end;

procedure TMainForm.MenuItemWathClick(Sender: TObject);
begin
  BotonTabControl.TabIndex:=1;
  WatchPanel.BringToFront;
end;

procedure TMainForm.MessageSynMemoKeyPress(Sender: TObject; var Key: char);
begin
 Status.Invalidate;
end;

procedure TMainForm.MessageSynMemoSpecialLineColors(Sender: TObject;
  Line: integer; var Special: boolean; var FG, BG: TColor);
begin

  if (pos('Error:',MessageSynMemo.Lines[line-1])<>0) or  (pos('Fatal:',MessageSynMemo.Lines[line-1])<>0) or (pos('Ошибка компиляции',MessageSynMemo.Lines[line-1])<>0) then
  begin
  Special:=true;
  fg:=clRed;
  end;

  if (pos('Warning:',MessageSynMemo.Lines[line-1])<>0) or (pos('Hits:',MessageSynMemo.Lines[line-1])<>0) or (pos('Note:',MessageSynMemo.Lines[line-1])<>0)  then
  begin
  Special:=true;
  fg:=clBlue;
  end;

  If pos('Успешно',MessageSynMemo.Lines[line-1])<>0 then
  begin
  Special:=true;
  fg:=clgreen;
  end;

end;

procedure TMainForm.OutputNameEditChange(Sender: TObject);
begin
    If OutputNameEdit.Enabled then AllFile[sel].outputname:=OutputNameEdit.Text;
end;

procedure TMainForm.ReplaceDialog1Find(Sender: TObject);
begin
MainSynEdit.SearchReplace(ReplaceDialog1.FindText,ReplaceDialog1.ReplaceText,FdToSso(ReplaceDialog1.Options));
end;

procedure TMainForm.ReplaceDialog1Replace(Sender: TObject);
begin
If frReplaceAll in ReplaceDialog1.Options then
begin
MainSynEdit.SearchReplace(ReplaceDialog1.FindText,ReplaceDialog1.ReplaceText,FdToSso(ReplaceDialog1.Options)+[ssoSelectedOnly]);
MainSynEdit.SearchReplace(ReplaceDialog1.FindText,ReplaceDialog1.ReplaceText,FdToSso(ReplaceDialog1.Options))
end else
begin
  MainSynEdit.SearchReplace(ReplaceDialog1.FindText,ReplaceDialog1.ReplaceText,FdToSso(ReplaceDialog1.Options)+[ssoSelectedOnly]);
  MainSynEdit.SearchReplace(ReplaceDialog1.FindText,ReplaceDialog1.ReplaceText,FdToSso(ReplaceDialog1.Options)-[ssoReplace]);
end;
end;

procedure TMainForm.RunMessageTimerStopTimer(Sender: TObject);
begin
  SetRunButtons(true,false);
  UnLockInterface;
  MainSynEdit.Invalidate;
  state:=wpsEdit;
  TerminalMemo.Lines.Add('Программа завершилась');
end;

procedure TMainForm.RunMessageTimerTimer(Sender: TObject);
var s:string;
begin
  s:=readOutputData(RunProcess);
  TerminalMemo.Text:=TerminalMemo.Text+s;
  TerminalMemo.Invalidate;
  If not RunProcess.Running then RunMessageTimer.Enabled:=false;
end;

procedure TMainForm.Splitter1ChangeBounds(Sender: TObject);
begin
      MainForm.Repaint;
end;

procedure TMainForm.StatusTimerTimer(Sender: TObject);
begin
  Status.Invalidate;
end;

procedure TMainForm.reselect(new:SmallInt);
begin
 ReloadTo(sel);
 sel:=new;
 reloadFrom(sel);

 MainForm.TabControl1.TabIndex:=sel-1;
end;

procedure TMainForm.TabControl1Change(Sender: TObject);
begin
  If (State<>wpsEdit) and (TabControl1.TabIndex+1<>sel)  then
  begin
  TabControl1.TabIndex:=sel-1;
  exit;
  end;

     if  TabControl1.TabIndex+1<=FileCount then
   if sel<>TabControl1.TabIndex+1 then reselect(TabControl1.TabIndex+1);

end;

function AddDefines(s:String):String;
var q:longint;
begin
while UTF8pos('%f',s)<>0 do
begin
q:=UTF8pos('%f',s);
UTF8Delete(s,q,2);
UTF8Insert(AllFile[sel].fullpath,s,q);
end;

while UTF8pos('%t',s)<>0 do
begin
q:=UTF8pos('%t',s);
UTF8delete(s,q,2);
UTF8Insert(GetCurrentDirUTF8+'/temp',s,q);
end;

while UTF8pos('%n',s)<>0 do
begin
q:=UTF8pos('%n',s);
UTF8delete(s,q,2);
UTF8Insert(ExtractFileNameOnly(AllFile[sel].fullpath),s,q);
end;

while UTF8pos('$FILENAME',s)<>0 do
begin
q:=UTF8pos('$FILENAME',s);
UTF8delete(s,q,UTF8length('$FILENAME'));
UTF8insert(AllFile[sel].name,s,q);
end;

while UTF8pos('$NAME',s)<>0 do
begin
q:=UTF8pos('$NAME',s);
UTF8delete(s,q,UTF8length('$NAME'));
UTF8insert(youname,s,q);
end;

while UTF8pos('$EMAIL',s)<>0 do
begin
q:=UTF8pos('$EMAIL',s);
UTF8delete(s,q,UTF8length('$EMAIL'));
UTF8insert(email,s,q);
end;

while UTF8pos('$YEAR',s)<>0 do
begin
q:=UTF8pos('$YEAR',s);
UTF8delete(s,q,UTF8length('$YEAR'));
UTF8insert(inttostr(YearOf(now)),s,q);
end;

AddDefines:=s;
end;



procedure TMainForm.UpdateState;
var s,ss:string;
begin
s:='Состояние:   ';
s+='| Строка: '+inttostr(MainSynEdit.CaretY)+' ';
s+='| Столбец: '+inttostr(MainSynEdit.CaretX)+' ';
s+='| Выделенно: '+inttostr(MainSynEdit.SelEnd-MainSynEdit.SelStart)+' ';
If MainSynEdit.InsertMode then s+='| Редактирование: вставка ' else s+='| Редактирование: замена ';
If AllFile[sel].saved then s+='| Статус: сохранён ' else s+='| Статус: не созранён ';
case State of
wpsCompil: s+='| Программа: компилирование';
wpsDebug: s+='| Программа: отладка';
wpsEdit: s+='| Программа: редактирование';
wpsRun: s+='| Программа: запущено';
end;
Status.SimpleText:=s;
end;


procedure TMainForm.CorrectWatch(var s:string);
var i:longint;
begin
If s='' then exit;
i:=1;
while i<=length(s) do
begin
If (s[i] in ['*','/','+','-']) and ((i>1) and (s[i-1]<>' ')) then begin Insert(' ',s,i); inc(i) end;
If (s[i] in ['*','/','+','-']) and ((i<length(s)) and (s[i+1]<>' ')) then begin Insert(' ',s,i+1); inc(i) end;
inc(i);
end;

while s[1]=' ' do delete(s,1,1);
while s[length(s)]=' ' do delete(s,length(s),1);

while pos('  ',s)<>0 do delete(s,pos('  ',s),1)
end;



Procedure TMainForm.LockInterface;
begin
MainSynEdit.ReadOnly:=true;
InputSynEdit.ReadOnly:=true;
OutputSynEdit.ReadOnly:=true;
IOToolBar.Enabled:=false;
MenuItem3.Enabled:=false;
MenuItem20.Enabled:=false;
end;

Procedure TMainForm.UnLockInterface;
begin
MainSynEdit.ReadOnly:=false;
InputSynEdit.ReadOnly:=false;
OutputSynEdit.ReadOnly:=false;
IOToolBar.Enabled:=true;
MenuItem3.Enabled:=true;
MenuItem20.Enabled:=True;
end;


function  TMainForm.LinuxStyleSlash(s:string):string;
var q:longint;
begin
while pos('\',s)<>0 do
begin
q:=pos('\',s);
delete(s,q,1);
insert('/',s,q);
end;
LinuxStyleSlash:=s;
end;

function  TMainForm.WindowsStyleSlash(s:string):string;
var q:longint;
begin
while pos('/',s)<>0 do
begin
q:=pos('/',s);
delete(s,q,1);
insert('\',s,q);
end;
WindowsStyleSlash:=s;
end;

end.

