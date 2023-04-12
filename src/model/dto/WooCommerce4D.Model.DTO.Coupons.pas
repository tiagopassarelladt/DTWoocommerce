unit WooCommerce4D.Model.DTO.Coupons;

interface

uses
  JSON,
  Rest.JSON,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Model.DTO.MetaData;

type
  TModelCouponsDTO = class(TInterfacedObject, iModelCouponsDTO)
  private
    [weak]
    FParent: iEntity;
    FJson: TJsonObject;
  public
    constructor Create(Parent: iEntity);
    destructor Destroy; override;
    class function New(Parent: iEntity): iModelCouponsDTO;
    function Code(Value: String): iModelCouponsDTO; // obrigatorio
    function Amount(Value: String): iModelCouponsDTO;
    function DiscountType(Value: String): iModelCouponsDTO;
    function Description(Value: String): iModelCouponsDTO;
    function DateExpires(Value: String): iModelCouponsDTO;
    function DateExpiresGMT(Value: String): iModelCouponsDTO;
    function IndividualUse(Value: Boolean = false): iModelCouponsDTO;
    function ProductIDs(Value: String): iModelCouponsDTO; // array de ids
    function ExcludedProductIDs(Value: String): iModelCouponsDTO;
    // array de ids
    function UsageLimit(Value: Integer): iModelCouponsDTO;
    function UsageLimitPerUser(Value: Integer): iModelCouponsDTO;
    function LimitUsageToXItems(Value: Integer): iModelCouponsDTO;
    function FreeShipping(Value: Boolean = false): iModelCouponsDTO;
    function ProductCategories(Value: String): iModelCouponsDTO; // array de ids
    function ExcludedProductCategories(Value: String): iModelCouponsDTO;
    // array de ids
    function ExcludedSaleItems(Value: Boolean): iModelCouponsDTO;
    function MinimunAmount(Value: String): iModelCouponsDTO;
    function MaximumAmount(Value: String): iModelCouponsDTO;
    function EmailRestrictions(Value: String): iModelCouponsDTO; // array de ids
    function MetaData: iModelMetaDataDTO<iModelCouponsDTO>;
    function &End: iEntity;
  end;

implementation

function TModelCouponsDTO.Amount(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('amount', Value);
end;

function TModelCouponsDTO.Code(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('code', Value);
end;

function TModelCouponsDTO.&End: iEntity;
begin
  Result := FParent.Content(FJson.ToJSON);
end;

constructor TModelCouponsDTO.Create(Parent: iEntity);
begin
  FParent := Parent;
  FJson := TJsonObject.Create;
end;

function TModelCouponsDTO.DateExpires(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('date_expires', Value);
end;

function TModelCouponsDTO.DateExpiresGMT(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('date_expires_gmt', Value);
end;

function TModelCouponsDTO.Description(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('description', Value);
end;

destructor TModelCouponsDTO.Destroy;
begin
  FJson.Free;
  inherited;
end;

function TModelCouponsDTO.DiscountType(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('discount_type', Value);
end;

function TModelCouponsDTO.EmailRestrictions(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('email_restrictions', Value);
end;

function TModelCouponsDTO.ExcludedProductCategories(Value: String)
  : iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('exclude_product_categories', Value);
end;

function TModelCouponsDTO.ExcludedProductIDs(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('excluded_product_ids', Value);
end;

function TModelCouponsDTO.ExcludedSaleItems(Value: Boolean): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('exclude_sale_items', TJSONBool.Create(Value));
end;

function TModelCouponsDTO.FreeShipping(Value: Boolean): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('free_shipping', TJSONBool.Create(Value));
end;

function TModelCouponsDTO.IndividualUse(Value: Boolean): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('individual_use', TJSONBool.Create(Value));
end;

function TModelCouponsDTO.LimitUsageToXItems(Value: Integer): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('limit_usage_to_x_items', TJSONNumber.Create(Value));
end;

function TModelCouponsDTO.MaximumAmount(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('maximum_amount', Value);
end;

function TModelCouponsDTO.MetaData: iModelMetaDataDTO<iModelCouponsDTO>;
begin
  Result := TModelMetadataDTO<iModelCouponsDTO>.New(Self);
end;

function TModelCouponsDTO.MinimunAmount(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('minimum_amount', Value);
end;

class function TModelCouponsDTO.New(Parent: iEntity): iModelCouponsDTO;
begin
  Result := Self.Create(Parent);
end;

function TModelCouponsDTO.ProductCategories(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('product_categories', Value);
end;

function TModelCouponsDTO.ProductIDs(Value: String): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('product_ids', Value);
end;

function TModelCouponsDTO.UsageLimit(Value: Integer): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('usage_limit', TJSONNumber(Value));
end;

function TModelCouponsDTO.UsageLimitPerUser(Value: Integer): iModelCouponsDTO;
begin
  Result := Self;
  FJson.AddPair('usage_limit_per_user', TJSONNumber.Create(Value));
end;

end.
