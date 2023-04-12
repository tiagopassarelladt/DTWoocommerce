unit WooCommerce4D.Model.DTO.Images;

interface

uses
  Json,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelImagesDTO<T: IInterface> = class(TInterfacedObject, iModelImagesDTO<T>)
  private
    [weak]
    FParent: T;
    FJSON: TJSONObject;
    FJSONArray: TJSONArray;
    FJSONPair: TJSONObject;
  public
    constructor Create(Parent: T; Json: TJSONObject);
    destructor Destroy; override;
    class function New(Parent: T; Json: TJSONObject): iModelImagesDTO<T>;
    function Id(Value: Integer): iModelImagesDTO<T>;
    function Src(Value: String): iModelImagesDTO<T>;
    function Name(Value: String): iModelImagesDTO<T>;
    function Alt(Value: string): iModelImagesDTO<T>;
    function Next: iModelImagesDTO<T>;
    function &End: T;
  end;

implementation

function TModelImagesDTO<T>.Alt(Value: string): iModelImagesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('alt', Value);
end;

function TModelImagesDTO<T>.&End: T;
begin
  Result := FParent;
  FJSONArray.AddElement(FJSON);
  FJSONPair.AddPair('images', FJSONArray);
end;

constructor TModelImagesDTO<T>.Create(Parent: T; Json: TJSONObject);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
  FJSONArray := TJSONArray.Create;
  FJSONPair := Json;
end;

destructor TModelImagesDTO<T>.Destroy;
begin
  inherited;
end;

function TModelImagesDTO<T>.Id(Value: Integer): iModelImagesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('id', TJSONNumber.Create(Value));
end;

function TModelImagesDTO<T>.Name(Value: String): iModelImagesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('name', Value);
end;

class function TModelImagesDTO<T>.New(Parent: T; Json: TJSONObject)
  : iModelImagesDTO<T>;
begin
  Result := Self.Create(Parent, Json);
end;

function TModelImagesDTO<T>.Next: iModelImagesDTO<T>;
begin
  Result := Self;
  FJSONArray.AddElement(FJSON);
  FJSON := TJSONObject.Create;
end;

function TModelImagesDTO<T>.Src(Value: String): iModelImagesDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('src', Value);
end;

end.
