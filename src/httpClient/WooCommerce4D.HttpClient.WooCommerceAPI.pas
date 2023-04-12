unit WooCommerce4D.HttpClient.WooCommerceAPI;

interface

uses
  WooCommerce4D.HttpClient.Interfaces,
  WooCommerce4D.OAuth.Interfaces,
  System.Generics.Collections,
  // WooCommerce4D.HttpClient.DefaultHttpClient,
  System.SysUtils,
  WooCommerce4D.Types,
  Data.DB,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.HttpClient.RestHttpClient;

type
  TWooCommerceAPI = class(TInterfacedObject, iWooCommerce)
  private
    [weak]
    FParent: iOAuthConfig;
    FHttpClient: iHttpClient;
    FUrl: String;

  const
    API_URL_FORMAT = '%s/wp-json/wc/%s/%s';
    API_URL_BATCH_FORMAT = '%s/wp-json/wc/%s/%s/batch';
    API_URL_ONE_ENTITY_FORMAT = '%s/wp-json/wc/%s/%s/%d';
    URL_SECURED_FORMAT = '%s?%s';
  public
    constructor Create(Parent: iOAuthConfig);
    destructor Destroy; override;
    class function New(Parent: iOAuthConfig): iWooCommerce;
    function _Create(endpointBase: TEndpointBaseType): iWooCommerce; overload;
    function _Create(endpointBase: String): iWooCommerce; overload;
    function Get(endpointBase: TEndpointBaseType; Id: Integer): iWooCommerce;
    function GetAll(endpointBase: TEndpointBaseType): iWooCommerce;
    function Update(endpointBase: TEndpointBaseType; Id: Integer): iWooCommerce;
    function Delete(endpointBase: TEndpointBaseType; Id: Integer): iWooCommerce;
    function Batch(endpointBase: TEndpointBaseType): iWooCommerce;
    function Params(aKey: String; aValue: String): iWooCommerce;
    function Body(Value: iEntity): iWooCommerce;
    function DataSet(Value: TDataSet): iWooCommerce;
    function Content: String;
  end;

implementation

constructor TWooCommerceAPI.Create(Parent: iOAuthConfig);
begin
  FParent := Parent;
  FHttpClient := TRestHttpClient.New;
  FHttpClient.Authentication(FParent.ConsumerKey, FParent.ConsumerSecret);
end;

function TWooCommerceAPI.Body(Value: iEntity): iWooCommerce;
begin
  Result := Self;
  FHttpClient.Body(Value);
end;

function TWooCommerceAPI.Content: String;
begin
  Result := FHttpClient.Content;
end;

function TWooCommerceAPI._Create(endpointBase: TEndpointBaseType): iWooCommerce;
begin
  Result := Self;
  FHttpClient.Post(Format(API_URL_FORMAT, [FParent.Url, FParent.Version,
    endpointBase.GetValue]));
end;

function TWooCommerceAPI.DataSet(Value: TDataSet): iWooCommerce;
begin
  Result := Self;
  FHttpClient.DataSet(Value);
end;

function TWooCommerceAPI.Delete(endpointBase: TEndpointBaseType; Id: Integer)
  : iWooCommerce;
begin
  Result := Self;
  FHttpClient.Delete(Format(API_URL_ONE_ENTITY_FORMAT,
    [FParent.Url, FParent.Version, endpointBase.GetValue, Id]));
end;

destructor TWooCommerceAPI.Destroy;
begin
  inherited;
end;

function TWooCommerceAPI.Get(endpointBase: TEndpointBaseType; Id: Integer)
  : iWooCommerce;
begin
  Result := Self;
  FHttpClient.Get(Format(API_URL_ONE_ENTITY_FORMAT,
    [FParent.Url, FParent.Version, endpointBase.GetValue, Id]));
end;

function TWooCommerceAPI.GetAll(endpointBase: TEndpointBaseType): iWooCommerce;
begin
  Result := Self;
  FHttpClient.GetAll(Format(API_URL_FORMAT, [FParent.Url, FParent.Version,
    endpointBase.GetValue]));
end;

class function TWooCommerceAPI.New(Parent: iOAuthConfig): iWooCommerce;
begin
  Result := Self.Create(Parent);
end;

function TWooCommerceAPI.Params(aKey: String; aValue: String): iWooCommerce;
begin
  Result := Self;
  FHttpClient.Params(aKey, aValue);
end;

function TWooCommerceAPI.Batch(endpointBase: TEndpointBaseType): iWooCommerce;
begin
  Result := Self;
end;

function TWooCommerceAPI.Update(endpointBase: TEndpointBaseType; Id: Integer)
  : iWooCommerce;
begin
  Result := Self;
  FHttpClient.Put(Format(API_URL_ONE_ENTITY_FORMAT,
    [FParent.Url, FParent.Version, endpointBase.GetValue, Id]));
end;

function TWooCommerceAPI._Create(endpointBase: String): iWooCommerce;
begin
  Result := Self;

  FHttpClient.Post(Format(API_URL_FORMAT, [FParent.Url, FParent.Version,
    endpointBase]));
end;

end.
