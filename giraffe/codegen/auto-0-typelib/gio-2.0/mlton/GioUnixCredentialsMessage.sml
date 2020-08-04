structure GioUnixCredentialsMessage :>
  GIO_UNIX_CREDENTIALS_MESSAGE
    where type 'a class = 'a GioUnixCredentialsMessageClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class =
  struct
    val getType_ = _import "g_unix_credentials_message_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_unix_credentials_message_new" : unit -> GioSocketControlMessageClass.FFI.non_opt GioSocketControlMessageClass.FFI.p;
    val newWithCredentials_ = _import "g_unix_credentials_message_new_with_credentials" : GioCredentialsClass.FFI.non_opt GioCredentialsClass.FFI.p -> GioSocketControlMessageClass.FFI.non_opt GioSocketControlMessageClass.FFI.p;
    val isSupported_ = _import "g_unix_credentials_message_is_supported" : unit -> GBool.FFI.val_;
    val getCredentials_ = _import "g_unix_credentials_message_get_credentials" : GioUnixCredentialsMessageClass.FFI.non_opt GioUnixCredentialsMessageClass.FFI.p -> GioCredentialsClass.FFI.non_opt GioCredentialsClass.FFI.p;
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
