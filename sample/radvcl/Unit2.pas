unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RestRequest4D;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  json:string;
begin
json:=
'{'+
'"name":"Teste Delphi RAD",'+
'"regular_price":"45.00",'+
'"description":"Teste de envio de produto",'+
'"short_description":"Apenas um produto",'+
'"categories":['+
'{"id":19},'+
'{"id":14}],'+
'"images":['+
'{""src": "http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg"},'+
'{"src": "http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_back.jpg"}'+
']'+
'}';

  memo1.lines.add(
  TRequest.New
    .BaseURL('https://loja.sylasfilho.com.br/wp-json/wc/v3/products')
    .BasicAuthentication('ck_a8839cc4d4482e79be334088c84706a380ee20b7',
    'cs_9a31395976b6b9d41aac177ef48b5f7be00f73e6')
    .AddHeader('Content-Type','application/json')
    .AddBody(json)
    .Post.Content);
end;

end.
