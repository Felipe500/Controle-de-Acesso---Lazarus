unit Modulo;

{$mode objfpc}{$H+}

interface

uses
  Forms,Classes, SysUtils, DB, ZConnection, ZDataset;

type

  { Tdm }

  Tdm = class(TDataModule)
    DSCaixa: TDataSource;
    DSCargos: TDataSource;
    DSFunc: TDataSource;
    DSUsuarios: TDataSource;
    fd: TZConnection;
    query_caixa: TZQuery;
    query_caixa_coringa: TZQuery;
    query_cargos: TZQuery;
    query_func: TZQuery;
    query_usuarios: TZQuery;
    tb_cargos: TZTable;
    tb_func: TZTable;
    tb_usuarios: TZTable;
    tb_caixa: TZTable;
    procedure DataModuleCreate(Sender: TObject);
    procedure fdBeforeConnect(Sender: TObject);
  private

  public

  end;

var
  dm: Tdm;
   total_pg:double;

  // DECLARAÇÃO DAS VARIAVEIS GLOBAIS
  idFunc: string;
  nomeFunc: string;
  cargoFunc: string;

  chamada: string;
  chamadacliente: string;
  nomeUsuario: string;
  nomeUser1: string;
  cargoUsuario: string;
  n_caixa:string;

  codigoProduto: string;

  idFornecedor: string;
  nomeFornecedor: string;

  nomeProduto: string;
  estoqueProduto: double;
  idProduto: string;

  totalProdutos: double;

  certificadoDig: string;

  statusCaixa: string;
  numeroCaixa: string;

  rel: string;
  excluir: string;
  msexcluir: string;

  venda_idproduto:string;
  venda_codproduto:string;
  btn_produto:boolean;

  cliente_id:string;
  cliente_nome:string;
  cliente_cpf:string;
  conectado:string;
  limite_conta:double;
  associar_conta1:string;

  nomenota:string;
  //controle caixa
  id_caixa_abert:string;
  caixa_controle:string;
  //encerrar caixa
  v_total_caixa:string;
  //COMANDO CONTROLE DE ACESSO
  COMANDO_ACESS:string;

  //comando cancelar excluir item
  comand_item:boolean;
implementation

{$R *.lfm}

{ Tdm }

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  // if not fd.Connected then
 // begin

  try
   begin
        fd.LibraryLocation:= ExtractFilePath(Application.ExeName)+'lib\libmysql.dll';

        fd.Connected := True;
        conectado:='sim';


   end
 except
  conectado:='nao';

 end;
  //end;
end;

procedure Tdm.fdBeforeConnect(Sender: TObject);
begin
  tb_cargos.TableName := 'cargos';
tb_func.TableName := 'funcionarios';
tb_usuarios.TableName := 'usuarios';
//tb_caixa.TableName := 'caixa';

end;

end.

