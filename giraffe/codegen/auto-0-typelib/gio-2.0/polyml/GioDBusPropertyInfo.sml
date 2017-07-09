structure GioDBusPropertyInfo :>
  GIO_D_BUS_PROPERTY_INFO
    where type t = GioDBusPropertyInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_property_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type t = GioDBusPropertyInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
