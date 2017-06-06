structure GioDBusSignalInfo :>
  GIO_D_BUS_SIGNAL_INFO
    where type t = GioDBusSignalInfoRecord.t =
  struct
    val getType_ = _import "g_dbus_signal_info_get_type" : unit -> GObjectType.FFI.val_;
    type t = GioDBusSignalInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
