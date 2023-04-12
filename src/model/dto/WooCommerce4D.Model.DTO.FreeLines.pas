unit WooCommerce4D.Model.DTO.FreeLines;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Types, WooCommerce4D.Model.DTO.MetaData;

type
  TModelFreeLinesDTO<T : IInterface> = class(TInterfacedObject, iModelFreeLinesDTO<T>)
    private
      [weak]
      FParent : T;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelFreeLinesDTO<T>;
      function Name(Value: String): iModelFreeLinesDTO<T>;
      function TaxClass(Value: String): iModelFreeLinesDTO<T>;
      function taxStatus(Value: TStatusType): iModelFreeLinesDTO<T>;// taxable and none
      function Total(Value: String): iModelFreeLinesDTO<T>;
      function MetaData: iModelMetaDataDTO<iModelFreeLinesDTO<T>>;
      function &End: T;
  end;

implementation

function TModelFreeLinesDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelFreeLinesDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

destructor TModelFreeLinesDTO<T>.Destroy;
begin
  FJson.Free;
  inherited;
end;

function TModelFreeLinesDTO<T>.MetaData: iModelMetaDataDTO<iModelFreeLinesDTO<T>>;
begin
  Result := TModelMetaDataDTO<iModelFreeLinesDTO<T>>.New(Self);
end;

function TModelFreeLinesDTO<T>.Name(Value: String): iModelFreeLinesDTO<T>;
begin
  Result := Self;
  FJson.AddPair('name',value);
end;

class function TModelFreeLinesDTO<T>.New(Parent : T) : iModelFreeLinesDTO<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelFreeLinesDTO<T>.TaxClass(Value: String): iModelFreeLinesDTO<T>;
begin
  Result := Self;
  FJson.AddPair('tax_class',value);
end;

function TModelFreeLinesDTO<T>.taxStatus(Value: TStatusType): iModelFreeLinesDTO<T>;
begin
  Result := Self;
  FJson.AddPair('tax_status',value.GetValue);
end;

function TModelFreeLinesDTO<T>.Total(Value: String): iModelFreeLinesDTO<T>;
begin
  Result := Self;
  FJson.AddPair('total', value);
end;

end.
