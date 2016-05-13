structure GioCredentials :>
  GIO_CREDENTIALS
    where type 'a class = 'a GioCredentialsClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_credentials_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_credentials_new") (PolyMLFFI.cVoid --> GioCredentialsClass.PolyML.cPtr)
      val getUnixUser_ = call (load_sym libgio "g_credentials_get_unix_user") (GioCredentialsClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.UInt32.PolyML.cVal)
      val isSameUser_ =
        call (load_sym libgio "g_credentials_is_same_user")
          (
            GioCredentialsClass.PolyML.cPtr
             &&> GioCredentialsClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setUnixUser_ =
        call (load_sym libgio "g_credentials_set_unix_user")
          (
            GioCredentialsClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val toString_ = call (load_sym libgio "g_credentials_to_string") (GioCredentialsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioCredentialsClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioCredentialsClass.C.fromPtr true) new_ ()
    fun getUnixUser self = (GioCredentialsClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.UInt32.C.fromVal) getUnixUser_ (self & [])
    fun isSameUser self otherCredentials =
      (
        GioCredentialsClass.C.withPtr
         &&&> GioCredentialsClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        isSameUser_
        (
          self
           & otherCredentials
           & []
        )
    fun setUnixUser self uid =
      (
        GioCredentialsClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setUnixUser_
        (
          self
           & uid
           & []
        )
    fun toString self = (GioCredentialsClass.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
