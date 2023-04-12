unit WooCommerce4D.OAuth.OAuthConfig;

interface

uses
  WooCommerce4D.OAuth.Interfaces,
  WooCommerce4D.Types;

type
  TOAuthConfig = class(TInterfacedObject, iOAuthConfig)
    private
      FUrl : String;
      FConsumerKey : String;
      FConsumerSecret : String;
      FVersion : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iOAuthConfig;
      function Url(Value : String) : iOAuthConfig; overload;
      function Url : String; overload;
      function ConsumerKey(Value : String) : iOAuthConfig; overload;
      function ConsumerKey : String; overload;
      function ConsumerSecret(Value : String) : iOAuthConfig; overload;
      function ConsumerSecret : String; overload;
      function Version(Value : String) : iOAuthConfig; overload;
      function Version(Value : TApiVersionType) : iOAuthConfig; overload;
      function Version : String; overload;
  end;

implementation

function TOAuthConfig.ConsumerKey(Value: String): iOAuthConfig;
begin
  Result := Self;
  FConsumerKey := Value;
end;

function TOAuthConfig.ConsumerKey: String;
begin
  Result := FConsumerKey;
end;

function TOAuthConfig.ConsumerSecret: String;
begin
  Result := FConsumerSecret;
end;

function TOAuthConfig.ConsumerSecret(Value: String): iOAuthConfig;
begin
  Result := Self;
  FConsumerSecret := Value;
end;

constructor TOAuthConfig.Create;
begin

end;

destructor TOAuthConfig.Destroy;
begin

  inherited;
end;

class function TOAuthConfig.New : iOAuthConfig;
begin
  Result := Self.Create;
end;

function TOAuthConfig.Url(Value: String): iOAuthConfig;
begin
  Result := Self;
  FUrl := Value;
end;

function TOAuthConfig.Url: String;
begin
  Result := FUrl;
end;

function TOAuthConfig.Version(Value: TApiVersionType): iOAuthConfig;
begin
 Result := Self;
 FVersion := Value.ToString;
end;

function TOAuthConfig.Version: String;
begin
  Result := FVersion;
end;

function TOAuthConfig.Version(Value: String): iOAuthConfig;
begin
  Result := Self;
  FVersion := Value;
end;

end.
