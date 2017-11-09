structure GioAppInfoCreateFlags :> GIO_APP_INFO_CREATE_FLAGS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val NEEDS_TERMINAL = 0w1
    val SUPPORTS_URIS = 0w2
    val SUPPORTS_STARTUP_NOTIFICATION = 0w4
    val allFlags =
      [
        NONE,
        NEEDS_TERMINAL,
        SUPPORTS_URIS,
        SUPPORTS_STARTUP_NOTIFICATION
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "g_app_info_create_flags_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
