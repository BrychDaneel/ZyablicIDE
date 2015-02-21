unit about;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpwebdata, fphtml, FileUtil,  Forms,
  Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,fphttpclient;

type

  { TAboutForm }

  TAboutForm = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DownloadNewVersion;
    procedure Timer1StartTimer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  AboutForm: TAboutForm;


implementation
    uses main;
    var   updateprog:boolean=false;
    WorkCountMax: Int64;
{$R *.lfm}

{ TAboutForm }

procedure TAboutForm.FormCreate(Sender: TObject);
begin

end;

procedure  TAboutForm.DownloadNewVersion;
var stream:TStream;
  fs:TFileStream;
begin


end;


procedure TAboutForm.Timer1StartTimer(Sender: TObject);
begin


end;

procedure TAboutForm.Button1Click(Sender: TObject);
var s:string;
begin

 Case MessageDlg('Доспуна версия '+s+' установить?',mtConfirmation,mbYesNo,0) of
 mrYes:DownloadNewVersion;
 end;

end;

end.

