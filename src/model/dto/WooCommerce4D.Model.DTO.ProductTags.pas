unit WooCommerce4D.Model.DTO.ProductTags;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelProductTagsDTO = class(TInterfacedObject, iModelProductTagsDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelProductTagsDTO;
      function Name(Value : String) : iModelProductTagsDTO;//mandatory
      function Slug(Value : String) : iModelProductTagsDTO;
      function Description(Value : String) : iModelProductTagsDTO;
      function &End : iModelProductTagsDTO;
  end;

implementation

function TModelProductTagsDTO.&End: iModelProductTagsDTO;
begin
  Result := Self;
end;

constructor TModelProductTagsDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

function TModelProductTagsDTO.Description(Value: String): iModelProductTagsDTO;
begin
  Result := Self;
  FJSON.AddPair('description', value);
end;

destructor TModelProductTagsDTO.Destroy;
begin
  FJson.free;
  inherited;
end;

function TModelProductTagsDTO.Name(Value: String): iModelProductTagsDTO;
begin
  Result := Self;
  FJSON.AddPair('name', value);
end;

class function TModelProductTagsDTO.New : iModelProductTagsDTO;
begin
  Result := Self.Create;
end;

function TModelProductTagsDTO.Slug(Value: String): iModelProductTagsDTO;
begin
  Result := Self;
  FJSON.AddPair('slug', value);
end;

end.
