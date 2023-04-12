unit WooCommerce4D.Model.DTO.ProductVariations;

interface

uses
  JSON,
  DateUtils,
  WooCommerce4D.Model.DTO.Interfaces, WooCommerce4D.Types,
  WooCommerce4D.Model.DTO.Attributes, WooCommerce4D.Model.DTO.Dimensions,
  WooCommerce4D.Model.DTO.Downloads, WooCommerce4D.Model.DTO.Images,
  WooCommerce4D.Model.DTO.MetaData;

type
  TModelProductVariationDTO = class(TInterfacedObject, iModelProductVariationDTO)
    private
      [weak]
      FParent : iEntity;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : iEntity);
      destructor Destroy; override;
      class function New(Parent : iEntity) : iModelProductVariationDTO;
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

implementation

function TModelProductVariationDTO.Attributes: iModelAttributesDTO<iModelProductVariationDTO>;
begin
  Result := TModelAttributesDTO<iModelProductVariationDTO>.New(Self);
end;

function TModelProductVariationDTO.BackOrders(
  Value: TStatusType): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('backorders',value.getvalue);
end;

function TModelProductVariationDTO.&End: iEntity;
begin
  Result := FParent.Content(FJson.ToJSON);
end;

constructor TModelProductVariationDTO.Create(Parent : iEntity);
begin
  FParent := Parent;
  FJSON := TJSONObject.Create;
end;

function TModelProductVariationDTO.DateOnSaleFrom(
  Value: TDateTime): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('date_on_sale_from', DateToISO8601(Value));
end;

function TModelProductVariationDTO.DateOnSaleFromGMT(
  Value: TDateTime): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('date_on_sale_from_gmt', DateToISO8601(Value));
end;

function TModelProductVariationDTO.DateOnSaleTo(
  Value: TDateTime): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('date_on_sale_to', DateToISO8601(Value));
end;

function TModelProductVariationDTO.DateOnSaleToGMT(
  Value: TDateTime): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('date_on_sale_to_gmt', DateToISO8601(Value));
end;

function TModelProductVariationDTO.Description(
  Value: String): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('description', Value);
end;

destructor TModelProductVariationDTO.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TModelProductVariationDTO.Dimensions: iModelDimensionsDTO<iModelProductVariationDTO>;
begin
  Result := TModelDimensionsDTO<iModelProductVariationDTO>.New(Self, FJSON);
end;

function TModelProductVariationDTO.Downloadble(
  Value: Boolean): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('downloadble', TJSONBool.Create(Value));
end;

function TModelProductVariationDTO.DownloadExpiry(
  Value: Integer): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('download_expiry', TJsonNumber.Create(Value));
end;

function TModelProductVariationDTO.DownloadLimit(
  Value: Integer): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('download_limit', TJSONNumber.Create(Value));
end;

function TModelProductVariationDTO.Downloads: iModelDownloasDTO<iModelProductVariationDTO>;
begin
  Result := TModelDownloasDTO<iModelProductVariationDTO>.New(Self);
end;

function TModelProductVariationDTO.Image: iModelImagesDTO<iModelProductVariationDTO>;
begin
  Result := TModelImagesDTO<iModelProductVariationDTO>.New(Self, FJSON);
end;

function TModelProductVariationDTO.ManageStock(
  Value: Boolean): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('manage_stock', TJSONBool.Create(Value));
end;

function TModelProductVariationDTO.MenuOrder(
  Value: Integer): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('menu_order', TJSONNumber.Create(Value));
end;

function TModelProductVariationDTO.MetaData: iModelMetaDataDTO<iModelProductVariationDTO>;
begin
  Result := TModelMetaDataDTO<iModelProductVariationDTO>.New(Self);
end;

class function TModelProductVariationDTO.New (Parent : iEntity) : iModelProductVariationDTO;
begin
  Result := Self.Create(Parent);
end;

function TModelProductVariationDTO.RegularPrice(
  Value: String): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('regular_price', Value);
end;

function TModelProductVariationDTO.SalePrice(
  Value: String): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('sale_price', Value);
end;

function TModelProductVariationDTO.ShippingClass(
  Value: String): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('shipping_class', Value);
end;

function TModelProductVariationDTO.Sku(
  Value: String): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('sku', Value);
end;

function TModelProductVariationDTO.Status(
  Value: TStatusType): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('status', Value.GetValue);
end;

function TModelProductVariationDTO.StockQuantity(
  Value: Integer): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('stock_quantity', TJSONNumber.Create(Value));
end;

function TModelProductVariationDTO.StockStatus(
  Value: TStatusType): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('stock_status', Value.GetValue);
end;

function TModelProductVariationDTO.TaxClass(
  Value: String): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('tax_class', Value);
end;

function TModelProductVariationDTO.TaxStatus(
  Value: TStatusType): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('tax_status', Value.GetValue);
end;

function TModelProductVariationDTO.Wight(
  Value: String): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('wight', Value);
end;

function TModelProductVariationDTO._Virtual(
  Value: Boolean): iModelProductVariationDTO;
begin
  Result := Self;
  FJSON.AddPair('virtual', TJSONBool.Create(Value));
end;

end.
