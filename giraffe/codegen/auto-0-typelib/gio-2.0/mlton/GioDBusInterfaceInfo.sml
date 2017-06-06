structure GioDBusInterfaceInfo :>
  GIO_D_BUS_INTERFACE_INFO
    where type t = GioDBusInterfaceInfoRecord.t
    where type d_bus_method_info_t = GioDBusMethodInfoRecord.t
    where type d_bus_property_info_t = GioDBusPropertyInfoRecord.t
    where type d_bus_signal_info_t = GioDBusSignalInfoRecord.t =
  struct
    val getType_ = _import "g_dbus_interface_info_get_type" : unit -> GObjectType.FFI.val_;
    val cacheBuild_ = _import "g_dbus_interface_info_cache_build" : GioDBusInterfaceInfoRecord.FFI.notnull GioDBusInterfaceInfoRecord.FFI.p -> unit;
    val cacheRelease_ = _import "g_dbus_interface_info_cache_release" : GioDBusInterfaceInfoRecord.FFI.notnull GioDBusInterfaceInfoRecord.FFI.p -> unit;
    val lookupMethod_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_interface_info_lookup_method" :
              GioDBusInterfaceInfoRecord.FFI.notnull GioDBusInterfaceInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioDBusMethodInfoRecord.FFI.notnull GioDBusMethodInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val lookupProperty_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_interface_info_lookup_property" :
              GioDBusInterfaceInfoRecord.FFI.notnull GioDBusInterfaceInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioDBusPropertyInfoRecord.FFI.notnull GioDBusPropertyInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val lookupSignal_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_interface_info_lookup_signal" :
              GioDBusInterfaceInfoRecord.FFI.notnull GioDBusInterfaceInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioDBusSignalInfoRecord.FFI.notnull GioDBusSignalInfoRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GioDBusInterfaceInfoRecord.t
    type d_bus_method_info_t = GioDBusMethodInfoRecord.t
    type d_bus_property_info_t = GioDBusPropertyInfoRecord.t
    type d_bus_signal_info_t = GioDBusSignalInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun cacheBuild self = (GioDBusInterfaceInfoRecord.FFI.withPtr ---> I) cacheBuild_ self
    fun cacheRelease self = (GioDBusInterfaceInfoRecord.FFI.withPtr ---> I) cacheRelease_ self
    fun lookupMethod self name = (GioDBusInterfaceInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioDBusMethodInfoRecord.FFI.fromPtr false) lookupMethod_ (self & name)
    fun lookupProperty self name = (GioDBusInterfaceInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioDBusPropertyInfoRecord.FFI.fromPtr false) lookupProperty_ (self & name)
    fun lookupSignal self name = (GioDBusInterfaceInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioDBusSignalInfoRecord.FFI.fromPtr false) lookupSignal_ (self & name)
  end
