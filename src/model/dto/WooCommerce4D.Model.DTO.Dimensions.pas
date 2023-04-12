unit WooCommerce4D.Model.DTO.Dimensions;
interface
uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;
type
  TModelDimensionsDTO<T : IInterface> = class(TInterfacedObject, iModelDimensionsDTO<T>)
    private
      [weak]
      FParent : T;
      FJSON : TJSONObject;
      FJSONPair : TJSONObject;
    public
      constructor Create(Parent : T; Json : TJSONObject);
      destructor Destroy; override;
      class function New(Parent : T; Json : TJsonobject) : iModelDimensionsDTO<T>;
      function _Length(Value : String) : iModelDimensionsDTO<T>;
      function Width(Value : String) : iModelDimensionsDTO<T>;
      function Height(Value : String) : iModelDimensionsDTO<T>;
      function &End : T;
  end;
implementation
function TModelDimensionsDTO<T>.&End: T;
begin
  Result := FParent;
  FJSONPair.AddPair('dimensions',FJSON);
end;
constructor TModelDimensionsDTO<T>.Create(Parent : T; Json : TJsonobject);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
  FJSONPair := JSON;
end;
destructor TModelDimensionsDTO<T>.Destroy;
begin
  inherited;
end;
function TModelDimensionsDTO<T>.Height(Value: String): iModelDimensionsDTO<T>;
begin
  Result := Self;
  FJson.AddPair('height', value);
end;
class function TModelDimensionsDTO<T>.New(Parent : T; Json : TJsonobject) : iModelDimensionsDTO<T>;
begin
  Result := Self.Create(Parent,Json);
end;

function TModelDimensionsDTO<T>.Width(Value: String): iModelDimensionsDTO<T>;
begin
  Result := Self;
  FJson.AddPair('width', value);
end;
function TModelDimensionsDTO<T>._Length(Value: String): iModelDimensionsDTO<T>;
begin
  Result := Self;
  FJson.AddPair('length', value);
end;
end.
