unit WooCommerce4D.Model.DTO.Customer;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Model.DTO.MetaData,
  WooCommerce4D.Model.DTO.Billing,
  WooCommerce4D.Model.DTO.Shipping;

type
  TModelCustomerDTO = class(TInterfacedObject, iModelCustomerDTO)
    private
      [weak]
      FParent : iEntity;
      FJson : TJsonObject;
    public
      constructor Create(Parent : iEntity);
      destructor Destroy; override;
      class function New(Parent : iEntity) : iModelCustomerDTO;
      function Email(Value: String): iModelCustomerDTO; // mandatory
      function FirstName(Value: String): iModelCustomerDTO;
      function LastName(Value: String): iModelCustomerDTO;
      function UserName(Value: String): iModelCustomerDTO;
      function Billing: iModelBillingDTO<iModelCustomerDTO>;
      function Shipping: iModelShippingDTO<iModelCustomerDTO>;
      function MetaData: iModelMetaDataDTO<iModelCustomerDTO>;
      function &End: iEntity;
  end;

implementation

function TModelCustomerDTO.Billing: iModelBillingDTO<iModelCustomerDTO>;
begin
  Result := TModelBillingDTO<iModelCustomerDTO>.New(Self);
end;

function TModelCustomerDTO.&End: iEntity;
begin
  Result := FParent;
end;

constructor TModelCustomerDTO.Create(Parent : iEntity);
begin
  FParent := Parent;
  FJson := TJsonObject.Create;
end;

destructor TModelCustomerDTO.Destroy;
begin
   FJson.Free;
  inherited;
end;

function TModelCustomerDTO.Email(Value: String): iModelCustomerDTO;
begin
  Result := Self;
  FJson.AddPair('email', value);
end;

function TModelCustomerDTO.FirstName(Value: String): iModelCustomerDTO;
begin
  Result := Self;
  FJson.AddPair('first_name', value);
end;

function TModelCustomerDTO.LastName(Value: String): iModelCustomerDTO;
begin
  Result := Self;
  FJson.AddPair('last_name', value);
end;

function TModelCustomerDTO.MetaData: iModelMetaDataDTO<iModelCustomerDTO>;
begin
  Result := TModelMetaDataDTO<iModelCustomerDTO>.New(Self);
end;

class function TModelCustomerDTO.New (Parent : iEntity) : iModelCustomerDTO;
begin
  Result := Self.Create(Parent);
end;

function TModelCustomerDTO.Shipping: iModelShippingDTO<iModelCustomerDTO>;
begin
  Result := TModelShippingDTO<iModelCustomerDTO>.New(self);
end;

function TModelCustomerDTO.UserName(Value: String): iModelCustomerDTO;
begin
  Result := Self;
  FJson.AddPair('user_name', value);
end;

end.
