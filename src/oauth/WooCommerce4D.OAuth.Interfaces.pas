unit WooCommerce4D.OAuth.Interfaces;

interface

uses
  WooCommerce4D.Types;

type
  iOAuthConfig = interface
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

end.
