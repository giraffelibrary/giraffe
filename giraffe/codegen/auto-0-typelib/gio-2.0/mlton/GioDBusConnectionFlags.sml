structure GioDBusConnectionFlags :>
  sig
    include GIO_D_BUS_CONNECTION_FLAGS
  end =
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
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    val getType_ = _import "g_dbus_connection_flags_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
