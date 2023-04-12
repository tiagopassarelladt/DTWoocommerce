unit WooCommerce4D.Model.DTO.Tags;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelTagsDTO<T : IInterface> = class(TInterfacedObject, iModelTagsDTO<T>)
    private
      [weak]
      FParent : T;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelTagsDTO<T>;
      function Id(Value : Integer) : iModelTagsDTO<T>;
      function &End : T;
  end;

implementation

function TModelTagsDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelTagsDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

destructor TModelTagsDTO<T>.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TModelTagsDTO<T>.Id(Value: Integer): iModelTagsDTO<T>;
begin
  Result := Self;
  FJSON.AddPair('id', TJSONNumber(value));
end;

class function TModelTagsDTO<T>.New(Parent : T) : iModelTagsDTO<T>;
begin
  Result := Self.Create(Parent);
end;

end.
