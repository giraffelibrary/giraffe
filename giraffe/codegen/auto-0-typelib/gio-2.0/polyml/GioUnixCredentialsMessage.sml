structure GioUnixCredentialsMessage :>
  GIO_UNIX_CREDENTIALS_MESSAGE
    where type 'a class_t = 'a GioUnixCredentialsMessageClass.t
    where type 'a credentials_class_t = 'a GioCredentialsClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_credentials_message_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_unix_credentials_message_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newWithCredentials_ = call (load_sym libgio "g_unix_credentials_message_new_with_credentials") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val isSupported_ = call (load_sym libgio "g_unix_credentials_message_is_supported") (FFI.PolyML.cVoid --> FFI.Bool.PolyML.cVal)
      val getCredentials_ = call (load_sym libgio "g_unix_credentials_message_get_credentials") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class_t = 'a GioUnixCredentialsMessageClass.t
    type 'a credentials_class_t = 'a GioCredentialsClass.t
    type t = base class_t
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
