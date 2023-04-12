unit WooCommerce4D.Interfaces;

interface

uses
  WooCommerce4D.OAuth.Interfaces,
  WooCommerce4D.HttpClient.Interfaces,
  WooCommerce4D.Model.DTO.Interfaces;

type
  iWooCommerce4D = interface
    function Config : iOAuthConfig;
    function Resources : iWooCommerce;
    function Entity : iEntity;
  end;

implementation

end.
