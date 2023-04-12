unit WooCommerce4D.Model.DTO.ProductShippingClasses;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelProductShippingClassesDTO = class(TInterfacedObject, iModelProductShippingClassesDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelProductShippingClassesDTO;
      function Name(Value : String) : iModelProductShippingClassesDTO;//mandatory
      function Slug(Value : String) : iModelProductShippingClassesDTO;
      function Description(Value : String) : iModelProductShippingClassesDTO;
      function &End : iModelProductShippingClassesDTO;
  end;

implementation

function TModelProductShippingClassesDTO.&End: iModelProductShippingClassesDTO;
begin
  Result := Self;
end;

constructor TModelProductShippingClassesDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

function TModelProductShippingClassesDTO.Description(
  Value: String): iModelProductShippingClassesDTO;
begin
  Result := Self;
  FJSON.AddPair('description', value);
end;

destructor TModelProductShippingClassesDTO.Destroy;
begin
  FJSON.free;
  inherited;
end;

function TModelProductShippingClassesDTO.Name(Value: String): iModelProductShippingClassesDTO;
begin
  Result := Self;
  FJSON.AddPair('name', value);
end;

class function TModelProductShippingClassesDTO.New : iModelProductShippingClassesDTO;
begin
  Result := Self.Create;
end;

function TModelProductShippingClassesDTO.Slug(Value: String): iModelProductShippingClassesDTO;
begin
  Result := Self;
  FJSON.AddPair('slug', value);
end;

end.
