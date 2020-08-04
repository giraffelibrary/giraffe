structure GioCredentials :>
  GIO_CREDENTIALS
    where type 'a class = 'a GioCredentialsClass.class =
  struct
    val getType_ = _import "g_credentials_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_credentials_new" : unit -> GioCredentialsClass.FFI.non_opt GioCredentialsClass.FFI.p;
    val getUnixPid_ = fn x1 & x2 => (_import "g_credentials_get_unix_pid" : GioCredentialsClass.FFI.non_opt GioCredentialsClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GInt.FFI.val_;) (x1, x2)
    val getUnixUser_ = fn x1 & x2 => (_import "g_credentials_get_unix_user" : GioCredentialsClass.FFI.non_opt GioCredentialsClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GUInt.FFI.val_;) (x1, x2)
    val isSameUser_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_credentials_is_same_user" :
              GioCredentialsClass.FFI.non_opt GioCredentialsClass.FFI.p
               * GioCredentialsClass.FFI.non_opt GioCredentialsClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioCredentialsClass.FFI.non_opt GioCredentialsClass.FFI.p
               * GUInt.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "g_credentials_to_string" : GioCredentialsClass.FFI.non_opt GioCredentialsClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    type 'a class = 'a GioCredentialsClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioCredentialsClass.FFI.fromPtr true) new_ ()
    fun getUnixPid self = (GioCredentialsClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GInt.FFI.fromVal) getUnixPid_ (self & [])
    fun getUnixUser self = (GioCredentialsClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GUInt.FFI.fromVal) getUnixUser_ (self & [])
    fun isSameUser self otherCredentials =
      (
        GioCredentialsClass.FFI.withPtr false
         &&&> GioCredentialsClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        isSameUser_
        (
          self
           & otherCredentials
           & []
        )
    fun setUnixUser self uid =
      (
        GioCredentialsClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setUnixUser_
        (
          self
           & uid
           & []
        )
    fun toString self = (GioCredentialsClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) toString_ self
  end
