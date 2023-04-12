unit Woocommerce;

interface

uses
  System.SysUtils, System.Classes, WooCommerce4D, WooCommerce4D.Interfaces,WooCommerce4D.Types,
  System.TypInfo, System.Generics.Collections,FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,WooCommerce4D.HttpClient.RestHttpClient;


type TListaCategorias = class
    id:integer;
    Name:string;
    Parent:string;
end;

Type TPedidos = class
     Id:Integer;
     Pedido:integer;
     Data:tdate;
     Total:Extended;
     Nome:string;
     Endereco:string;
     Numero:string;
     Cidade:string;
     UF:string;
     Cep:string;
     Email:string;
     Telefone:string;
     //produtos
     Codigo:string;
     Descricao:string;
     Quantidade:extended;
     Valor:Extended;
     TotalItem:Extended;
     Observacoes:string;
end;

type
  TWoocommerce = class(TComponent)
  private
    Fwoocommerce : iWooCommerce4D;
    FURL:string;
    FConsumerKey:string;
    FConsumerSecret:string;
    procedure SetUrl(const Value: string);
    procedure SetConsumerKey(const Value: string);
    procedure SetConsumerSecret(const Value: string);
  protected
    { Protected declarations }
  public
    Categorias:TList<TListaCategorias>;
    Pedidos:TList<TPedidos>;
    Function CadastraProduto(NomeProduto:string;Codigo:string;Valor:Extended;DescricaoDoProduto:string;DescricaoBaixa:string;Peso:Extended;Altura:Extended;Largura:Extended;ImgFrente:string;ImgVerso:string;IdCategoria:integer):string;
    function CadastaCategoria(Id:Integer;Descricao:string):string;
    function ListarCategorias:TListaCategorias;
    function ListarPedidos:TPedidos;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Url : string read FURL write SetUrl;
    property ConsumerKey : string read FConsumerKey write SetConsumerKey;
    property ConsumerSecret : string read FConsumerSecret write SetConsumerSecret;
  end;

procedure Register;

implementation

uses
  System.JSON;


procedure Register;
begin
  RegisterComponents('DT Inovacao', [TWoocommerce]);
end;

{ TWoocommerce }

function TWoocommerce.CadastaCategoria(Id: Integer; Descricao: string): string;
begin
    Fwoocommerce.Config
    .Url(FURL)
    .ConsumerKey(FConsumerKey)
    .ConsumerSecret(FConsumerSecret)
    .Version(TApiVersionType.V3.ToString);

     result := Fwoocommerce
                .Resources
                .Body(Fwoocommerce
                      .Entity
                        .ProductCategories
                          .Name(Descricao)
                          .Parent(0)
                        .&End)
                ._Create(PRODUCTS_CATEGORIES).Content;
end;

function TWoocommerce.CadastraProduto(NomeProduto:string;Codigo:string;Valor:Extended;DescricaoDoProduto:string;DescricaoBaixa:string;Peso:Extended;Altura:Extended;Largura:Extended;ImgFrente:string;ImgVerso:string;IdCategoria:integer):string;
begin
 Fwoocommerce.Config
    .Url(FURL)
    .ConsumerKey(FConsumerKey)
    .ConsumerSecret(FConsumerSecret)
    .Version(TApiVersionType.V3.ToString);

 Result := Fwoocommerce
    .Resources
    .Body(Fwoocommerce
          .Entity
            .Products
              .Name(NomeProduto)
              .Sku(Codigo)
              .RegularPrice(FloatToStr(valor))
              .Description(DescricaoDoProduto)
              .ShortDescription(DescricaoBaixa)
              ._Type(TStatusType(GetEnumValue(TypeInfo(TStatusType), 'SIMPLE')))
              .Dimensions
                ._Length(FloatToStr(peso))
                .Width(FloatToStr(Largura))
                .Height(FloatToStr(Altura))
              .&End
              .Categories
                .Id(IdCategoria)
//              .Next
//                .Id(IdCategoria+1)
              .&End
              .Images
                .Src(ImgFrente)
              .Next
                .Src(ImgVerso)
              .&End
            .&End
          )
    ._Create(PRODUCTS).Content;
end;

constructor TWoocommerce.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);

      Fwoocommerce := TWooCommerce4D.new;
      Categorias   := TList<TListaCategorias>.Create;
      Pedidos      := TList<TPedidos>.Create;
end;

destructor TWoocommerce.Destroy;
begin
      Categorias.Clear;
      Pedidos.Clear;

      FreeAndNil(Categorias);
      FreeAndNil(Pedidos);

  inherited Destroy;
end;

function TWoocommerce.ListarCategorias: TListaCategorias;
var
Memtable:TFDMemTable;
Cat : TListaCategorias;
begin
    Fwoocommerce.Config
    .Url(FURL)
    .ConsumerKey(FConsumerKey)
    .ConsumerSecret(FConsumerSecret)
    .Version(TApiVersionType.V3.ToString);

     Memtable := TFDMemTable.Create(nil);

      Fwoocommerce
    .Resources
    .GetAll(PRODUCTS_CATEGORIES).DataSet(Memtable);

    Categorias.Clear;

    while not Memtable.Eof do
    begin
         Cat        := TListaCategorias.Create;
         Cat.id     := Memtable.FieldByName('ID').AsInteger;
         Cat.Name   := Memtable.FieldByName('NAME').AsString;
         Cat.Parent := Memtable.FieldByName('PARENT').AsString;

         Categorias.Add(cat);

         Memtable.Next;
    end;

    FreeAndNil(Memtable);
end;

function TWoocommerce.ListarPedidos: TPedidos;
var
Ped: TPedidos;
Cliente,Observacoes,Produto: TJSONObject;
LstPedidos,listaitens,ListaObs: TJSONArray;
I,X:integer;
Memtable:TFDMemTable;
Conteudo:string;
St:TJSONValue;
Obj,Obj2:TJSONObject;
jv:TJSONValue;
ja:TJSONArray;
begin
      Fwoocommerce.Config
      .Url(FURL)
      .ConsumerKey(FConsumerKey)
      .ConsumerSecret(FConsumerSecret)
      .Version(TApiVersionType.V3.ToString);

      Pedidos.clear;

      Conteudo := Fwoocommerce.Resources.GetAll(ORDERS).Content;

      LstPedidos  := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(Conteudo),0) as TJSONArray;

      for i := 0 to Pred(LstPedidos.Count) do
        begin
              obj          := TJsonObject.ParseJSONValue(LstPedidos.Items[I].ToString) as TJsonObject;
              listaitens   := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(obj.Values['line_items'].ToString),0) as TJSONArray;
              ListaObs     := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(obj.Values['shipping_lines'].ToString),0) as TJSONArray;

              for x := 0 to Pred(listaitens.Count) do
                begin
                      Ped           := TPedidos.Create;
                      // Dados do Pedidos
                      Ped.Id        := StrToInt(obj.GetValue('id').Value);
                      Ped.Pedido    := StrToInt(obj.GetValue('number').Value);
                      Ped.Data      := StrToDate(Copy(obj.GetValue('date_created').value,9,2) + '/' + Copy(obj.GetValue('date_created').value,6,2) + '/' +Copy(obj.GetValue('date_created').value,1,4));
                      Ped.Total     := StrToFloat(obj.GetValue('total').value.Replace('.',','));
                      // Dados do Cliente
                      Cliente       := obj.Values['billing'] as TJSONObject;

                      Ped.Nome      := Cliente.GetValue('first_name').value + ' ' + Cliente.GetValue('last_name').value;
                      Ped.Endereco  := Cliente.GetValue('address_1').value;
                      ped.Numero    := Cliente.GetValue('address_2').value;
                      ped.Cidade    := Cliente.GetValue('city').value;
                      ped.UF        := Cliente.GetValue('state').value;
                      ped.Cep       := Cliente.GetValue('postcode').value.Replace('-','');
                      ped.Email     := Cliente.GetValue('email').value;
                      ped.Telefone  := Cliente.GetValue('phone').value;
                      // Dados do Produto
                      Produto       := listaitens.Items[x] as TJsonObject;

                      ped.Codigo    := produto.GetValue('sku').value;
                      ped.Descricao := produto.GetValue('name').value;
                      Ped.Quantidade:= StrToFloat(produto.GetValue('quantity').value.Replace('.',','));
                      ped.Valor     := StrToFloat(produto.GetValue('total').value.Replace('.',',')) / StrToFloat(produto.GetValue('quantity').value.Replace('.',','));
                      ped.TotalItem := StrToFloat(produto.GetValue('total').value.Replace('.',','));
                      // Observacoes do Pedido

                      Observacoes   := ListaObs.Items[0] as TJSONObject;

                      ped.Observacoes := Observacoes.GetValue('method_title').Value + ' - Valor Frete: ' + Observacoes.GetValue('total').Value;

                      Pedidos.Add(ped);
                end;
        end;
        FreeAndNil(LstPedidos);
end;

procedure TWoocommerce.SetConsumerKey(const Value: string);
begin
      FConsumerKey := Value;
end;

procedure TWoocommerce.SetConsumerSecret(const Value: string);
begin
      FConsumerSecret := Value;
end;

procedure TWoocommerce.SetUrl(const Value: string);
begin
      FURL := Value;
end;

end.
