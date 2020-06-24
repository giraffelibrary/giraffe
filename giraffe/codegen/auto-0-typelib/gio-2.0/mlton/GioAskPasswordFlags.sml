structure GioAskPasswordFlags :> GIO_ASK_PASSWORD_FLAGS =
  struct
    val NEED_PASSWORD = 0w1
    val NEED_USERNAME = 0w2
    val NEED_DOMAIN = 0w4
    val SAVING_SUPPORTED = 0w8
    val ANONYMOUS_SUPPORTED = 0w16
    val allFlags =
      [
        NEED_PASSWORD,
        NEED_USERNAME,
        NEED_DOMAIN,
        SAVING_SUPPORTED,
        ANONYMOUS_SUPPORTED
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "g_ask_password_flags_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
