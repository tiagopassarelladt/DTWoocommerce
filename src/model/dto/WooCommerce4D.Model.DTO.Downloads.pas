unit WooCommerce4D.Model.DTO.Downloads;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelDownloasDTO<T : IInterface> = class(TInterfacedObject, iModelDownloasDTO<T>)
    private
      [weak]
      FParent : T;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelDownloasDTO<T>;
      function Id(Value : String) : iModelDownloasDTO<T>;
      function Name(Value : String) : iModelDownloasDTO<T>;
      function _File(Value : String) : iModelDownloasDTO<T>;
      function &End: T;
  end;

implementation

function TModelDownloasDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelDownloasDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

destructor TModelDownloasDTO<T>.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TModelDownloasDTO<T>.Id(Value: String): iModelDownloasDTO<T>;
begin
  result := self;
  FJson.AddPair('id',value);
end;

function TModelDownloasDTO<T>.Name(Value: String): iModelDownloasDTO<T>;
begin
  result := self;
  FJson.AddPair('name',value);
end;

class function TModelDownloasDTO<T>.New(Parent : T) : iModelDownloasDTO<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelDownloasDTO<T>._File(Value: String): iModelDownloasDTO<T>;
begin
  result := self;
  FJson.AddPair('file',value);
end;

end.
