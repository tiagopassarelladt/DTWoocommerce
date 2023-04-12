unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, WooCommerce4D,
  WooCommerce4D.Interfaces, WooCommerce4D.Types;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Fwoocommerce : iWooCommerce4D;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Fwoocommerce := TWooCommerce4D.new;

  Fwoocommerce.Config
    .Url('https://loja.sylasfilho.com.br')
    .ConsumerKey('ck_a8839cc4d4482e79be334088c84706a380ee20b7')
    .ConsumerSecret('cs_9a31395976b6b9d41aac177ef48b5f7be00f73e6')
    .Version(TApiVersionType.V3.ToString);
end;

end.
