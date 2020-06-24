structure GioDBusProxyFlags :> GIO_D_BUS_PROXY_FLAGS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val DO_NOT_LOAD_PROPERTIES = 0w1
    val DO_NOT_CONNECT_SIGNALS = 0w2
    val DO_NOT_AUTO_START = 0w4
    val GET_INVALIDATED_PROPERTIES = 0w8
    val DO_NOT_AUTO_START_AT_CONSTRUCTION = 0w16
    val allFlags =
      [
        NONE,
        DO_NOT_LOAD_PROPERTIES,
        DO_NOT_CONNECT_SIGNALS,
        DO_NOT_AUTO_START,
        GET_INVALIDATED_PROPERTIES,
        DO_NOT_AUTO_START_AT_CONSTRUCTION
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "g_dbus_proxy_flags_get_type" : unit -> GObjectType.FFI.val_;
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
