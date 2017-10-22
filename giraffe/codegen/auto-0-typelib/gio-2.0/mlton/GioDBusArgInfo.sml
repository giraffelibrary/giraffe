structure GioDBusArgInfo :>
  GIO_D_BUS_ARG_INFO
    where type t = GioDBusArgInfoRecord.t =
  struct
    val getType_ = _import "g_dbus_arg_info_get_type" : unit -> GObjectType.FFI.val_;
    type t = GioDBusArgInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
