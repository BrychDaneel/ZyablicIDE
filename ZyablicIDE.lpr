program ZyablicIDE;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, main, GDBIO, settings, ansiitable, lience, about, AtalonTest;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TGDBForm, GDBForm);
  Application.CreateForm(TSettingForm, SettingForm);
  Application.CreateForm(TAnsiiTableForm, AnsiiTableForm);
  Application.CreateForm(TLienceForm, LienceForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TAtalonTestForm, AtalonTestForm);
  Application.Run;
end.

