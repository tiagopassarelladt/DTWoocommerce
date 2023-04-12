unit WooCommerce4D.Model.DTO.DefaultAttributes;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelDefaultAttributesDTO<T : IInterface> = class(TInterfacedObject, iModelDefaultAttributesDTO<T>)
    private
      [weak]
      FParent : T;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelDefaultAttributesDTO<T>;
      function Id(Value : Integer) : iModelDefaultAttributesDTO<T>;
      function Name(Value : String) : iModelDefaultAttributesDTO<T>;
      function Option(Value : String) : iModelDefaultAttributesDTO<T>;
      function &End : T;
  end;

implementation

function TModelDefaultAttributesDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelDefaultAttributesDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

destructor TModelDefaultAttributesDTO<T>.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TModelDefaultAttributesDTO<T>.Id(
  Value: Integer): iModelDefaultAttributesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('id',TJSONNumber.Create(value));
end;

function TModelDefaultAttributesDTO<T>.Name(
  Value: String): iModelDefaultAttributesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('name',value);
end;

class function TModelDefaultAttributesDTO<T>.New(Parent : T) : iModelDefaultAttributesDTO<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelDefaultAttributesDTO<T>.Option(
  Value: String): iModelDefaultAttributesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('option',value);
end;

end.
