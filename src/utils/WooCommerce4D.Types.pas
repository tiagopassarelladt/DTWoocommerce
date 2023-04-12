unit WooCommerce4D.Types;

interface

uses
  TypInfo,
  SysUtils;

type
  THttpMethod = (GET, POST, PUT, DELETE);

  TApiVersionType = (V1,V2,V3);

  TEndpointBaseType = (COUPONS, CUSTOMERS, ORDERS, PRODUCTS, PRODUCTS_ATTRIBUTES,
    PRODUCTS_CATEGORIES, PRODUCTS_SHIPPING_CLASSES, PRODUCTS_TAGS, REPORTS,
    REPORTS_SALES, REPORTS_TOP_SELLERS, TAXES, TAXES_CLASSES, WEBHOOKS,
    TERMS, VARIATIONS);

  TStatusType = (PENDING, PROCESSING, ONHOLD, COMPLETED, CANCELLED, REFUNDED,
      FAILED, TRASH, DRAFT, _PRIVATE, PUBLISH,SIMPLE, GROUPED, _EXTERNAL,
      VARIABLE, VISIBLE, CATALOG, SEARCH, HIDDEN, TAXABLE, SHIPPING, NONE,
      INSTOCK, OUTOFSTOCK,ONBACKORDER, NO, NOTIFY, YES, SELECT, MENU_ORDER,
      NAME, NAME_NUM, ID, DEFAULT, _PRODUCTS, SUBCATEGORIES, BOTH, APPROVED,
      HOLD, SPAM, UNSPAM, UNTRASH, STANDARD, ACTIVE, PAUSED, DISABLE);

  TOrderCurrency = (AED, AFN, ALL, AMD, ANG, AOA, ARS, AUD, AWG, AZN, BAM, BBD,
    BDT, BGN, BHD, BIF, BMD, BND, BOB, BRL, BSD, BTC, BTN, BWP, BYR, BZD, CAD,
    CDF, CHF, CLP, CNY, COP, CRC, CUC, CUP, CVE, CZK, DJF, DKK, DOP, DZD, EGP,
    ERN, ETB, EUR, FJD, FKP, GBP, GEL, GGP, GHS, GIP, GMD, GNF, GTQ, GYD, HKD,
    HNL, HRK, HTG, HUF, IDR, ILS, IMP, INR, IQD, IRR, IRT, ISK, JEP, JMD, JOD,
    JPY, KES, KGS, KHR, KMF, KPW, KRW, KWD, KYD, KZT, LAK, LBP, LKR, LRD, LSL,
    LYD, MAD, MDL, MGA, MKD, MMK, MNT, MOP, MRO, MUR, MVR, MWK, MXN, MYR, MZN,
    NAD, NGN, NIO, NOK, NPR, NZD, OMR, PAB, PEN, PGK, PHP, PKR, PLN, PRB, PYG,
    QAR, RON, RSD, RUB, RWF, SAR, SBD, SCR, SDG, SEK, SGD, SHP, SLL, SOS, SRD,
    SSP, STD, SYP, SZL, THB, TJS, TMT, TND, TOP, _TRY, TTD, TWD, TZS, UAH, UGX,
    USD, UYU, UZS, VEF, VND, VUV, WST, XAF, XCD, XOF, XPF, YER, ZAR, ZMW);

  TOAuthHeader = (OAUTH_CONSUMER_KEY, OAUTH_TIMESTAMP, OAUTH_NONCE,
    OAUTH_SIGNATURE_METHOD, OAUTH_SIGNATURE);

  TOAuthHeaderHelper = record helper for TOAuthHeader
    function GetValue : String;
  end;

  TOrderCurrencyHelper = record helper for TOrderCurrency
    function GetValue : String;
  end;

  TStatusTypehelper = record helper for TStatusType
    function GetValue : String;
  end;

  TApiVersionTypeHelper = record helper for TApiVersionType
    function ToString : String;
  end;

  TEndpointBaseTypeHelper = record helper for TEndpointBaseType
    function GetValue : String;
  end;

  THttpMethodHelper = record helper for THttpMethod
    function GetValue : String;
  end;

implementation

{ TApiVersionTypeHelper }

function TApiVersionTypeHelper.ToString: String;
begin
  Result := lowerCase(GetEnumName(TypeInfo(TApiVersionType), Integer(Self)));
end;

{ TEndpointBaseTypeHelper }

function TEndpointBaseTypeHelper.GetValue : String;
begin
  case Self of
    COUPONS: Result := 'coupons';
    CUSTOMERS: Result := 'customers';
    ORDERS: Result := 'orders';
    PRODUCTS: Result := 'products';
    PRODUCTS_ATTRIBUTES: Result := 'products/attributes';
    PRODUCTS_CATEGORIES: Result := 'products/categories';
    PRODUCTS_SHIPPING_CLASSES: Result := 'products/shipping_classes';
    PRODUCTS_TAGS: Result := 'products/tags';
    REPORTS: Result := 'reports';
    REPORTS_SALES: Result := 'reports/sales';
    REPORTS_TOP_SELLERS: Result := 'reports/top_sellers';
    TAXES: Result := 'taxes';
    TAXES_CLASSES: Result := 'taxes/classes';
    WEBHOOKS: Result := 'webhooks';
    TERMS: result := 'terms';
    VARIATIONS: result := 'variations';
  end;
end;

{ THttpMethodHelper }

function THttpMethodHelper.GetValue: String;
begin
  Result := GetEnumName(TypeInfo(THttpMethod), Integer(Self));
end;

{ TStatusTypeHelper }

function TStatusTypehelper.GetValue: String;
begin
  case Self of
    PENDING: Result := 'pending';
    PROCESSING: Result := 'processing';
    ONHOLD: Result := 'on-hold';
    COMPLETED: Result := 'completed';
    CANCELLED: Result := 'cancelled';
    REFUNDED: Result := 'refunded';
    FAILED: Result := 'failed';
    TRASH: Result := 'trash';
    DRAFT: Result := 'draft';
    _PRIVATE: Result := 'private';
    PUBLISH: Result := 'publish';
    SIMPLE: Result := 'simple';
    GROUPED: Result := 'grouped';
    _EXTERNAL: Result := 'external';
    VARIABLE: Result := 'variable';
    VISIBLE: Result := 'visible';
    CATALOG: Result := 'catalog';
    SEARCH: Result := 'search';
    HIDDEN: Result := 'hidden';
    TAXABLE: Result := 'taxable';
    SHIPPING: Result := 'shipping';
    NONE: Result := 'none';
    INSTOCK: Result := 'instock';
    OUTOFSTOCK: Result := 'outofstock';
    ONBACKORDER: Result := 'onbackorder';
    NO: Result := 'no';
    NOTIFY: Result := 'notify';
    YES: Result := 'yes';
    SELECT: Result := 'select';
    MENU_ORDER: Result := 'menu_order';
    NAME: Result := 'name';
    NAME_NUM: result := 'name_num';
    ID: result := 'id';
    DEFAULT: result := 'default';
    _PRODUCTS: result := 'products';
    SUBCATEGORIES: result := 'subcategories';
    BOTH: result := 'both';
    APPROVED: result := 'approved';
    HOLD: result := 'hold';
    SPAM: result := 'spam';
    UNSPAM: result := 'unspam';
    UNTRASH: result := 'untrash';
    STANDARD: result := 'standard';
    ACTIVE: result := 'active';
    PAUSED: result := 'paused';
    DISABLE: result := 'disable';
  end;
end;

{ TOrderCurrencyHelper }

function TOrderCurrencyHelper.GetValue: String;
begin
  Result := StringReplace(GetEnumName(TypeInfo(TOrderCurrency), Integer(Self))
    ,'_','',[rfReplaceAll, rfIgnoreCase]);
end;

{ TOAuthHeaderHelper }

function TOAuthHeaderHelper.GetValue: String;
begin
  case Self of
    OAUTH_CONSUMER_KEY: Result := 'oauth_consumer_key';
    OAUTH_TIMESTAMP: Result := 'oauth_timestamp';
    OAUTH_NONCE: Result := 'oauth_nonce';
    OAUTH_SIGNATURE_METHOD: Result := 'oauth_signature_method';
    OAUTH_SIGNATURE: Result := 'oauth_signature';
  end;
end;

end.
