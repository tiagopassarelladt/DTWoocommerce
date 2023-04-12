unit WooCommerce4D.Model.DTO.ProductAttributesTerms;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelProductAttributeTermsDTO = class(TInterfacedObject, iModelProductAttributeTermsDTO)
    private
      [weak]
      FParent : iEntity;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : iEntity);
      destructor Destroy; override;
      class function New(Parent : iEntity) : iModelProductAttributeTermsDTO;
      function Name(Value : String) : iModelProductAttributeTermsDTO;//mandatory
      function Slug(Value : String) : iModelProductAttributeTermsDTO;
      function Description(Value : String) : iModelProductAttributeTermsDTO;
      function MenuOrder(Value : Integer) : iModelProductAttributeTermsDTO;
      function &End : iEntity;
  end;

implementation

function TModelProductAttributeTermsDTO.&End: iEntity;
begin
  Result := FParent.Content(FJSON.ToJSON);
end;

constructor TModelProductAttributeTermsDTO.Create(Parent : iEntity);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

function TModelProductAttributeTermsDTO.Description(
  Value: String): iModelProductAttributeTermsDTO;
begin
  Result := Self;
  FJSON.AddPair('description', value);
end;

destructor TModelProductAttributeTermsDTO.Destroy;
begin
  FJson.free;
  inherited;
end;

function TModelProductAttributeTermsDTO.MenuOrder(
  Value: Integer): iModelProductAttributeTermsDTO;
begin
  Result := Self;
  FJSON.AddPair('menu_order', TJSONNumber.Create(value));
end;

function TModelProductAttributeTermsDTO.Name(
  Value: String): iModelProductAttributeTermsDTO;
begin
  Result := Self;
  FJSON.AddPair('name', value);
end;

class function TModelProductAttributeTermsDTO.New (Parent : iEntity) : iModelProductAttributeTermsDTO;
begin
  Result := Self.Create(Parent);
end;

function TModelProductAttributeTermsDTO.Slug(
  Value: String): iModelProductAttributeTermsDTO;
begin
  Result := Self;
  FJSON.AddPair('slug', value);
end;

end.
