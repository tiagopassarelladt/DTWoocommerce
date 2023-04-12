unit WooCommerce4D.Model.DTO.ShippingLines;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Model.DTO.MetaData;

type
  TModelShippingLinesDTO<T : IInterface> = class(TInterfacedObject, iModelShippingLinesDTO<T>)
    private
      [weak]
      FParent : T;
      FJson : TJSONObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelShippingLinesDTO<T>;
      function MethodTitle(Value: String): iModelShippingLinesDTO<T>;
      function MethodId(Value: String): iModelShippingLinesDTO<T>;
      function Total(Value: String): iModelShippingLinesDTO<T>;
      function MetaData: iModelMetaDataDTO<iModelShippingLinesDTO<T>>;
      function &End: T;
  end;

implementation

function TModelShippingLinesDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelShippingLinesDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJson := TJSONObject.Create;
end;

destructor TModelShippingLinesDTO<T>.Destroy;
begin
  FJson.free;
  inherited;
end;

function TModelShippingLinesDTO<T>.MetaData: iModelMetaDataDTO<iModelShippingLinesDTO<T>>;
begin
  Result := TModelMetaDataDTO<iModelShippingLinesDTO<T>>.New(Self);
end;

function TModelShippingLinesDTO<T>.MethodId(
  Value: String): iModelShippingLinesDTO<T>;
begin
  Result := Self;
  FJson.AddPair('method_id', value);
end;

function TModelShippingLinesDTO<T>.MethodTitle(
  Value: String): iModelShippingLinesDTO<T>;
begin
  Result := Self;
  FJson.AddPair('method_title', value);
end;

class function TModelShippingLinesDTO<T>.New(Parent : T) : iModelShippingLinesDTO<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelShippingLinesDTO<T>.Total(
  Value: String): iModelShippingLinesDTO<T>;
begin
  Result := Self;
  FJson.AddPair('total', value);
end;

end.
