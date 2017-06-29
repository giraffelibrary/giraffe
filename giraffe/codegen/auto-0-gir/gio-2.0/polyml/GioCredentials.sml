structure GioCredentials :>
  GIO_CREDENTIALS
    where type 'a class = 'a GioCredentialsClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_credentials_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_credentials_new") (PolyMLFFI.cVoid --> GioCredentialsClass.PolyML.cPtr)
      val getUnixUser_ = call (getSymbol "g_credentials_get_unix_user") (GioCredentialsClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GUInt.PolyML.cVal)
      val isSameUser_ =
        call (getSymbol "g_credentials_is_same_user")
          (
            GioCredentialsClass.PolyML.cPtr
             &&> GioCredentialsClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setUnixUser_ =
        call (getSymbol "g_credentials_set_unix_user")
          (
            GioCredentialsClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val toString_ = call (getSymbol "g_credentials_to_string") (GioCredentialsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioCredentialsClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioCredentialsClass.FFI.fromPtr true) new_ ()
    fun getUnixUser self = (GioCredentialsClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GUInt.FFI.fromVal) getUnixUser_ (self & [])
    fun isSameUser self otherCredentials =
      (
        GioCredentialsClass.FFI.withPtr
         &&&> GioCredentialsClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        isSameUser_
        (
          self
           & otherCredentials
           & []
        )
    fun setUnixUser self uid =
      (
        GioCredentialsClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        setUnixUser_
        (
          self
           & uid
           & []
        )
    fun toString self = (GioCredentialsClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
