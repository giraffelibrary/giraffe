structure GioDBusArgInfo :>
  GIO_D_BUS_ARG_INFO
    where type t = GioDBusArgInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_arg_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type t = GioDBusArgInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
