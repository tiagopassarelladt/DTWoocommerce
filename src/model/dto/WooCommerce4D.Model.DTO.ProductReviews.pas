unit WooCommerce4D.Model.DTO.ProductReviews;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Types;

type
  TModelProductReviewDTO = class(TInterfacedObject, iModelProductReviewDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelProductReviewDTO;
      function ProductId(Value : Integer) : iModelProductReviewDTO;
      function Status(Value : TStatusType = UNTRASH) : iModelProductReviewDTO;
      function Reviewer(Value : String) : iModelProductReviewDTO;
      function ReviewerEmail(Value : String) : iModelProductReviewDTO;
      function Review(Value : String) : iModelProductReviewDTO;
      function Rating(Value : Integer) : iModelProductReviewDTO;//0 to 5
      function verified(Value : Boolean) : iModelProductReviewDTO;
      function &End : iModelProductReviewDTO;
  end;

implementation

function TModelProductReviewDTO.&End: iModelProductReviewDTO;
begin
  Result := Self;
end;

constructor TModelProductReviewDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

destructor TModelProductReviewDTO.Destroy;
begin
  FJson.Free;
  inherited;
end;

class function TModelProductReviewDTO.New : iModelProductReviewDTO;
begin
  Result := Self.Create;
end;

function TModelProductReviewDTO.ProductId(Value: Integer): iModelProductReviewDTO;
begin
  Result := Self;
  FJSON.AddPair('product_id', TJSONNumber.Create(Value));
end;

function TModelProductReviewDTO.Rating(Value: Integer): iModelProductReviewDTO;
begin
  Result := Self;
  FJSON.AddPair('rating', TJSONNumber.Create(Value));
end;

function TModelProductReviewDTO.Review(Value: String): iModelProductReviewDTO;
begin
  Result := Self;
  FJSON.AddPair('review', Value);
end;

function TModelProductReviewDTO.ReviewerEmail(Value: String): iModelProductReviewDTO;
begin
  Result := Self;
  FJSON.AddPair('reviewer_email', Value);
end;

function TModelProductReviewDTO.Reviewer(Value: String): iModelProductReviewDTO;
begin
  Result := Self;
  FJSON.AddPair('reviewer', Value);
end;

function TModelProductReviewDTO.Status(Value: TStatusType): iModelProductReviewDTO;
begin
  Result := Self;
  FJSON.AddPair('status', Value.GetValue);
end;

function TModelProductReviewDTO.verified(Value: Boolean): iModelProductReviewDTO;
begin
  Result := Self;
  FJSON.AddPair('verified', TJSONBool.Create(Value));
end;

end.
