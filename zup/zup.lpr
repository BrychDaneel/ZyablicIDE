program zup;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes,sysutils,process
  { you can add units after this };
const maxpop=40;
var pr:TProcess;
  b:boolean;
  pop,i:longint;
  q, qq: string;
  par:TStringList;
begin
  WriteLn('Start');

 for i:=0 to (Paramcount-1) div 2-1 do
 begin
 WriteLn(i+1,'st file');

 pop:=0;
 q:=ParamStr(i*2+1);
 qq:=ParamStr(i*2+2);
 repeat
 inc(pop);
 WriteLn('Deleting File '+qq);
 b:=DeleteFile(qq);
 If b then WriteLn('Sucsess') else    begin
   WriteLn('Error');
    sleep(100);
   end;
 until b or (pop>maxpop);

 If not b then
 begin
      writeln('Can not remove file. ');
      exit;
 end;

 pop:=0;
 repeat
 inc(pop);
 WriteLn('Renaming File '+q+' -> '+qq);
 b:=RenameFile(q,qq);
 If b then WriteLn('Sucsess') else
   begin
   WriteLn('Error');
    sleep(100);
   end;
 until b or (pop>maxpop);

 If not b then
 begin
      writeln('Can not rename file');
      exit;
 end;
 end;


 If odd(Paramcount) then
 begin

 WriteLn('Start aplication ',ParamStr(Paramcount));
 pr:=TProcess.Create(Nil);
 pr.CommandLine:=ParamStr(Paramcount);
 pr.Options:=pr.Options+[poNewProcessGroup];
 try
 pr.Execute;
 except
 WriteLn('Error');
 end;
 pr.Free;
 end;

end.

