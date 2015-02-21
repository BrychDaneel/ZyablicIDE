program zup;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes,sysutils,process
  { you can add units after this };
const maxpop=20;
var pr:TProcess;
  b:boolean;
  pop:longint;
begin
 pop:=0;
 repeat
 sleep(100);
 inc(pop);
 WriteLn('Deleting File '+ParamStr(2));
 b:=DeleteFile(ParamStr(2));
 If b then WriteLn('Sucsess') else  WriteLn('Error');
 until b or (pop>maxpop);

 If pop>0 then
 begin
      writeln('Can not remove file. ');
      exit;
 end;

 pop:=0;
 repeat
 sleep(100);
 inc(pop);
 WriteLn('Renaming File '+ParamStr(1)+' -> '+ParamStr(2));
 RenameFile(ParamStr(1),ParamStr(2));
 If b then WriteLn('Sucsess') else  WriteLn('Error');
 until b or (pop>maxpop);

 If pop>0 then
 begin
      writeln('Can not rename file');
      exit;
 end;


 WriteLn('Start aplication '+ParamStr(2));
 pr:=TProcess.Create(nil);
 pr.CommandLine:=ParamStr(2);
 pr.Options:=pr.Options+[poNewProcessGroup];
 try
 pr.Execute;
 except
 WriteLn('Error');
 end;
 pr.Free;
end.

