unit WooCommerce4D.Model.DTO.Categories;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelCategoriesDTO<T: IInterface> = class(TInterfacedObject,
    iModelCategoriesDTO<T>)
  private
    [weak]
    FParent: T;
    FJSON: TJSONObject;
    FJSONArray : TJSONArray;
    FJSONPair : TJSONObject;
  public
    constructor Create(Parent: T; JSON : TJSONObject);
    destructor Destroy; override;
    class function New(Parent: T; JSON : TJSONObject): iModelCategoriesDTO<T>;
    function Id(Value: Integer): iModelCategoriesDTO<T>;
    function Next: iModelCategoriesDTO<T>;
    function &End: T;
  end;

implementation

function TModelCategoriesDTO<T>.&End: T;
begin
  Result := FParent;
  FJSONArray.AddElement(FJSON);
  FJSONPair.AddPair('categories',FJSONArray);
end;

constructor TModelCategoriesDTO<T>.Create(Parent: T; JSON : TJSONObject);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
  FJSONArray := TJSONArray.Create;
  FJSONPair := JSON;
end;

destructor TModelCategoriesDTO<T>.Destroy;
begin
  inherited;
end;

function TModelCategoriesDTO<T>.Id(Value: Integer): iModelCategoriesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('id', TJSONNumber.Create(Value));
end;

class function TModelCategoriesDTO<T>.New(Parent: T; JSON : TJSONObject): iModelCategoriesDTO<T>;
begin
  Result := Self.Create(Parent, JSON);
end;

function TModelCategoriesDTO<T>.Next: iModelCategoriesDTO<T>;
begin
  Result := Self;
  FJSONArray.AddElement(FJSON);
  FJSON := TJSONObject.Create;
end;

end.
