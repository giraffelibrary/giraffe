structure GioUnixCredentialsMessage :>
  GIO_UNIX_CREDENTIALS_MESSAGE
    where type 'a class = 'a GioUnixCredentialsMessageClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class =
  struct
    val getType_ = _import "g_unix_credentials_message_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_unix_credentials_message_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithCredentials_ = _import "g_unix_credentials_message_new_with_credentials" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val isSupported_ = _import "g_unix_credentials_message_is_supported" : unit -> FFI.Bool.C.val_;
    val getCredentials_ = _import "g_unix_credentials_message_get_credentials" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class = 'a GioUnixCredentialsMessageClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioUnixCredentialsMessageClass.C.fromPtr true) new_ ()
    fun newWithCredentials credentials = (GObjectObjectClass.C.withPtr ---> GioUnixCredentialsMessageClass.C.fromPtr true) newWithCredentials_ credentials
    fun isSupported () = (I ---> FFI.Bool.C.fromVal) isSupported_ ()
    fun getCredentials self = (GObjectObjectClass.C.withPtr ---> GioCredentialsClass.C.fromPtr false) getCredentials_ self
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
