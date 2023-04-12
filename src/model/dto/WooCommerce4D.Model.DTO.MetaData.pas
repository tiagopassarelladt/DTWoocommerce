unit WooCommerce4D.Model.DTO.MetaData;

interface

uses
  JSON,
  REST.Json,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelMetaDataDTO<T : IInterface> = class(TInterfacedObject, iModelMetaDataDTO<T>)
    private
      [weak]
      FParent : T;
      FJson : TJsonObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelMetaDataDTO<T>;
      function Id(Value: Integer): iModelMetaDataDTO<T>;
      function Key(Value: String): iModelMetaDataDTO<T>;
      function _Value(Value: String): iModelMetaDataDTO<T>;
      function &End: T;
  end;

implementation

function TModelMetaDataDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelMetaDataDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJson := TJsonObject.Create;
end;

destructor TModelMetaDataDTO<T>.Destroy;
begin
  FJson.Free;
  inherited;
end;

function TModelMetaDataDTO<T>.Id(Value: Integer): iModelMetaDataDTO<T>;
begin
  Result := Self;
  FJson.AddPair('id', TJSONNumber.Create(Value));
end;

function TModelMetaDataDTO<T>.Key(Value: String): iModelMetaDataDTO<T>;
begin
  Result := Self;
  FJson.AddPair('key', Value);
end;

class function TModelMetaDataDTO<T>.New(Parent : T) : iModelMetaDataDTO<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelMetaDataDTO<T>._Value(Value: String): iModelMetaDataDTO<T>;
begin
  Result := Self;
  FJson.AddPair('value', Value);
end;

end.
