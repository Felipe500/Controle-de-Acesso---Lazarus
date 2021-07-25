unit Menu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, DBGrids;

type

  { TFrmMenu }

  TFrmMenu = class(TForm)
    atualizarCaixa: TTimer;
    atualizarEstoque: TTimer;
    gridCaixa: TDBGrid;
    gridVendas: TDBGrid;
    Image10: TImage;
    Image11: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lbcaixas: TLabel;
    lbcargo: TLabel;
    lbData: TLabel;
    lbData1: TLabel;
    lbentrada: TLabel;
    lbentradas: TLabel;
    lbEstoque: TLabel;
    lbHora: TLabel;
    lbsaida: TLabel;
    lbsaldo: TLabel;
    lbusuario: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    pnEstoque: TPanel;
    Produtos1: TMenuItem;
    Fornecedores: TMenuItem;
    NivelAcesso: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Timer1: TTimer;
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
  private

  public

  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.lfm}

{ TFrmMenu }

procedure TFrmMenu.MenuItem28Click(Sender: TObject);
begin

end;

procedure TFrmMenu.MenuItem19Click(Sender: TObject);
begin
  //l
end;

procedure TFrmMenu.Produtos1Click(Sender: TObject);
begin

end;

end.

