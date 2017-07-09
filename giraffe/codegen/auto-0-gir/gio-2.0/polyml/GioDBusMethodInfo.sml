structure GioDBusMethodInfo :>
  GIO_D_BUS_METHOD_INFO
    where type t = GioDBusMethodInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_method_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type t = GioDBusMethodInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
