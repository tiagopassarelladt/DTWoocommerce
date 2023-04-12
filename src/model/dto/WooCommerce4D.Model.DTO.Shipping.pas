unit WooCommerce4D.Model.DTO.Shipping;

interface

uses
  Json,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelShippingDTO<T : IInterface> = class(TInterfacedObject, iModelShippingDTO<T>)
    private
      [weak]
      FParent : T;
      FJson : TJsonObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelShippingDTO<T>;
      function FirstName(Value: String): iModelShippingDTO<T>;
      function LastName(Value: String): iModelShippingDTO<T>;
      function company(Value: String): iModelShippingDTO<T>;
      function Address1(Value: String): iModelShippingDTO<T>;
      function Address2(Value: String): iModelShippingDTO<T>;
      function City(Value: String): iModelShippingDTO<T>;
      function State(Value: String): iModelShippingDTO<T>;
      function PostCode(Value: String): iModelShippingDTO<T>;
      function Country(Value: String): iModelShippingDTO<T>;
      function &End: T;
  end;

implementation

function TModelShippingDTO<T>.Address1(Value: String): iModelShippingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('address1',value);
end;

function TModelShippingDTO<T>.Address2(Value: String): iModelShippingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('address2',value);
end;

function TModelShippingDTO<T>.City(Value: String): iModelShippingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('city',value);
end;

function TModelShippingDTO<T>.company(Value: String): iModelShippingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('company',value);
end;

function TModelShippingDTO<T>.Country(Value: String): iModelShippingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('country',value);
end;

function TModelShippingDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelShippingDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJson := TJsonObject.Create;
end;

destructor TModelShippingDTO<T>.Destroy;
begin
  FJson.Free;
  inherited;
end;

function TModelShippingDTO<T>.FirstName(Value: String): iModelShippingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('first_name',value);
end;

function TModelShippingDTO<T>.LastName(Value: String): iModelShippingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('last_name',value);
end;

class function TModelShippingDTO<T>.New(Parent : T) : iModelShippingDTO<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelShippingDTO<T>.PostCode(Value: String): iModelShippingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('postcode',value);
end;

function TModelShippingDTO<T>.State(Value: String): iModelShippingDTO<T>;
begin
    Result := Self;
  FJson.AddPair('state',value);
end;

end.
