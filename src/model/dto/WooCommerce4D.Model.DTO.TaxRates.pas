unit WooCommerce4D.Model.DTO.TaxRates;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Types;

type
  TModelTaxRatesDTO = class(TInterfacedObject, iModelTaxRatesDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelTaxRatesDTO;
      function Country(Value : String) : iModelTaxRatesDTO;
      function State(Value : String) : iModelTaxRatesDTO;
      function PostCode(Value : String) : iModelTaxRatesDTO;
      function City(Value : String) : iModelTaxRatesDTO;
      function PostCodes(Value : String) : iModelTaxRatesDTO;
      function Cities(Value : String) : iModelTaxRatesDTO;
      function Rate(Value : String) : iModelTaxRatesDTO;
      function Name(Value : String) : iModelTaxRatesDTO;
      function Priority(Value : integer = 1) : iModelTaxRatesDTO;
      function Compound(Value : Boolean = false) : iModelTaxRatesDTO;
      function Shipping(Value : Boolean = true) : iModelTaxRatesDTO;
      function Order(Value : Integer) : iModelTaxRatesDTO;
      function _Class(Value : TStatusType = STANDARD) : iModelTaxRatesDTO;
      function &End : iModelTaxRatesDTO;
  end;

implementation

function TModelTaxRatesDTO.Cities(Value: String): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('cities', value);
end;

function TModelTaxRatesDTO.City(Value: String): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('city', value);
end;

function TModelTaxRatesDTO.Compound(Value: Boolean): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('compound', TJSONBool.Create(value));
end;

function TModelTaxRatesDTO.Country(Value: String): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('country', value);
end;

function TModelTaxRatesDTO.&End: iModelTaxRatesDTO;
begin
  Result := Self;
end;

constructor TModelTaxRatesDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

destructor TModelTaxRatesDTO.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TModelTaxRatesDTO.Name(Value: String): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('name', value);
end;

class function TModelTaxRatesDTO.New : iModelTaxRatesDTO;
begin
  Result := Self.Create;
end;

function TModelTaxRatesDTO.Order(Value: Integer): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('order', TJSONNumber.Create(value));
end;

function TModelTaxRatesDTO.PostCode(Value: String): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('postcode', value);
end;

function TModelTaxRatesDTO.PostCodes(Value: String): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('postcodes', value);
end;

function TModelTaxRatesDTO.Priority(Value: integer): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('priority', TJSONNumber.Create(value));
end;

function TModelTaxRatesDTO.Rate(Value: String): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('rate', value);
end;

function TModelTaxRatesDTO.Shipping(Value: Boolean): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('shipping', TJSONBool.Create(value));
end;

function TModelTaxRatesDTO.State(Value: String): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('state', value);
end;

function TModelTaxRatesDTO._Class(Value: TStatusType): iModelTaxRatesDTO;
begin
  Result := Self;
  FJSON.Addpair('class', value.getvalue);
end;

end.
