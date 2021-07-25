program Embarca_PDV;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, Modulo, Caixa, Menu, Login2;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='PDV-teste';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.

