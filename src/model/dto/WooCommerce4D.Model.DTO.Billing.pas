unit WooCommerce4D.Model.DTO.Billing;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelBillingDTO<T : IInterface> = class(TInterfacedObject, iModelBillingDTO<T>)
    private
      [weak]
      FParent : T;
      FJson : TJSONObject;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iModelBillingDTO<T>;
      function FirstName(Value: String): iModelBillingDTO<T>;
      function LastName(Value: String): iModelBillingDTO<T>;
      function company(Value: String): iModelBillingDTO<T>;
      function Address1(Value: String): iModelBillingDTO<T>;
      function Address2(Value: String): iModelBillingDTO<T>;
      function City(Value: String): iModelBillingDTO<T>;
      function State(Value: String): iModelBillingDTO<T>;
      function PostCode(Value: String): iModelBillingDTO<T>;
      function Country(Value: String): iModelBillingDTO<T>;
      function Email(Value: String): iModelBillingDTO<T>;
      function Phone(Value: String): iModelBillingDTO<T>;
      function &End: T;
  end;

implementation

function TModelBillingDTO<T>.Address1(Value: String): iModelBillingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('address1',value);
end;

function TModelBillingDTO<T>.Address2(Value: String): iModelBillingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('address2',value);
end;

function TModelBillingDTO<T>.City(Value: String): iModelBillingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('city',value);
end;

function TModelBillingDTO<T>.company(Value: String): iModelBillingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('company',value);
end;

function TModelBillingDTO<T>.Country(Value: String): iModelBillingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('country',value);
end;

function TModelBillingDTO<T>.&End: T;
begin
  Result := FParent;
end;

constructor TModelBillingDTO<T>.Create(Parent : T);
begin
  FParent := Parent;
  FJson := TJsonObject.Create;
end;

destructor TModelBillingDTO<T>.Destroy;
begin
  FJson.Free;
  inherited;
end;

function TModelBillingDTO<T>.Email(Value: String): iModelBillingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('email',value);
end;

function TModelBillingDTO<T>.FirstName(Value: String): iModelBillingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('first_name',value);
end;

function TModelBillingDTO<T>.LastName(Value: String): iModelBillingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('last_name',value);
end;

class function TModelBillingDTO<T>.New(Parent : T) : iModelBillingDTO<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelBillingDTO<T>.Phone(Value: String): iModelBillingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('phone',value);
end;

function TModelBillingDTO<T>.PostCode(Value: String): iModelBillingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('postcode',value);
end;

function TModelBillingDTO<T>.State(Value: String): iModelBillingDTO<T>;
begin
  Result := Self;
  FJson.AddPair('state',value);
end;

end.
