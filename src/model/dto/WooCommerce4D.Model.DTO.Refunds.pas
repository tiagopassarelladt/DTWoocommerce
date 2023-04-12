unit WooCommerce4D.Model.DTO.Refunds;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Model.DTO.LinesItems, WooCommerce4D.Model.DTO.MetaData;

type
  TModelRefundDTO = class(TInterfacedObject, iModelRefundDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelRefundDTO;
      function Amount(Value: String): iModelRefundDTO;
      function Reason(Value: String): iModelRefundDTO;
      function RefundedBy(Value: Integer): iModelRefundDTO;
      function MetaData: iModelMetaDataDTO<iModelRefundDTO>;
      function LineItems: iModelLinesItemsDTO<iModelRefundDTO>;
      function ApiRefund(Value: Boolean = true): iModelRefundDTO;
      function &End: iModelRefundDTO;
  end;

implementation

function TModelRefundDTO.Amount(Value: String): iModelRefundDTO;
begin
  Result := Self;
  FJSON.AddPair('amount',value);
end;

function TModelRefundDTO.ApiRefund(Value: Boolean): iModelRefundDTO;
begin
  Result := Self;
  FJSON.AddPair('api_refund', TJSONBool.Create(value));
end;

function TModelRefundDTO.&End: iModelRefundDTO;
begin
  Result := Self;
end;

constructor TModelRefundDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

destructor TModelRefundDTO.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TModelRefundDTO.LineItems: iModelLinesItemsDTO<iModelRefundDTO>;
begin
  Result := TModelLinesItemsDTO<iModelRefundDTO>.New(Self);
end;

function TModelRefundDTO.MetaData: iModelMetaDataDTO<iModelRefundDTO>;
begin
  Result := TModelMetaDataDTO<iModelRefundDTO>.New(self);
end;

class function TModelRefundDTO.New : iModelRefundDTO;
begin
  Result := Self.Create;
end;

function TModelRefundDTO.Reason(Value: String): iModelRefundDTO;
begin
  Result := Self;
  FJSON.AddPair('reason', value);
end;

function TModelRefundDTO.RefundedBy(Value: Integer): iModelRefundDTO;
begin
  Result := Self;
  FJSON.AddPair('refunded_by', TJSONNumber.Create(value));
end;

end.
