structure GioDBusInterfaceInfo :>
  GIO_D_BUS_INTERFACE_INFO
    where type t = GioDBusInterfaceInfoRecord.t
    where type d_bus_method_info_t = GioDBusMethodInfoRecord.t
    where type d_bus_property_info_t = GioDBusPropertyInfoRecord.t
    where type d_bus_signal_info_t = GioDBusSignalInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_interface_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val cacheBuild_ = call (getSymbol "g_dbus_interface_info_cache_build") (GioDBusInterfaceInfoRecord.PolyML.cPtr --> cVoid)
      val cacheRelease_ = call (getSymbol "g_dbus_interface_info_cache_release") (GioDBusInterfaceInfoRecord.PolyML.cPtr --> cVoid)
      val generateXml_ =
        call (getSymbol "g_dbus_interface_info_generate_xml")
          (
            GioDBusInterfaceInfoRecord.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GLibStringRecord.PolyML.cPtr
             --> cVoid
          )
      val lookupMethod_ = call (getSymbol "g_dbus_interface_info_lookup_method") (GioDBusInterfaceInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioDBusMethodInfoRecord.PolyML.cPtr)
      val lookupProperty_ = call (getSymbol "g_dbus_interface_info_lookup_property") (GioDBusInterfaceInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioDBusPropertyInfoRecord.PolyML.cPtr)
      val lookupSignal_ = call (getSymbol "g_dbus_interface_info_lookup_signal") (GioDBusInterfaceInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioDBusSignalInfoRecord.PolyML.cPtr)
    end
    type t = GioDBusInterfaceInfoRecord.t
    type d_bus_method_info_t = GioDBusMethodInfoRecord.t
    type d_bus_property_info_t = GioDBusPropertyInfoRecord.t
    type d_bus_signal_info_t = GioDBusSignalInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun cacheBuild self = (GioDBusInterfaceInfoRecord.FFI.withPtr false ---> I) cacheBuild_ self
    fun cacheRelease self = (GioDBusInterfaceInfoRecord.FFI.withPtr false ---> I) cacheRelease_ self
    fun generateXml self (indent, stringBuilder) =
      (
        GioDBusInterfaceInfoRecord.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GLibStringRecord.FFI.withPtr false
         ---> I
      )
        generateXml_
        (
          self
           & indent
           & stringBuilder
        )
    fun lookupMethod self name = (GioDBusInterfaceInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioDBusMethodInfoRecord.FFI.fromPtr false) lookupMethod_ (self & name) before GioDBusInterfaceInfoRecord.FFI.touchPtr self before Utf8.FFI.touchPtr name
    fun lookupProperty self name = (GioDBusInterfaceInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioDBusPropertyInfoRecord.FFI.fromPtr false) lookupProperty_ (self & name) before GioDBusInterfaceInfoRecord.FFI.touchPtr self before Utf8.FFI.touchPtr name
    fun lookupSignal self name = (GioDBusInterfaceInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioDBusSignalInfoRecord.FFI.fromPtr false) lookupSignal_ (self & name) before GioDBusInterfaceInfoRecord.FFI.touchPtr self before Utf8.FFI.touchPtr name
  end
