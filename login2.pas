unit Login2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls;

type

  { TfrmLogin }

  TfrmLogin = class(TForm)
    btnLogin: TSpeedButton;
    EdtSenha: TEdit;
    EdtUsuario: TEdit;
    imgFundo: TImage;
    imgLogin: TImage;
    Panel1: TPanel;
    pnbanco: TPanel;
    pnlLogin: TPanel;
    procedure btnLoginClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
   procedure login;
  public

  end;

var
  frmLogin: TfrmLogin;

implementation

uses Caixa, Menu, Modulo;


{$R *.lfm}

{ TfrmLogin }

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  //dd
    if Trim(EdtUsuario.Text) = '' then
  begin
    MessageDlg('Preencha o Usuário!', mtInformation, mbOKCancel, 0);
    EdtUsuario.SetFocus;

    exit;
  end;

  if Trim(EdtSenha.Text) = '' then
  begin
    MessageDlg('Preencha a Senha!', mtInformation, mbOKCancel, 0);
    EdtSenha.SetFocus;
    exit;
  end;

  Login;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 13 then
    Login;

end;

procedure TfrmLogin.FormResize(Sender: TObject);
begin
    pnlLogin.Top := (self.Height div 2) - (pnlLogin.Height div 2);
  pnlLogin.Left := (self.Width div 2) - (pnlLogin.Width div 2);
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  if conectado='sim' then
begin
pnbanco.Caption:='SISTEMA CONECTADO AO BANCO DE DADOS' ;

end

ELSE
begin
pnbanco.Caption:='ERRO! - SISTEMA NÃO ESTÁ CONECTADO AO BANCO DE DADOS' ;
pnbanco.Color:=clBlack; ;
pnbanco.Font.Color:=$00FF0080;
btnLogin.Enabled:=False;
end;

end;

procedure TfrmLogin.login;
begin

   // AQUI VIRA O CÓDIGO DE LOGIN

  dm.query_usuarios.Close;
  dm.query_usuarios.SQL.Clear;
  dm.query_usuarios.SQL.Add
    ('SELECT * from usuarios where usuario = :usuario and senha = :senha');

  dm.query_usuarios.ParamByName('usuario').Value := EdtUsuario.Text;
  dm.query_usuarios.ParamByName('senha').Value := EdtSenha.Text;

  dm.query_usuarios.Open;

  if not dm.query_usuarios.isEmpty then
  begin
    nomeUsuario := dm.query_usuarios['nome'];
    cargoUsuario := dm.query_usuarios['cargo'];

    // VERIFICAR SE QUEM LOGOU FOI UM OPERADOR DE CAIXA
    if cargoUsuario = 'Operador de Caixa' then
    begin
      SHOWMESSAGE('operador de caixa');
      FrmCaixa := TFrmCaixa.Create(FrmLogin);
      EdtSenha.Text := '';
      statusCaixa := 'Abertura';
      FrmCaixa.ShowModal;

      exit;
    end;

    FrmMenu := TFrmMenu.Create(FrmLogin);
    EdtSenha.Text := '';
    FrmMenu.ShowModal;

  end
  else
  begin
    MessageDlg('Os dados estão incorretos!!', mtInformation, mbOKCancel, 0);
    EdtUsuario.Text := '';
    EdtSenha.Text := '';
    EdtUsuario.SetFocus;
  end;
end;

end.

