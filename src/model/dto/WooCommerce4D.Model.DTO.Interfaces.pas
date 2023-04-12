unit WooCommerce4D.Model.DTO.Interfaces;

interface

uses
  WooCommerce4D.Types, System.JSON;

type
  iModelMetaDataDTO<T> = interface;
  iModelBillingDTO<T> = interface;
  iModelShippingDTO<T> = interface;
  iModelLinesItemsDTO<T> = interface;
  iModelShippingLinesDTO<T> = interface;
  iModelFreeLinesDTO<T> = interface;
  iModelCouponsLinesDTO<T> = interface;
  iModelDownloasDTO<T> = interface;
  iModelDimensionsDTO<T> = interface;
  iModelCategoriesDTO<T> = interface;
  iModelTagsDTO<T> = interface;
  iModelImagesDTO<T> = interface;
  iModelAttributesDTO<T> = interface;
  iModelDefaultAttributesDTO<T> = interface;
  iEntity = interface;

  iModelCouponsDTO = interface
    function Code(Value: String): iModelCouponsDTO; // obrigatorio
    function Amount(Value: String): iModelCouponsDTO;
    function DiscountType(Value: String): iModelCouponsDTO;
    function Description(Value: String): iModelCouponsDTO;
    function DateExpires(Value: String): iModelCouponsDTO;
    function DateExpiresGMT(Value: String): iModelCouponsDTO;
    function IndividualUse(Value: Boolean = false): iModelCouponsDTO;
    function ProductIDs(Value: String): iModelCouponsDTO; // array de ids
    function ExcludedProductIDs(Value: String): iModelCouponsDTO;// array de ids
    function UsageLimit(Value: Integer): iModelCouponsDTO;
    function UsageLimitPerUser(Value: Integer): iModelCouponsDTO;
    function LimitUsageToXItems(Value: Integer): iModelCouponsDTO;
    function FreeShipping(Value: Boolean = false): iModelCouponsDTO;
    function ProductCategories(Value: String): iModelCouponsDTO; // array de ids
    function ExcludedProductCategories(Value: String): iModelCouponsDTO;// array de ids
    function ExcludedSaleItems(Value: Boolean): iModelCouponsDTO;
    function MinimunAmount(Value: String): iModelCouponsDTO;
    function MaximumAmount(Value: String): iModelCouponsDTO;
    function EmailRestrictions(Value: String): iModelCouponsDTO; // array de ids
    function MetaData: iModelMetaDataDTO<iModelCouponsDTO>;
    function &End: iEntity;
  end;

  iModelMetaDataDTO<T> = interface
    function Id(Value: Integer): iModelMetaDataDTO<T>;
    function Key(Value: String): iModelMetaDataDTO<T>;
    function _Value(Value: String): iModelMetaDataDTO<T>;
    function &End: T;
  end;

  iModelCustomerDTO = interface
    function Email(Value: String): iModelCustomerDTO; // mandatory
    function FirstName(Value: String): iModelCustomerDTO;
    function LastName(Value: String): iModelCustomerDTO;
    function UserName(Value: String): iModelCustomerDTO;
    function Billing: iModelBillingDTO<iModelCustomerDTO>;
    function Shipping: iModelShippingDTO<iModelCustomerDTO>;
    function MetaData: iModelMetaDataDTO<iModelCustomerDTO>;
    function &End: iEntity;
  end;

  iModelBillingDTO<T> = interface
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

  iModelShippingDTO<T> = interface
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

  iModelOrdersDTO = interface
    function ParentId(Value: Integer): iModelOrdersDTO;
    function Status(Value: TStatusType = PENDING): iModelOrdersDTO; // Default pending
    function Currency(Value: TOrderCurrency = USD): iModelOrdersDTO; // Default USD
    function CustomerId(Value: Integer): iModelOrdersDTO;
    function CustomerNote(Value: String): iModelOrdersDTO;
    function Billing: iModelBillingDTO<iModelOrdersDTO>;
    function Shipping: iModelShippingDTO<iModelOrdersDTO>;
    function PaymentMethod(Value: String): iModelOrdersDTO;
    function PaymentMethodTitle(Value: String): iModelOrdersDTO;
    function TransactionId(Value: String): iModelOrdersDTO;
    function MetaData: iModelMetaDataDTO<iModelOrdersDTO>;
    function LineItems: iModelLinesItemsDTO<iModelOrdersDTO>;
    function ShippingLines: iModelShippingLinesDTO<iModelOrdersDTO>;
    function FreeLines: iModelFreeLinesDTO<iModelOrdersDTO>;
    function CouponLines: iModelCouponsLinesDTO<iModelOrdersDTO>;
    function &End : iModelOrdersDTO;
  end;

  iModelLinesItemsDTO<T> = interface
    function Name(Value: String): iModelLinesItemsDTO<T>;
    function ProductId(Value: Integer): iModelLinesItemsDTO<T>;
    function VariationId(Value: Integer): iModelLinesItemsDTO<T>;
    function Quantity(Value: Integer): iModelLinesItemsDTO<T>;
    function TaxClass(Value: String): iModelLinesItemsDTO<T>;
    function Subtotal(Value: String): iModelLinesItemsDTO<T>;
    function Total(Value: String): iModelLinesItemsDTO<T>;
    function MetaData: iModelMetaDataDTO<iModelLinesItemsDTO<T>>;
    function &End: T;
  end;

  iModelShippingLinesDTO<T> = interface
    function MethodTitle(Value: String): iModelShippingLinesDTO<T>;
    function MethodId(Value: String): iModelShippingLinesDTO<T>;
    function Total(Value: String): iModelShippingLinesDTO<T>;
    function MetaData: iModelMetaDataDTO<iModelShippingLinesDTO<T>>;
    function &End: T;
  end;

  iModelFreeLinesDTO<T> = interface
    function Name(Value: String): iModelFreeLinesDTO<T>;
    function TaxClass(Value: String): iModelFreeLinesDTO<T>;
    function taxStatus(Value: TStatusType): iModelFreeLinesDTO<T>;// taxable and none
    function Total(Value: String): iModelFreeLinesDTO<T>;
    function MetaData: iModelMetaDataDTO<iModelFreeLinesDTO<T>>;
    function &End: T;
  end;

  iModelCouponsLinesDTO<T> = interface
    function Code(Value: String): iModelCouponsLinesDTO<T>;
    function MetaData: iModelMetaDataDTO<iModelCouponsLinesDTO<T>>;
    function &End: T;
  end;

  iModelOrderNotesDTO = interface
    function CustomerNote(Value: Boolean = false): iModelOrderNotesDTO;
    function AddedByuser(Value: Boolean = false): iModelOrderNotesDTO;
    function &End: iModelOrderNotesDTO;
  end;

  iModelRefundDTO = interface
    function Amount(Value: String): iModelRefundDTO;
    function Reason(Value: String): iModelRefundDTO;
    function RefundedBy(Value: Integer): iModelRefundDTO;
    function MetaData: iModelMetaDataDTO<iModelRefundDTO>;
    function LineItems: iModelLinesItemsDTO<iModelRefundDTO>;
    function ApiRefund(Value: Boolean = true): iModelRefundDTO;
    function &End: iModelRefundDTO;
  end;

  iModelProductDTO = interface
    function Name(Value: String): iModelProductDTO;
    function Slug(Value: String): iModelProductDTO;
    function _Type(Value: TStatusType = SIMPLE): iModelProductDTO;
    function Status(Value: TStatusType = PUBLISH): iModelProductDTO;
    function Featured(Value: Boolean = false): iModelProductDTO;
    function CatalogVisibility(Value: TStatusType): iModelProductDTO;
    function Description(Value: String): iModelProductDTO;
    function ShortDescription(Value: String): iModelProductDTO;
    function Sku(Value: String): iModelProductDTO;
    function RegularPrice(Value: String): iModelProductDTO;
    function DateOnSaleFrom(Value: TDateTime): iModelProductDTO;
    function DateOnSaleFromGMT(Value: TDateTime): iModelProductDTO;
    function DateOnSaleTo(Value: TDateTime): iModelProductDTO;
    function DateOnSaleToGMT(Value: TDateTime): iModelProductDTO;
    function _Virtual(Value: Boolean = false): iModelProductDTO;
    function Downloadable(Value: Boolean = false): iModelProductDTO;
    function Downlaods: iModelDownloasDTO<iModelProductDTO>;
    function DownloadLimit(Value: Integer = -1): iModelProductDTO;
    function DownloadExpiry(Value: Integer = -1): iModelProductDTO;
    function ExternalUrl(Value: String): iModelProductDTO;
    function Buttontext(Value: String): iModelProductDTO;
    function taxStatus(Value: TStatusType = TAXABLE): iModelProductDTO;
    function TaxClass(Value: String): iModelProductDTO;
    function ManageStock(Value: Boolean = false): iModelProductDTO;
    function StockQuantity(Value: Integer): iModelProductDTO;
    function StockStatus(Value: TStatusType): iModelProductDTO;
    function BackOrders(Value: TStatusType = NO): iModelProductDTO;
    function SoldIndividualy(Value : Boolean = false) : iModelProductDTO;
    function Weight(Value : String) : iModelProductDTO;
    function Dimensions : iModelDimensionsDTO<iModelProductDTO>;
    function ShippingClass(Value : Boolean) : iModelProductDTO;
    function ReviewsAllowed(Value : Boolean = true) : iModelProductDTO;
    function UpsellIds(Value : String) : iModelProductDTO;//array ids
    function CrossSellIds(Value : String) : iModelProductDTO;//array ids
    function ParentId(Value : Integer) : iModelProductDTO;
    function PurchaseNote(Value : String) : iModelProductDTO;
    function Categories : iModelCategoriesDTO<iModelProductDTO>;
    function Tags : iModelTagsDTO<iModelProductDTO>;
    function Images : iModelImagesDTO<iModelProductDTO>;
    function Attributes : iModelAttributesDTO<iModelProductDTO>;
    function DefaultAttributes : iModelDefaultAttributesDTO<iModelProductDTO>;
    function GroupedProducts(Value : String) : iModelProductDTO;
    function MenuOrder(Value : integer) : iModelProductDTO;
    function MetaData : iModelMetaDataDTO<iModelProductDTO>;
    function &End: iEntity;
  end;

  iModelDownloasDTO<T> = interface
    function Id(Value : String) : iModelDownloasDTO<T>;
    function Name(Value : String) : iModelDownloasDTO<T>;
    function _File(Value : String) : iModelDownloasDTO<T>;
    function &End: T;
  end;

  iModelDimensionsDTO<T> = interface
    function _Length(Value : String) : iModelDimensionsDTO<T>;
    function Width(Value : String) : iModelDimensionsDTO<T>;
    function Height(Value : String) : iModelDimensionsDTO<T>;
    function &End : T;
  end;

  iModelCategoriesDTO<T> = interface
    function Id(Value : Integer) : iModelCategoriesDTO<T>;
    function Next : iModelCategoriesDTO<T>;
    function &End : T;
  end;

  iModelTagsDTO<T> = interface
    function Id(Value : Integer) : iModelTagsDTO<T>;
    function &End : T;
  end;

  iModelImagesDTO<T> = interface
    function Id(Value : Integer) : iModelImagesDTO<T>;
    function Src(Value : String) : iModelImagesDTO<T>;
    function Name(Value : String) : iModelImagesDTO<T>;
    function Alt(Value : string) : iModelImagesDTO<T>;
    function Next : iModelImagesDTO<T>;
    function &End : T;
  end;

  iModelAttributesDTO<T> = interface
    function id(Value : Integer) : iModelAttributesDTO<T>;
    function Name(Value : String) : iModelAttributesDTO<T>;
    function Position(Value : integer) : iModelAttributesDTO<T>;
    function Visible(Value : Boolean = false) : iModelAttributesDTO<T>;
    function Variation(Value : Boolean = false) : iModelAttributesDTO<T>;
    function Options(Value : String) : iModelAttributesDTO<T>;
    function &End : T;
  end;

  iModelDefaultAttributesDTO<T> = interface
    function Id(Value : Integer) : iModelDefaultAttributesDTO<T>;
    function Name(Value : String) : iModelDefaultAttributesDTO<T>;
    function Option(Value : String) : iModelDefaultAttributesDTO<T>;
    function &End : T;
  end;

  iModelProductVariationDTO = interface
    function Description(Value : String) : iModelProductVariationDTO;
    function Sku(Value : String) : iModelProductVariationDTO;
    function RegularPrice(Value : String) : iModelProductVariationDTO;
    function SalePrice(Value : String) : iModelProductVariationDTO;
    function DateOnSaleFrom(Value : TDateTime) : iModelProductVariationDTO;
    function DateOnSaleFromGMT(Value : TDateTime) : iModelProductVariationDTO;
    function DateOnSaleTo(Value : TDateTime) : iModelProductVariationDTO;
    function DateOnSaleToGMT(Value : TDateTime) : iModelProductVariationDTO;
    function Status(Value : TStatusType = PUBLISH) : iModelProductVariationDTO;
    function _Virtual(Value : Boolean = false) : iModelProductVariationDTO;
    function Downloadble(Value : Boolean = false) : iModelProductVariationDTO;
    function Downloads : iModelDownloasDTO<iModelProductVariationDTO>;
    function DownloadLimit(Value : Integer = -1) : iModelProductVariationDTO;
    function DownloadExpiry(Value : Integer = -1) : iModelProductVariationDTO;
    function TaxStatus(Value : TStatusType = TAXABLE) : iModelProductVariationDTO;
    function TaxClass(Value : String) : iModelProductVariationDTO;
    function ManageStock(Value : Boolean = false) : iModelProductVariationDTO;
    function StockQuantity(Value : Integer) : iModelProductVariationDTO;
    function StockStatus(Value : TStatusType = INSTOCK) : iModelProductVariationDTO;
    function BackOrders(Value : TStatusType = NO) : iModelProductVariationDTO;
    function Wight(Value : String) : iModelProductVariationDTO;
    function Dimensions : iModelDimensionsDTO<iModelProductVariationDTO>;
    function ShippingClass(Value : String) : iModelProductVariationDTO;
    function Image : iModelImagesDTO<iModelProductVariationDTO>;
    function Attributes : iModelAttributesDTO<iModelProductVariationDTO>;
    function MenuOrder(Value : Integer) : iModelProductVariationDTO;
    function MetaData : iModelMetaDataDTO<iModelProductVariationDTO>;
    function &End : iEntity;
  end;

  iModelProductAttributeDTO = interface
    function Name(Value : String) : iModelProductAttributeDTO;//mandatory
    function Slug(Value : String) : iModelProductAttributeDTO;
    function _Type(Value : TStatusType = SELECT) : iModelProductAttributeDTO;
    function OrderBy(Value : TStatusType) : iModelProductAttributeDTO;
    function HasArchives(Value : Boolean = false) : iModelProductAttributeDTO;
    function &End : iEntity;
  end;

  iModelProductAttributeTermsDTO = interface
    function Name(Value : String) : iModelProductAttributeTermsDTO;//mandatory
    function Slug(Value : String) : iModelProductAttributeTermsDTO;
    function Description(Value : String) : iModelProductAttributeTermsDTO;
    function MenuOrder(Value : Integer) : iModelProductAttributeTermsDTO;
    function &End : iEntity;
  end;

  iModelProductCategoriesDTO = interface
    function Name(value : String) : iModelProductCategoriesDTO;
    function Slug(Value : String) : iModelProductCategoriesDTO;
    function Parent(Value : Integer) : iModelProductCategoriesDTO;
    function Description(Value : String) : iModelProductCategoriesDTO;
    function Display(Value : TStatusType = DEFAULT) : iModelProductCategoriesDTO;
    function Image : iModelImagesDTO<iModelProductCategoriesDTO>;
    function MenuOrder(Value : Integer) : iModelProductCategoriesDTO;
    function &End : iEntity;
  end;

  iModelProductShippingClassesDTO = interface
    function Name(Value : String) : iModelProductShippingClassesDTO;//mandatory
    function Slug(Value : String) : iModelProductShippingClassesDTO;
    function Description(Value : String) : iModelProductShippingClassesDTO;
    function &End : iModelProductShippingClassesDTO;
  end;

  iModelProductTagsDTO = interface
    function Name(Value : String) : iModelProductTagsDTO;//mandatory
    function Slug(Value : String) : iModelProductTagsDTO;
    function Description(Value : String) : iModelProductTagsDTO;
    function &End : iModelProductTagsDTO;
  end;

  iModelProductReviewDTO = interface
    function ProductId(Value : Integer) : iModelProductReviewDTO;
    function Status(Value : TStatusType = UNTRASH) : iModelProductReviewDTO;
    function Reviewer(Value : String) : iModelProductReviewDTO;
    function ReviewerEmail(Value : String) : iModelProductReviewDTO;
    function Review(Value : String) : iModelProductReviewDTO;
    function Rating(Value : Integer) : iModelProductReviewDTO;//0 to 5
    function verified(Value : Boolean) : iModelProductReviewDTO;
    function &End : iModelProductReviewDTO;
  end;

  iModelTaxRatesDTO = interface
    function Country(Value : String) : iModelTaxRatesDTO;
    function State(Value : String) : iModelTaxRatesDTO;
    function PostCode(Value : String) : iModelTaxRatesDTO;
    function City(Value : String) : iModelTaxRatesDTO;
    function PostCodes(Value : String) : iModelTaxRatesDTO;
    function Cities(Value : String) : iModelTaxRatesDTO;
    function Rate(Value : String) : iModelTaxRatesDTO;
    function Name(Value : String) : iModelTaxRatesDTO;
    function Priority(Value : integer = 1) : iModelTaxRatesDTO;
    function Compound(Value : Boolean = false) : iModelTaxRatesDTO;
    function Shipping(Value : Boolean = true) : iModelTaxRatesDTO;
    function Order(Value : Integer) : iModelTaxRatesDTO;
    function _Class(Value : TStatusType = STANDARD) : iModelTaxRatesDTO;
    function &End : iModelTaxRatesDTO;
  end;

  iModelTaxClassesDTO = interface
    function Name(value : String) : iModelTaxClassesDTO;//required
    function &End : iModelTaxClassesDTO;
  end;

  iModelWebHooksDTO = interface
    function Name(Value : String) : iModelWebHooksDTO;
    function Status(Value : TStatusType = ACTIVE) : iModelWebHooksDTO;
    function Topic(Value : String) : iModelWebHooksDTO;//mandatory
    function Secret(Value : String) : iModelWebHooksDTO;
    function &End : iModelWebHooksDTO;
  end;

  iEntity = interface
    function Coupons : iModelCouponsDTO;
    function Customers : iModelCustomerDTO;
    function Orders : iModelOrdersDTO;
    function OrdersNote : iModelOrderNotesDTO;
    function Refunds : iModelRefundDTO;
    function Products : iModelProductDTO;
    function ProductVariations : iModelProductVariationDTO;
    function ProductAttributes : iModelProductAttributeDTO;
    function ProductAttributeTerms : iModelProductAttributeTermsDTO;
    function ProductCategories : iModelProductCategoriesDTO;
    function ProductShippingClasses : iModelProductShippingClassesDTO;
    function ProductTags : iModelProductTagsDTO;
    function ProductReviews : iModelProductReviewDTO;
    function Content(Value : String) : iEntity; overload;
    function Content : String; overload;
  end;

implementation

end.
