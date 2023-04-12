unit WooCommerce4D.Model.DTO.LinesItems;

interface

uses
  JSon,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Model.DTO.MetaData;

type
  TModelLinesItemsDTO<T : IInterface> = class(TInterfacedObject, iModelLinesItemsDTO<T>)
    private
      [weak]
      FParent : T;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelLinesItemsDTO<T>;
      function Name(Value: String): iModelLinesItemsDTO<T>;
      function ProductId(Value: Integer): iModelLinesItemsDTO<T>;
      function VariationId(Value: Integer): iModelLinesItemsDTO<T>;
      function Quantity(Value: Integer): iModelLinesItemsDTO<T>;
      function TaxClass(Value: String): iModelLinesItemsDTO<T>;
      function Subtotal(Value: String): iModelLinesItemsDTO<T>;
      function Total(Value: String): iModelLinesItemsDTO<T>;
      function MetaData: iModelMetaDataDTO<iModelLinesItemsDTO<T>>;
      function &End: T;
  end;

implementation

function TModelLinesItemsDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelLinesItemsDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

destructor TModelLinesItemsDTO<T>.Destroy;
begin
  FJson.Free;
  inherited;
end;

function TModelLinesItemsDTO<T>.MetaData: iModelMetaDataDTO<iModelLinesItemsDTO<T>>;
begin
  Result := TModelMetaDataDTO<iModelLinesItemsDTO<T>>.New(Self);
end;

function TModelLinesItemsDTO<T>.Name(Value: String): iModelLinesItemsDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('name',value);
end;

class function TModelLinesItemsDTO<T>.New(Parent : T) : iModelLinesItemsDTO<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelLinesItemsDTO<T>.ProductId(
  Value: Integer): iModelLinesItemsDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('product_id', TJSONNumber.Create(value));
end;

function TModelLinesItemsDTO<T>.Quantity(
  Value: Integer): iModelLinesItemsDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('quantity', TJSONNumber.Create(value));
end;

function TModelLinesItemsDTO<T>.Subtotal(Value: String): iModelLinesItemsDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('subtotal',value);
end;

function TModelLinesItemsDTO<T>.TaxClass(Value: String): iModelLinesItemsDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('tax_class',value);
end;

function TModelLinesItemsDTO<T>.Total(Value: String): iModelLinesItemsDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('total',value);
end;

function TModelLinesItemsDTO<T>.VariationId(
  Value: Integer): iModelLinesItemsDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('variation_id',TJsonNumber.Create(value));
end;

end.
