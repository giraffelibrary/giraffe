structure GioDBusConnectionFlags :> GIO_D_BUS_CONNECTION_FLAGS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val AUTHENTICATION_CLIENT = 0w1
    val AUTHENTICATION_SERVER = 0w2
    val AUTHENTICATION_ALLOW_ANONYMOUS = 0w4
    val MESSAGE_BUS_CONNECTION = 0w8
    val DELAY_MESSAGE_PROCESSING = 0w16
    val allFlags =
      [
        NONE,
        AUTHENTICATION_CLIENT,
        AUTHENTICATION_SERVER,
        AUTHENTICATION_ALLOW_ANONYMOUS,
        MESSAGE_BUS_CONNECTION,
        DELAY_MESSAGE_PROCESSING
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "g_dbus_connection_flags_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
