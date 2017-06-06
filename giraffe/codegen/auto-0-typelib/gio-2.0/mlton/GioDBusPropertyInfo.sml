structure GioDBusPropertyInfo :>
  GIO_D_BUS_PROPERTY_INFO
    where type t = GioDBusPropertyInfoRecord.t =
  struct
    val getType_ = _import "g_dbus_property_info_get_type" : unit -> GObjectType.FFI.val_;
    type t = GioDBusPropertyInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
