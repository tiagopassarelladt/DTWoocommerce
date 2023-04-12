unit Unit2;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  WooCommerce4D,
  WooCommerce4D.Interfaces,
  WooCommerce4D.Types,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IdCoderMIME, Woocommerce;

type
  TForm2 = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    cmbTipoProduto: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    Label2: TLabel;
    edtPreco: TEdit;
    edtPrecoPromo: TEdit;
    Label3: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    edtSku: TEdit;
    Label6: TLabel;
    chkGerEstoque: TCheckBox;
    Label7: TLabel;
    cmbStatusEstoque: TComboBox;
    Label8: TLabel;
    chkVendidoIndividual: TCheckBox;
    Label4: TLabel;
    Panel5: TPanel;
    Label11: TLabel;
    edtNomeAtributo: TEdit;
    chkAtribVisivel: TCheckBox;
    chkUsadoVariacoes: TCheckBox;
    btnAtrib: TButton;
    TabSheet5: TTabSheet;
    Panel6: TPanel;
    Label9: TLabel;
    Label12: TLabel;
    edtPeso: TEdit;
    cbClasseEntrega: TComboBox;
    Label5: TLabel;
    edtDim1: TEdit;
    edtDim2: TEdit;
    edtDim3: TEdit;
    Panel7: TPanel;
    Label10: TLabel;
    edtIdProdutoVariacoes: TEdit;
    btnAddVariacoes: TButton;
    btnCadastrarProd: TButton;
    TabSheet6: TTabSheet;
    Panel8: TPanel;
    Label13: TLabel;
    edtNomeCategoria: TEdit;
    Button4: TButton;
    Label14: TLabel;
    edtParentCategoria: TEdit;
    lbListaCategoria: TListBox;
    Label15: TLabel;
    Panel9: TPanel;
    edtIdAtributo: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    edtNomeTermoAtributo: TEdit;
    btnTermAtrib: TButton;
    btnListaCategoria: TButton;
    TabSheet7: TTabSheet;
    Memo1: TMemo;
    edtNomePrduto: TEdit;
    Label18: TLabel;
    edtDescricao: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    edtBaixaDescricao: TEdit;
    FDMemTable1: TFDMemTable;
    Button1: TButton;
    TabSheet8: TTabSheet;
    edtURL: TEdit;
    Label21: TLabel;
    edtConsumerKey: TEdit;
    Label22: TLabel;
    edtConsumerSecret: TEdit;
    Label23: TLabel;
    btnSalvarConfig: TButton;
    Woocommerce1: TWoocommerce;
    procedure FormCreate(Sender: TObject);
    procedure btnCadastrarProdClick(Sender: TObject);
    procedure btnAtribClick(Sender: TObject);
    procedure btnTermAtribClick(Sender: TObject);
    procedure btnAddVariacoesClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnListaCategoriaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnSalvarConfigClick(Sender: TObject);
  private
    { Private declarations }
  public
    Fwoocommerce : iWooCommerce4D;
    function Base64_Encoding(FileName : String) : String;
  end;

var
  Form2: TForm2;

implementation

uses
  System.TypInfo;

{$R *.dfm}

function TForm2.Base64_Encoding(FileName: String): String;
var
  stream: TFileStream;
  base64: TIdEncoderMIME;
  output: string;
begin
  Result := 'Error';
  if (FileExists(FileName)) then
  begin
    try
      base64 := TIdEncoderMIME.Create(nil);
      stream := TFileStream.Create(FileName, fmOpenRead);
      output := TIdEncoderMIME.EncodeStream(stream);
      stream.Free;
      base64.Free;
      if not(output = '') then
        Result := output
    except
      raise Exception.Create('Error convert image');
    end;
  end;
end;

procedure TForm2.btnAddVariacoesClick(Sender: TObject);
begin
  memo1.lines.Add(
  Fwoocommerce
    .Resources
    .Body(Fwoocommerce
          .Entity
            .ProductVariations
              .RegularPrice('9.00')
            .&End)
    ._Create(TEndpointBaseType.PRODUCTS.GetValue+'/'
      +edtIdProdutoVariacoes.Text+'/'+
      TEndpointBaseType.VARIATIONS.GetValue).Content);
end;

procedure TForm2.btnAtribClick(Sender: TObject);
begin
  memo1.lines.Add(
  Fwoocommerce
    .Resources
    .Body(Fwoocommerce
          .Entity
            .ProductAttributes
              .Name(edtNomeAtributo.Text)
              .Slug('pa_'+LowerCase(edtNomeAtributo.Text))
              ._Type(SELECT)
              .OrderBy(MENU_ORDER)
              .HasArchives(true)
            .&End)
    ._Create(PRODUCTS_ATTRIBUTES).Content);
end;

procedure TForm2.btnCadastrarProdClick(Sender: TObject);
begin
//  Memo1.Lines.Add(Base64_Encoding('C:\Users\Criacao\Pictures\laranjas.png'));
  memo1.lines.Add(
  Fwoocommerce
    .Resources
    .Body(Fwoocommerce
          .Entity
            .Products
              .Name(edtNomePrduto.Text)
              .RegularPrice(edtPreco.Text)
              .Description(edtDescricao.Text)
              .ShortDescription(edtBaixaDescricao.Text)
              ._Type(TStatusType(GetEnumValue(TypeInfo(TStatusType), cmbTipoProduto.Text)))
              .Dimensions
                ._Length(edtDim1.Text)
                .Width(edtDim2.Text)
                .Height(edtDim3.Text)
              .&End
              .Categories
                .Id(41)
              .Next
                .Id(42)
              .&End
              .Images
                .Src('http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg')
              .Next
                .Src('http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_back.jpg')
              .&End
            .&End
          )
    ._Create(PRODUCTS).Content);

end;

procedure TForm2.btnListaCategoriaClick(Sender: TObject);
begin
  Fwoocommerce
    .Resources
    .GetAll(PRODUCTS_CATEGORIES).DataSet(FDMemTable1);

  FDMemTable1.First;
  while not FDMemTable1.Eof do
  begin
    lbListaCategoria.items.Add(
    FDMemTable1.FieldByName('ID').AsString+'|'+
    FDMemTable1.FieldByName('NAME').AsString+'|'+
    FDMemTable1.FieldByName('PARENT').AsString);
    FDMemTable1.Next;
  end;
end;

procedure TForm2.btnSalvarConfigClick(Sender: TObject);
begin
Fwoocommerce.Config
    .Url(edtURL.Text)
    .ConsumerKey(edtConsumerKey.Text)
    .ConsumerSecret(edtConsumerSecret.Text)
    .Version(TApiVersionType.V3.ToString);
end;

procedure TForm2.btnTermAtribClick(Sender: TObject);
begin
  memo1.lines.Add(
  Fwoocommerce
    .Resources
    .Body(Fwoocommerce
          .Entity
            .ProductAttributeTerms
              .Name(edtNomeTermoAtributo.Text)
            .&End)
    ._Create(TEndpointBaseType.PRODUCTS_ATTRIBUTES.GetValue+'/'
      +edtIdAtributo.Text+'/'+
      TEndpointBaseType.TERMS.GetValue).Content);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  memo1.lines.Add(
    Fwoocommerce
      .Resources
      //.Params('exclude','6696,6677')
      .GetAll(COUPONS).Content
  );
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  memo1.lines.Add(
  Fwoocommerce
    .Resources
    .Body(Fwoocommerce
          .Entity
            .ProductCategories
              .Name(edtNomeCategoria.Text)
              .Parent(StrToInt(edtParentCategoria.Text))
            .&End)
    ._Create(PRODUCTS_CATEGORIES).Content);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
Fwoocommerce := TWooCommerce4D.new;
end;

end.
