unit Caixa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons;

type

  { TFrmCaixa }

  TFrmCaixa = class(TForm)
    btnAbrir: TSpeedButton;
    BtnFechar: TSpeedButton;
    btnPDV: TButton;
    edtCaixa: TEdit;
    edtSenha: TEdit;
    EdtUsuario: TEdit;
    edtValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    procedure btnAbrirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
      procedure limpar;
    procedure habilitarCampos;
    procedure desabilitarCampos;

    procedure associarCampos;
    procedure listar;
    procedure verificar_caixa;

  public

  end;

var
  FrmCaixa: TFrmCaixa;


  gerente: string;
  cargoGerente: string;
  valorVendido: double;
  valorQuebra: double;
  total_caixa:double;
  valorAbertura: double;
  sangria_caixa:double;
  suprimentos_caixa:double;
  total_apurado:double;

  horaAbertura:Ttime;
  horaFechamento:Ttime;

  fechadopdv: boolean;

implementation

uses Modulo;

{$R *.lfm}

{ TFrmCaixa }

procedure TFrmCaixa.btnAbrirClick(Sender: TObject);
begin
  if Trim(edtValor.Text) = '' then
  begin
    MessageDlg('Preencha o Valor!', mtInformation, mbOKCancel, 0);
    edtValor.SetFocus;
    exit;
  end;

  if Trim(edtCaixa.Text) = '' then
  begin
    MessageDlg('Preencha o Caixa!', mtInformation, mbOKCancel, 0);
    edtCaixa.SetFocus;
    exit;
  end;

  // VERIFICAR SE O CAIXA JÁ ESTÁ ABERTO
  dm.query_caixa.Close;
  dm.query_caixa.SQL.Clear;
  dm.query_caixa.SQL.Add
    ('SELECT * from caixa where status = :status and num_caixa = :num and data_abertura = curDate()');
  dm.query_caixa.ParamByName('status').Value := 'Aberto';
  dm.query_caixa.ParamByName('num').Value := edtCaixa.Text;
  dm.query_caixa.Open;

  if not dm.query_caixa.isEmpty then
  begin
    MessageDlg('Este caixa já está aberto!', mtInformation, mbOKCancel, 0);
    exit;
  end;


    // VERIFICAR PERMISSAO DO GERENTE
    dm.query_usuarios.Close;
    dm.query_usuarios.SQL.Clear;
    dm.query_usuarios.SQL.Add
    ('SELECT * from usuarios where usuario = :usuario and senha = :senha');
    dm.query_usuarios.ParamByName('usuario').Value := EdtUsuario.Text;
    dm.query_usuarios.ParamByName('senha').Value := edtSenha.Text;
    dm.query_usuarios.Open;

    limpar;

  if not dm.query_usuarios.isEmpty then
  begin
    gerente := dm.query_usuarios['nome'];
    cargoGerente := dm.query_usuarios['cargo'];

    // VERIFICAR SE QUEM LOGOU FOI UM OPERADOR DE CAIXA
    if (cargoGerente <> 'Gerente')  then
    begin

      edtSenha.Text := '';
      MessageDlg('Você não tem permissão de Gerente ou do Admin!', mtInformation,
        mbOKCancel, 0);
      exit;
    end;

  end
  else
  begin
    MessageDlg('Dados de Login Incorretos!!', mtInformation, mbOKCancel, 0);
    EdtUsuario.Text := '';
    edtSenha.Text := '';
    EdtUsuario.SetFocus;
    exit;
  end;
end;

procedure TFrmCaixa.FormShow(Sender: TObject);
begin
    if not length(Trim(edtCaixa.Text)) >0 then
  begin

    Label5.Visible:=True
  end
  else
   Label5.Visible:=False;

  verificar_caixa;
  habilitarCampos;
  dm.tb_caixa.Active := true;
  listar;
  edtCaixa.Text := numeroCaixa;
  EdtUsuario.SetFocus;

  if statusCaixa = 'Abertura' then
  begin
    habilitarCampos;
    dm.tb_caixa.Insert;
    btnAbrir.Enabled := true;
  end;
end;

procedure TFrmCaixa.limpar;
begin
  //ss
    EdtUsuario.Text := '';
  edtSenha.Text := '';
  edtValor.Text := '';
end;

procedure TFrmCaixa.habilitarCampos;
begin
 //ss
  EdtUsuario.Enabled := true;
  edtSenha.Enabled := true;
  edtValor.Enabled := true;
  edtCaixa.Enabled := true;
end;

procedure TFrmCaixa.desabilitarCampos;
begin
 //ss
end;

procedure TFrmCaixa.associarCampos;
begin
  //sss
    dm.tb_caixa.FieldByName('data_abertura').Value := DateToStr(Date);
  dm.tb_caixa.FieldByName('hora_abertura').Value := TimeToStr(Time);
  dm.tb_caixa.FieldByName('valor_abertura').Value := strToFloat(edtValor.Text);
  dm.tb_caixa.FieldByName('val_suprimento').Value := strToFloat(edtValor.Text);
  dm.tb_caixa.FieldByName('val_dinheiro').Value := strToFloat(edtValor.Text);
  dm.tb_caixa.FieldByName('funcionario_abertura').Value := gerente;
  dm.tb_caixa.FieldByName('num_caixa').Value := edtCaixa.Text;
  dm.tb_caixa.FieldByName('operador').Value := nomeUsuario;
  dm.tb_caixa.FieldByName('status').Value := 'Aberto';
end;

procedure TFrmCaixa.listar;
begin
  //ss
end;

procedure TFrmCaixa.verificar_caixa;
begin
   //ss
  // VERIFICAR SE O CAIXA JÁ ESTÁ ABERTO
  dm.query_caixa.Close;
  dm.query_caixa.SQL.Clear;
  dm.query_caixa.SQL.Add
    ('SELECT * from caixa where status = :status and num_caixa = :num and data_abertura = curDate()');
  dm.query_caixa.ParamByName('status').Value := 'Aberto';
  dm.query_caixa.ParamByName('num').Value := edtCaixa.Text;
  dm.query_caixa.Open;

  if not dm.query_caixa.isEmpty then
  begin
     fechadopdv:=False;
   btnAbrir.Enabled:=False;
   btnAbrir.Visible:=False;

   Label5.Caption:='Caixa está aberto. Clique em PDV';
    exit;
  end
  else
  begin
        dm.query_caixa.Close;
      dm.query_caixa.SQL.Clear;
      dm.query_caixa.SQL.Add
      ('SELECT * from caixa where status = :status and num_caixa = :num and data_abertura = curDate()');
      dm.query_caixa.ParamByName('status').Value := 'Fechado';
      dm.query_caixa.ParamByName('num').Value := edtCaixa.Text;
      dm.query_caixa.Open;

      if not dm.query_caixa.isEmpty then
      begin
          fechadopdv:=True;
          btnAbrir.Enabled:=False;
          btnAbrir.Visible:=False;

          Label5.Caption:='Caixa está fechado. Abra um novo caixa.';
          exit;
      end
      else
        begin
          fechadopdv:=False;
           btnAbrir.Enabled:=True;
          btnAbrir.Visible:=True;

          Label5.Caption:='Caixa ainda não foi aberto. Clique em Abrir';
          exit;
        end;


  end;


end;

end.

