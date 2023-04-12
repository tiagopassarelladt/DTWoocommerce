unit WooCommerce4D.Model.Entitys;

interface

uses
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Model.DTO.Coupons,
  WooCommerce4D.Model.DTO.Customer,
  WooCommerce4D.Model.DTO.Orders,
  WooCommerce4D.Model.DTO.OrdersNotes,
  WooCommerce4D.Model.DTO.ProductsAttributes,
  WooCommerce4D.Model.DTO.ProductAttributesTerms,
  WooCommerce4D.Model.DTO.ProductCategories,
  WooCommerce4D.Model.DTO.ProductReviews,
  WooCommerce4D.Model.DTO.Products,
  WooCommerce4D.Model.DTO.ProductShippingClasses,
  WooCommerce4D.Model.DTO.ProductTags,
  WooCommerce4D.Model.DTO.ProductVariations,
  WooCommerce4D.Model.DTO.Refunds;

type
  TEntity = class(TInterfacedObject, iEntity)
  private
    FContent: String;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iEntity;
    function Coupons: iModelCouponsDTO;
    function Customers: iModelCustomerDTO;
    function Orders: iModelOrdersDTO;
    function OrdersNote: iModelOrderNotesDTO;
    function Refunds: iModelRefundDTO;
    function Products: iModelProductDTO;
    function ProductVariations: iModelProductVariationDTO;
    function ProductAttributes: iModelProductAttributeDTO;
    function ProductAttributeTerms: iModelProductAttributeTermsDTO;
    function ProductCategories: iModelProductCategoriesDTO;
    function ProductShippingClasses: iModelProductShippingClassesDTO;
    function ProductTags: iModelProductTagsDTO;
    function ProductReviews: iModelProductReviewDTO;
    function Content(Value: String): iEntity; overload;
    function Content: String; overload;
  end;

implementation

function TEntity.Content: String;
begin
  Result := FContent;
end;

function TEntity.Content(Value: String): iEntity;
begin
  Result := Self;
  FContent := Value;
end;

function TEntity.Coupons: iModelCouponsDTO;
begin
  Result := TModelCouponsDTO.New(Self);
end;

constructor TEntity.Create;
begin
end;

function TEntity.Customers: iModelCustomerDTO;
begin
  Result := TModelCustomerDTO.New(self);
end;

destructor TEntity.Destroy;
begin
  inherited;
end;

class function TEntity.New: iEntity;
begin
  Result := Self.Create;
end;

function TEntity.Orders: iModelOrdersDTO;
begin
  Result := TModelOrdersDTO.New;
end;

function TEntity.OrdersNote: iModelOrderNotesDTO;
begin
  Result := TModelOrderNotesDTO.New;
end;

function TEntity.ProductAttributes: iModelProductAttributeDTO;
begin
  Result := TModelProductAttributeDTO.New(Self);
end;

function TEntity.ProductAttributeTerms: iModelProductAttributeTermsDTO;
begin
  Result := TModelProductAttributeTermsDTO.New(Self);
end;

function TEntity.ProductCategories: iModelProductCategoriesDTO;
begin
  Result := TModelProductCategoriesDTO.New(Self);
end;

function TEntity.ProductReviews: iModelProductReviewDTO;
begin
  Result := TModelProductReviewDTO.New;
end;

function TEntity.Products: iModelProductDTO;
begin
  Result := TModelProductDTO.New(Self);
end;

function TEntity.ProductShippingClasses: iModelProductShippingClassesDTO;
begin
  Result := TModelProductShippingClassesDTO.New;
end;

function TEntity.ProductTags: iModelProductTagsDTO;
begin
  Result := TModelProductTagsDTO.New;
end;

function TEntity.ProductVariations: iModelProductVariationDTO;
begin
  Result := TModelProductVariationDTO.New(self);
end;

function TEntity.Refunds: iModelRefundDTO;
begin
  Result := TModelRefundDTO.New;
end;

end.
