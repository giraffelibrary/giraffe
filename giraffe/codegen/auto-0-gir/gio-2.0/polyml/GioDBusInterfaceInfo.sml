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
      val getType_ = call (load_sym libgio "g_dbus_interface_info_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val cacheBuild_ = call (load_sym libgio "g_dbus_interface_info_cache_build") (GioDBusInterfaceInfoRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val cacheRelease_ = call (load_sym libgio "g_dbus_interface_info_cache_release") (GioDBusInterfaceInfoRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val generateXml_ =
        call (load_sym libgio "g_dbus_interface_info_generate_xml")
          (
            GioDBusInterfaceInfoRecord.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GLibStringRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val lookupMethod_ = call (load_sym libgio "g_dbus_interface_info_lookup_method") (GioDBusInterfaceInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioDBusMethodInfoRecord.PolyML.cPtr)
      val lookupProperty_ = call (load_sym libgio "g_dbus_interface_info_lookup_property") (GioDBusInterfaceInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioDBusPropertyInfoRecord.PolyML.cPtr)
      val lookupSignal_ = call (load_sym libgio "g_dbus_interface_info_lookup_signal") (GioDBusInterfaceInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioDBusSignalInfoRecord.PolyML.cPtr)
    end
    type t = GioDBusInterfaceInfoRecord.t
    type d_bus_method_info_t = GioDBusMethodInfoRecord.t
    type d_bus_property_info_t = GioDBusPropertyInfoRecord.t
    type d_bus_signal_info_t = GioDBusSignalInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun cacheBuild self = (GioDBusInterfaceInfoRecord.FFI.withPtr ---> I) cacheBuild_ self
    fun cacheRelease self = (GioDBusInterfaceInfoRecord.FFI.withPtr ---> I) cacheRelease_ self
    fun generateXml self indent stringBuilder =
      (
        GioDBusInterfaceInfoRecord.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GLibStringRecord.FFI.withPtr
         ---> I
      )
        generateXml_
        (
          self
           & indent
           & stringBuilder
        )
    fun lookupMethod self name = (GioDBusInterfaceInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioDBusMethodInfoRecord.FFI.fromPtr false) lookupMethod_ (self & name)
    fun lookupProperty self name = (GioDBusInterfaceInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioDBusPropertyInfoRecord.FFI.fromPtr false) lookupProperty_ (self & name)
    fun lookupSignal self name = (GioDBusInterfaceInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioDBusSignalInfoRecord.FFI.fromPtr false) lookupSignal_ (self & name)
  end
