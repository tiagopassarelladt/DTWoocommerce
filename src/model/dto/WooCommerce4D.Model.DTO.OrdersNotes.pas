unit WooCommerce4D.Model.DTO.OrdersNotes;

interface

uses
  Json,
  WooCommerce4D.Model.DTO.Interfaces;

type
  TModelOrderNotesDTO = class(TInterfacedObject, iModelOrderNotesDTO)
    private
      FJSON : TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelOrderNotesDTO;
      function CustomerNote(Value: Boolean = false): iModelOrderNotesDTO;
      function AddedByuser(Value: Boolean = false): iModelOrderNotesDTO;
      function &End: iModelOrderNotesDTO;
  end;

implementation

function TModelOrderNotesDTO.AddedByuser(Value: Boolean): iModelOrderNotesDTO;
begin
  Result := Self;
  FJSON.AddPair('added_by_user', TJSONBool.Create(Value));
end;

function TModelOrderNotesDTO.&End: iModelOrderNotesDTO;
begin
  Result := Self;
end;

constructor TModelOrderNotesDTO.Create;
begin
  FJSON := TJSONObject.Create;
end;

function TModelOrderNotesDTO.CustomerNote(Value: Boolean): iModelOrderNotesDTO;
begin
  Result := Self;
  FJSON.AddPair('customer_note', TJSONBool.Create(Value));
end;

destructor TModelOrderNotesDTO.Destroy;
begin
  FJSON.Free;
  inherited;
end;

class function TModelOrderNotesDTO.New : iModelOrderNotesDTO;
begin
  Result := Self.Create;
end;

end.
