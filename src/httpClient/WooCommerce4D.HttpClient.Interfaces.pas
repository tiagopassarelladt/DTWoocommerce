unit WooCommerce4D.HttpClient.Interfaces;

interface

uses
  System.Generics.Collections,
  Data.DB,
  WooCommerce4D.Types, WooCommerce4D.Model.DTO.Interfaces;

type
  iHttpClient = interface
    function Authentication(aUserName, aPassword : String) : ihttpClient;
    function Get(Url : String) : ihttpClient;
    function GetAll(Url : String) : ihttpClient;
    function Post(Url : String) : ihttpClient;
    function Put(Url : String) : ihttpClient;
    function Delete(Url : String)  : ihttpClient;
    function Params(aKey: String; aValue : String) : ihttpClient;
    function Body(Value : iEntity) : ihttpClient;
    function DataSet(Value : TDataSet) : ihttpClient;
    function Content : String;
  end;

  iWooCommerce = interface
    function _Create(endpointBase : TEndpointBaseType) : iWooCommerce; overload;
    function _Create(endpointBase : String) : iWooCommerce; overload;
    function Get(endpointBase : TEndpointBaseType; Id : Integer) : iWooCommerce;
    function GetAll(endpointBase : TEndpointBaseType) : iWooCommerce;
    function Update(endpointBase : TEndpointBaseType; Id : Integer) : iWooCommerce;
    function Delete(endpointBase : TEndpointBaseType; Id : Integer) : iWooCommerce;
    function Batch(endpointBase : TEndpointBaseType) : iWooCommerce;
    function Params(aKey: String; aValue : String) : iWooCommerce;
    function Body(Value : iEntity) : iWooCommerce;
    function DataSet(Value : TDataSet) : iWooCommerce;
    function Content : String;
  end;

implementation

end.
