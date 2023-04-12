unit WooCommerce4D.Model.DTO.WebHooks;

interface

uses
  JSON,
  WooCommerce4D.Model.DTO.Interfaces,
  WooCommerce4D.Types;

type
  TModelWebHooksDTO = class(TInterfacedObject, iModelWebHooksDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelWebHooksDTO;
      function Name(Value : String) : iModelWebHooksDTO;
      function Status(Value : TStatusType = ACTIVE) : iModelWebHooksDTO;
      function Topic(Value : String) : iModelWebHooksDTO;//mandatory
      function Secret(Value : String) : iModelWebHooksDTO;
      function &End : iModelWebHooksDTO;
  end;

implementation

function TModelWebHooksDTO.&End: iModelWebHooksDTO;
begin
  Result := Self;
end;

constructor TModelWebHooksDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

destructor TModelWebHooksDTO.Destroy;
begin
  FJson.free;
  inherited;
end;

function TModelWebHooksDTO.Name(Value: String): iModelWebHooksDTO;
begin
  Result := Self;
  FJSON.AddPair('name',value);
end;

class function TModelWebHooksDTO.New : iModelWebHooksDTO;
begin
  Result := Self.Create;
end;

function TModelWebHooksDTO.Secret(Value: String): iModelWebHooksDTO;
begin
  Result := Self;
  FJSON.AddPair('secret',value);
end;

function TModelWebHooksDTO.Status(Value: TStatusType): iModelWebHooksDTO;
begin
  Result := Self;
  FJSON.AddPair('status',value.getvalue);
end;

function TModelWebHooksDTO.Topic(Value: String): iModelWebHooksDTO;
begin
  Result := Self;
  FJSON.AddPair('topic',value);
end;

end.
