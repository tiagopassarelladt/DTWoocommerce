unit WooCommerce4D.Model.DTO.Attributes;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelAttributesDTO<T : IInterface> = class(TInterfacedObject, iModelAttributesDTO<T>)
    private
      [weak]
      FParent : T;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelAttributesDTO<T>;
      function id(Value : Integer) : iModelAttributesDTO<T>;
      function Name(Value : String) : iModelAttributesDTO<T>;
      function Position(Value : integer) : iModelAttributesDTO<T>;
      function Visible(Value : Boolean = false) : iModelAttributesDTO<T>;
      function Variation(Value : Boolean = false) : iModelAttributesDTO<T>;
      function Options(Value : String) : iModelAttributesDTO<T>;
      function &End : T;
  end;

implementation

function TModelAttributesDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelAttributesDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

destructor TModelAttributesDTO<T>.Destroy;
begin
  FJson.Free;
  inherited;
end;

function TModelAttributesDTO<T>.id(Value: Integer): iModelAttributesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('id',TJSONNumber.Create(value));
end;

function TModelAttributesDTO<T>.Name(Value: String): iModelAttributesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('name',value);
end;

class function TModelAttributesDTO<T>.New(Parent : T) : iModelAttributesDTO<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelAttributesDTO<T>.Options(Value: String): iModelAttributesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('options',value);
end;

function TModelAttributesDTO<T>.Position(
  Value: integer): iModelAttributesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('position',TJSONNumber.Create(value));
end;

function TModelAttributesDTO<T>.Variation(
  Value: Boolean): iModelAttributesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('variation',TJSONBool.Create(value));
end;

function TModelAttributesDTO<T>.Visible(Value: Boolean): iModelAttributesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('visible',TJSONBool.Create(value));
end;

end.
