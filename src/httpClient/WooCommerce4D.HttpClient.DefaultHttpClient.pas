unit WooCommerce4D.HttpClient.DefaultHttpClient;

interface

uses
  WooCommerce4D.HttpClient.Interfaces,
  RestRequest4D,
  JSON,
  REST.JSON,
  System.Generics.Collections,
  Data.DB, WooCommerce4D.Model.DTO.Interfaces;

type
  TDefaultHttpClient = class(TInterfacedObject, iHttpClient)
    private
      FReq : IRequest;
      FResp : IResponse;
      FContent : String;

      const
        CONTENT_TYPE = 'Content-Type';
        APPLICATION_JSON = 'application/json';
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iHttpClient;
        function Authentication(aUserName, aPassword : String) : ihttpClient;
        function Get(Url : String) : ihttpClient;
        function GetAll(Url : String) : ihttpClient;
        function Post(Url : String) : ihttpClient;
        function Put(Url : String) : ihttpClient;
        function Delete(Url : String)  : ihttpClient;
        function Params(aKey,aValue : VAriant) : ihttpClient;
        function Body(Value : iEntity) : ihttpClient;
        function DataSet(Value : TDataSet) : ihttpClient;
        function Content : String;
  end;

implementation

function TDefaultHttpClient.Authentication(aUserName,
  aPassword: String): ihttpClient;
begin
  Result := Self;
  FReq.BasicAuthentication(aUserName,aPassword);
end;

function TDefaultHttpClient.Body(Value: iEntity): ihttpClient;
begin
  Result := Self;
  FReq.AddBody(Value.Content);
end;

function TDefaultHttpClient.Content: String;
begin
  Result := FContent;
end;

constructor TDefaultHttpClient.Create;
begin
  FReq := TRequest.New;
end;

function TDefaultHttpClient.DataSet(Value: TDataSet): ihttpClient;
begin
  Result := Self;
  FReq.DataSetAdapter(Value);
end;

function TDefaultHttpClient.Delete(Url : String)  : ihttpClient;
var
  I : String;
begin
  Result := Self;

  FContent :=
    FReq
      .BaseURL(Url)
      .Delete.Content;
end;

destructor TDefaultHttpClient.Destroy;
begin

  inherited;
end;

function TDefaultHttpClient.Get(Url : String) : ihttpClient;
begin
  Result := Self;

  FContent :=
    FReq
      .BaseURL(Url)
      .Get.Content;
end;

function TDefaultHttpClient.GetAll(Url : String) : ihttpClient;
begin
  Result := Self;

  FContent :=
    FReq
      .BaseURL(Url)
      .Get.Content;
end;

class function TDefaultHttpClient.New : iHttpClient;
begin
  Result := Self.Create;
end;

function TDefaultHttpClient.Params(aKey, aValue: VAriant): ihttpClient;
begin
  Result := Self;
  FReq.AddParam(aKey, aValue);
end;

function TDefaultHttpClient.Post(Url : String) : ihttpClient;
var
  I: String;
begin
  Result := Self;

  FContent :=
    FReq
      .BaseURL(Url)
      .AddHeader(CONTENT_TYPE,APPLICATION_JSON)
      .Post.Content;
end;

function TDefaultHttpClient.Put(Url : String) : ihttpClient;
var
  I : String;
begin
  Result := Self;

  FContent :=
    FReq
      .BaseURL(Url)
      .AddHeader(CONTENT_TYPE, APPLICATION_JSON)
      .Put.Content;
end;

end.
