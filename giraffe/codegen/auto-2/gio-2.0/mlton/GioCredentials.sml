structure GioCredentials :>
  GIO_CREDENTIALS
    where type 'a class_t = 'a GioCredentialsClass.t
    where type credentialstype_t = GioCredentialsType.t =
  struct
    val getType_ = _import "g_credentials_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_credentials_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getUnixUser_ = fn x1 & x2 => (_import "g_credentials_get_unix_user" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Word32.val_;) (x1, x2)
    val isSameUser_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_credentials_is_same_user" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setNative_ = fn x1 & x2 => (_import "g_credentials_set_native" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioCredentialsType.C.val_ -> unit;) (x1, x2)
    val setUnixUser_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_credentials_set_unix_user" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Word32.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "g_credentials_to_string" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    type 'a class_t = 'a GioCredentialsClass.t
    type credentialstype_t = GioCredentialsType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioCredentialsClass.C.fromPtr true) new_ ()
    fun getUnixUser self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Word32.fromVal) getUnixUser_ (self & [])
    fun isSameUser self otherCredentials =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        isSameUser_
        (
          self
           & otherCredentials
           & []
        )
    fun setNative self nativeType = (GObjectObjectClass.C.withPtr &&&> GioCredentialsType.C.withVal ---> I) setNative_ (self & nativeType)
    fun setUnixUser self uid =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word32.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        setUnixUser_
        (
          self
           & uid
           & []
        )
    fun toString self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) toString_ self
  end
