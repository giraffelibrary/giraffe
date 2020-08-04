structure GioDBusNodeInfo :>
  GIO_D_BUS_NODE_INFO
    where type t = GioDBusNodeInfoRecord.t
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t =
  struct
    val getType_ = _import "g_dbus_node_info_get_type" : unit -> GObjectType.FFI.val_;
    val newForXml_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_dbus_node_info_new_for_xml" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioDBusNodeInfoRecord.FFI.non_opt GioDBusNodeInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val lookupInterface_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_node_info_lookup_interface" :
              GioDBusNodeInfoRecord.FFI.non_opt GioDBusNodeInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioDBusInterfaceInfoRecord.FFI.non_opt GioDBusInterfaceInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GioDBusNodeInfoRecord.t
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newForXml xmlData = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> GioDBusNodeInfoRecord.FFI.fromPtr true) newForXml_ (xmlData & [])
    fun lookupInterface self name = (GioDBusNodeInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioDBusInterfaceInfoRecord.FFI.fromPtr false) lookupInterface_ (self & name)
  end
