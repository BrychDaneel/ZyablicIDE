unit about;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpwebdata, fphtml, FileUtil,  Forms,
  Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,fphttpclient, LazUTF8,LazUTF8Classes;

type

  { TAboutForm }

  TAboutForm = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    ProgressTimer: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DownloadNewVersion;
    procedure FormShow(Sender: TObject);
    procedure ProgressTimerTimer(Sender: TObject);
    procedure Timer1StartTimer(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;


  type TDownloadThread=class(TThread)
  public
          URL,FileName:TStringListUTF8;
          procedure OnDoneLoad;
         procedure OnErrorLoad;
          function GetProgress:int32;
          function GetFullSize:int64;
  private
         FPHTTPClient:TFPHTTPClient;
         Stream:TFileStreamUTF8;
         maxload,doneload:Int64;
  protected
           procedure Execute; override;
  end;


  filevers=record
    name:string;
    maj,min,rev,bild:int32;
  end;


  myfiles= record
  platform,updatesource,zyabvers:string;
    f:array [1..1000] of filevers;
    n:longint;
    end;

var
  AboutForm: TAboutForm;
  filein,newfile,filetoupdate:myfiles;

  upfile,url:TStringListUTF8;

implementation
    uses main;
    var   updateprog:boolean=false;
          DownloadThread:TDownloadThread;
{$R *.lfm}

{ TAboutForm }



procedure   TDownloadThread.Execute;
var i:int32;
    str:TStringListUTF8;
    s:string;
begin
     str:=TStringListUTF8.Create;
     FPHTTPClient:=TFPHTTPClient.Create(Application);
     maxload:=0;
     doneload:=0;
      for i:=0 to URL.Count-1 do
     begin
          Try
            FPHTTPClient.Head(URL[i],str);
          except
            Synchronize(@OnErrorLoad);
            exit;
          end;
          s:=str[FPHTTPClient.IndexOfHeader(str,'Content-Length')];
          delete(s,1,pos(' ',s));
          maxload+=StrToInt64(s);
     end;

     for i:=0 to URL.Count-1 do
     begin
          Stream:=TFileStreamUTF8.Create(FileName[i],fmCreate);
          Try
            FPHTTPClient.SimpleGet(URL[i],stream);
          except
            Synchronize(@OnErrorLoad);
            exit;
          end;
          doneload+=stream.Size;
          Stream.Free;
     end;

     Synchronize(@OnDoneLoad);
end;

function TDownloadThread.GetProgress:int32;
var
    ds,ns,fs:int64;
begin

     ds:=doneload;
     ns:=Stream.Size;
     if maxload=0 then fs:=1 else fs:=maxload;

     GetProgress:=Round(((ds+ns)/fs)*100);
end;

function TDownloadThread.GetFullSize:int64;
begin
    GetFullSize:=maxload;
end;

procedure  getfilelist(var f:myfiles; const str:TStringListUTF8);
var s:string;
    i:longint;
begin
s:=str[0];
f.platform:=copy(s,pos('=',s)+1,length(s)-pos('=',s));

s:=str[1];
f.updatesource:=copy(s,pos('=',s)+1,length(s)-pos('=',s));

s:=str[2];
f.zyabvers:=copy(s,pos('=',s)+1,length(s)-pos('=',s));

f.n:=str.Count-3;
for i:=3 to str.Count-1 do
begin
    s:=str[i];
    f.f[i-2].name:=copy(s,1,pos('=',s)-1);
    delete(s,1,pos('=',s));
    f.f[i-2].maj:=StrToInt(copy(s,1,pos('.',s)-1));
    delete(s,1,pos('.',s));
    f.f[i-2].min:=StrToInt(copy(s,1,pos('.',s)-1));
    delete(s,1,pos('.',s));
    f.f[i-2].rev:=StrToInt(copy(s,1,pos('.',s)-1));
    delete(s,1,pos('.',s));
    f.f[i-2].bild:=StrToInt(s);
end;

end;


operator > (const a,b:filevers) otv:boolean;
begin
If a.maj>b.maj then otv:=true else
  if a.maj<b.maj then otv:=false else

    If a.min>b.min then otv:=true else
        if a.min<b.min then otv:=false else

           If a.rev>b.rev then otv:=true else
              if a.rev<b.rev then otv:=false else

                 If a.bild>b.bild then otv:=true else otv:=false;
end;

procedure compfile(const f,nf:myfiles;var uf:myfiles);
var
   up:boolean;
   i,ii:int32;
begin
uf.n:=0;
uf.updatesource:=nf.updatesource;
uf.platform:=nf.platform;
for i:=1 to nf.n do
begin
     up:=true;
    for ii:=1 to f.n do
        If nf.f[i].name=f.f[ii].name then
           up:=nf.f[i]>f.f[ii];

    if up then
    begin
         inc(uf.n);
         uf.f[uf.n]:=nf.f[i];
    end;
end;
end;

procedure TAboutForm.FormCreate(Sender: TObject);
var stream:TStream;
  fs:TFileStream;
  str:TStringListUTF8;
  s:string;
begin
If FileExistsUTF8('version.inf') then
begin
  str:=TStringListUTF8.Create;
  LoadStringsFromFileUTF8(str,'version.inf');
  getfilelist(filein,str);
  Label1.Caption:='Версия: '+filein.zyabvers;
  Label2.Caption:=' Платорма: '+filein.platform+' (CPU-OS-ВИДЖЕТЫ)';
  end else
  begin
       Label1.Caption:='Версия: Файл описания не найден';
       Label2.Caption:='Платформа: Файл описания не найден';
  end;
end;

procedure  TDownloadThread.OnDoneLoad;
begin
with AboutForm do
begin
     ProgressTimer.Enabled:=false;
     wantUpdate:=true;
     ShowMessage('Обновление успешно загружено. Изменения будут применены после выхода.');
     Button1.Caption:='Проверить обновление';
end;
end;

procedure  TDownloadThread.OnErrorLoad;
var
   i: int32;
begin
with AboutForm do
begin
    ProgressTimer.Enabled:=false;

    wantUpdate:=false;
    for i:=0 to upfile.Count-1 do
        If FileExistsUTF8(upfile[i]) then
           if pos('zup',filetoupdate.f[i].name)=0 then
              DeleteFileUTF8(upfile[i]);

    //If Sender is TDownloadThread then ShowMessage('Ошибка при загрузке');
    Button1.Caption:='Проверить обновление';
end;
end;

procedure  TAboutForm.DownloadNewVersion;
var
   i:int32;
begin
     upfile:=TStringListUTF8.Create;
     url:=TStringListUTF8.Create;
     for i:=1 to filetoupdate.n do
     begin
     if pos('zup',filetoupdate.f[i].name)=0 then
        upfile.Add(filetoupdate.f[i].name+'.tmp')
     else
         upfile.Add(filetoupdate.f[i].name);
     url.Add(filetoupdate.updatesource+filetoupdate.platform+'/'+filetoupdate.f[i].name);
     end;

     DownloadThread:=TDownloadThread.Create(true);
     DownloadThread.FreeOnTerminate:=true;
     DownloadThread.URL:=TStringListUTF8.Create;
     DownloadThread.URL.Assign(url);
     DownloadThread.FileName:=TStringListUTF8.Create;
     DownloadThread.FileName.Assign(upfile);
    // DownloadThread.OnDone:=@DoneLoad;
   //  DownloadThread.OnError:=@ErrorLoad;
     DownloadThread.Resume;

     ProgressTimer.Enabled:=true;
end;

procedure TAboutForm.FormShow(Sender: TObject);
begin
    (Sender as TForm).Left:=(Screen.Width - (Sender as TForm).Width) div 2;
  (Sender as TForm).Top:=(Screen.Height - (Sender as TForm).Height) div 2;
end;

procedure TAboutForm.ProgressTimerTimer(Sender: TObject);
var ns,ds,fs:int64;
   pr:int32;
begin
  if not Assigned(DownloadThread.Stream) then Button1.Caption:='Загрузка: проверка файлов...  ОСТАНОВИТЬ' else
     begin
     ns:=DownloadThread.Stream.Size;
     ds:=DownloadThread.doneload;
     if DownloadThread.maxload=0 then fs:=1 else fs:=DownloadThread.maxload;
     pr:=Round(((ds+ns)/fs)*100);
     Button1.Caption:='Загрузка: '+IntToStr(pr)+'% ('+FloatToStr(trunc(fs/1024/1024*100)/100)+'МБ)   ОСТАНОВИТЬ';
     end;
end;


procedure TAboutForm.Timer1StartTimer(Sender: TObject);
begin


end;

procedure TAboutForm.Button1Click(Sender: TObject);
var s:string;
    str:TStringListUTF8;
    FPHTTPClient:TFPHTTPClient;
    mes:string;
begin
if ProgressTimer.Enabled then
begin
  ProgressTimer.Enabled:=false;
  KillThread(DownloadThread.Handle);
  sleep(100);
  DownloadThread.OnErrorLoad;
  exit;
end;


str:=TStringListUTF8.Create;

if filein.platform='' then
begin
ShowMessage('Файл описания не найден. Обновление невозможно. Подробнее смотрите на сайте');
 exit;
end;

 try
    FPHTTPClient:=TFPHTTPClient.Create(Application);
    FPHTTPClient.SimpleGet(filein.updatesource+filein.platform+'/version.inf',str);
 Except
   FPHTTPClient.Free;
   ShowMessage('Невозможно подключиться к источнику обновлений');
   exit;
 end;
 FPHTTPClient.Free;

 getfilelist(newfile,str);
 compfile(filein,newfile,filetoupdate);

 if filetoupdate.n=0 then ShowMessage('Все файлы обновлены') else
    begin
     If filein.zyabvers<>newfile.zyabvers then  mes:='Доступна версия'+newfile.zyabvers+'. Установить?' else mes:='У вас новая версия, но доступны обнавления для некоторых файлов. Установить?';
     Case MessageDlg(mes,mtConfirmation,mbYesNo,0) of
     mrYes:DownloadNewVersion;
     end;

    end;
str.Free;
end;

end.

