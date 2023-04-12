unit WooCommerce4D.Model.DTO.TaxClasses;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelTaxClassesDTO = class(TInterfacedObject, iModelTaxClassesDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelTaxClassesDTO;
      function Name(value : String) : iModelTaxClassesDTO;//required
      function &End : iModelTaxClassesDTO;
  end;

implementation

function TModelTaxClassesDTO.&End: iModelTaxClassesDTO;
begin
  Result := Self;
end;

constructor TModelTaxClassesDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

destructor TModelTaxClassesDTO.Destroy;
begin
  FJSON.free;
  inherited;
end;

function TModelTaxClassesDTO.Name(value: String): iModelTaxClassesDTO;
begin
  Result := Self;
  FJSON.AddPair('name',value);
end;

class function TModelTaxClassesDTO.New : iModelTaxClassesDTO;
begin
  Result := Self.Create;
end;

end.
