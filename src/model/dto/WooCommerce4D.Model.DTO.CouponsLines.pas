unit WooCommerce4D.Model.DTO.CouponsLines;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces, WooCommerce4D.Model.DTO.MetaData;

type
  TModelCouponsLines<T : IInterface> = class(TInterfacedObject, iModelCouponsLinesDTO<T>)
    private
      [weak]
      FParent : T;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelCouponsLinesDTO<T>;
      function Code(Value: String): iModelCouponsLinesDTO<T>;
      function MetaData: iModelMetaDataDTO<iModelCouponsLinesDTO<T>>;
      function &End: T;
  end;

implementation

function TModelCouponsLines<T>.Code(Value: String): iModelCouponsLinesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('code',value);
end;

function TModelCouponsLines<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelCouponsLines<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

destructor TModelCouponsLines<T>.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TModelCouponsLines<T>.MetaData: iModelMetaDataDTO<iModelCouponsLinesDTO<T>>;
begin
  Result := TModelMetaDataDTO<iModelCouponsLinesDTO<T>>.New(Self);
end;

class function TModelCouponsLines<T>.New(Parent : T) : iModelCouponsLinesDTO<T>;
begin
  Result := Self.Create(Parent);
end;

end.
