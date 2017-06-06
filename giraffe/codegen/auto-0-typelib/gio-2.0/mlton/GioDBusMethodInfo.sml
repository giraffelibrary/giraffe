structure GioDBusMethodInfo :>
  GIO_D_BUS_METHOD_INFO
    where type t = GioDBusMethodInfoRecord.t =
  struct
    val getType_ = _import "g_dbus_method_info_get_type" : unit -> GObjectType.FFI.val_;
    type t = GioDBusMethodInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
