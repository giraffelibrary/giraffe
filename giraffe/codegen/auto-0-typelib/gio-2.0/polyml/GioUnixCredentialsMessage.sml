structure GioUnixCredentialsMessage :>
  GIO_UNIX_CREDENTIALS_MESSAGE
    where type 'a class = 'a GioUnixCredentialsMessageClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_credentials_message_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_unix_credentials_message_new") (cVoid --> GioSocketControlMessageClass.PolyML.cPtr)
      val newWithCredentials_ = call (getSymbol "g_unix_credentials_message_new_with_credentials") (GioCredentialsClass.PolyML.cPtr --> GioSocketControlMessageClass.PolyML.cPtr)
      val isSupported_ = call (getSymbol "g_unix_credentials_message_is_supported") (cVoid --> GBool.PolyML.cVal)
      val getCredentials_ = call (getSymbol "g_unix_credentials_message_get_credentials") (GioUnixCredentialsMessageClass.PolyML.cPtr --> GioCredentialsClass.PolyML.cPtr)
    end
    type 'a class = 'a GioUnixCredentialsMessageClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioUnixCredentialsMessageClass.FFI.fromPtr true) new_ ()
    fun newWithCredentials credentials = (GioCredentialsClass.FFI.withPtr false ---> GioUnixCredentialsMessageClass.FFI.fromPtr true) newWithCredentials_ credentials
    fun isSupported () = (I ---> GBool.FFI.fromVal) isSupported_ ()
    fun getCredentials self = (GioUnixCredentialsMessageClass.FFI.withPtr false ---> GioCredentialsClass.FFI.fromPtr false) getCredentials_ self
    local
      open Property
    in
      val credentialsProp =
        {
          get = fn x => get "credentials" GioCredentialsClass.tOpt x,
          new = fn x => new "credentials" GioCredentialsClass.tOpt x
        }
    end
  end
