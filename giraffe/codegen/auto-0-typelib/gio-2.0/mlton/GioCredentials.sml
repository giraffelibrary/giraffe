structure GioCredentials :>
  GIO_CREDENTIALS
    where type 'a class = 'a GioCredentialsClass.class =
  struct
    val getType_ = _import "g_credentials_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_credentials_new" : unit -> GioCredentialsClass.C.notnull GioCredentialsClass.C.p;
    val getUnixUser_ = fn x1 & x2 => (_import "g_credentials_get_unix_user" : GioCredentialsClass.C.notnull GioCredentialsClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.UInt32.C.val_;) (x1, x2)
    val isSameUser_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_credentials_is_same_user" :
              GioCredentialsClass.C.notnull GioCredentialsClass.C.p
               * GioCredentialsClass.C.notnull GioCredentialsClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setUnixUser_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_credentials_set_unix_user" :
              GioCredentialsClass.C.notnull GioCredentialsClass.C.p
               * FFI.UInt32.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "g_credentials_to_string" : GioCredentialsClass.C.notnull GioCredentialsClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
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
