structure GioUnixCredentialsMessage :>
  GIO_UNIX_CREDENTIALS_MESSAGE
    where type 'a class = 'a GioUnixCredentialsMessageClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class =
  struct
    val getType_ = _import "g_unix_credentials_message_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_unix_credentials_message_new" : unit -> GioSocketControlMessageClass.C.notnull GioSocketControlMessageClass.C.p;
    val newWithCredentials_ = _import "g_unix_credentials_message_new_with_credentials" : GioCredentialsClass.C.notnull GioCredentialsClass.C.p -> GioSocketControlMessageClass.C.notnull GioSocketControlMessageClass.C.p;
    val isSupported_ = _import "g_unix_credentials_message_is_supported" : unit -> FFI.Bool.C.val_;
    val getCredentials_ = _import "g_unix_credentials_message_get_credentials" : GioUnixCredentialsMessageClass.C.notnull GioUnixCredentialsMessageClass.C.p -> GioCredentialsClass.C.notnull GioCredentialsClass.C.p;
    type 'a class = 'a GioUnixCredentialsMessageClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioUnixCredentialsMessageClass.C.fromPtr true) new_ ()
    fun newWithCredentials credentials = (GioCredentialsClass.C.withPtr ---> GioUnixCredentialsMessageClass.C.fromPtr true) newWithCredentials_ credentials
    fun isSupported () = (I ---> FFI.Bool.C.fromVal) isSupported_ ()
    fun getCredentials self = (GioUnixCredentialsMessageClass.C.withPtr ---> GioCredentialsClass.C.fromPtr false) getCredentials_ self
    local
      open Property
    in
      val credentialsProp =
        {
          get = fn x => get "credentials" GioCredentialsClass.tOpt x,
          set = fn x => set "credentials" GioCredentialsClass.tOpt x
        }
    end
  end
