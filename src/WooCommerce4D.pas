unit WooCommerce4D;

interface

uses
  WooCommerce4D.Interfaces,
  WooCommerce4D.OAuth.Interfaces,
  WooCommerce4D.OAuth.OAuthConfig,
  WooCommerce4D.HttpClient.Interfaces,
  WooCommerce4D.HttpClient.WooCommerceAPI,
  WooCommerce4D.Model.DTO.Interfaces, WooCommerce4D.Model.Entitys;

type
  TWooCommerce4D = class(TInterfacedObject, iWooCommerce4D)
    private
      FConfig : iOAuthConfig;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iWooCommerce4D;
      function Config : iOAuthConfig;
      function Resources : iWooCommerce;
      function Entity : iEntity;
  end;

implementation

function TWooCommerce4D.Config: iOAuthConfig;
begin
  FConfig := TOAuthConfig.New;
  Result := FConfig;
end;

constructor TWooCommerce4D.Create;
begin

end;

destructor TWooCommerce4D.Destroy;
begin

  inherited;
end;

function TWooCommerce4D.Entity: iEntity;
begin
  Result := TEntity.New;
end;

class function TWooCommerce4D.New : iWooCommerce4D;
begin
  Result := Self.Create;
end;

function TWooCommerce4D.Resources: iWooCommerce;
begin
  Result := TWooCommerceAPI.New(FConfig);
end;

end.
