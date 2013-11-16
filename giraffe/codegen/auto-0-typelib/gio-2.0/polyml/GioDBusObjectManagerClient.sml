structure GioDBusObjectManagerClient :>
  GIO_D_BUS_OBJECT_MANAGER_CLIENT
    where type 'a class_t = 'a GioDBusObjectManagerClientClass.t
    where type 'a asyncinitableclass_t = 'a GioAsyncInitableClass.t
    where type 'a dbusobjectmanagerclass_t = 'a GioDBusObjectManagerClass.t
    where type 'a initableclass_t = 'a GioInitableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    where type 'a dbusproxyclass_t = 'a GioDBusProxyClass.t
    where type 'a dbusobjectproxyclass_t = 'a GioDBusObjectProxyClass.t
    where type bustype_t = GioBusType.t
    where type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    where type dbusobjectmanagerclientflags_t = GioDBusObjectManagerClientFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_object_manager_client_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newFinish_ = call (load_sym libgio "g_dbus_object_manager_client_new_finish") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val newForBusFinish_ = call (load_sym libgio "g_dbus_object_manager_client_new_for_bus_finish") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val getConnection_ = call (load_sym libgio "g_dbus_object_manager_client_get_connection") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFlags_ = call (load_sym libgio "g_dbus_object_manager_client_get_flags") (GObjectObjectClass.PolyML.PTR --> GioDBusObjectManagerClientFlags.PolyML.VAL)
      val getName_ = call (load_sym libgio "g_dbus_object_manager_client_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getNameOwner_ = call (load_sym libgio "g_dbus_object_manager_client_get_name_owner") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
    end
    type 'a class_t = 'a GioDBusObjectManagerClientClass.t
    type 'a asyncinitableclass_t = 'a GioAsyncInitableClass.t
    type 'a dbusobjectmanagerclass_t = 'a GioDBusObjectManagerClass.t
    type 'a initableclass_t = 'a GioInitableClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    type 'a dbusproxyclass_t = 'a GioDBusProxyClass.t
    type 'a dbusobjectproxyclass_t = 'a GioDBusObjectProxyClass.t
    type bustype_t = GioBusType.t
    type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    type dbusobjectmanagerclientflags_t = GioDBusObjectManagerClientFlags.t
    fun asAsyncInitable self = (GObjectObjectClass.C.withPtr ---> GioAsyncInitableClass.C.fromPtr false) I self
    fun asDBusObjectManager self = (GObjectObjectClass.C.withPtr ---> GioDBusObjectManagerClass.C.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFinish res = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioDBusObjectManagerClientClass.C.fromPtr true) newFinish_ (res & [])
    fun newForBusFinish res = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioDBusObjectManagerClientClass.C.fromPtr true) newForBusFinish_ (res & [])
    fun getConnection self = (GObjectObjectClass.C.withPtr ---> GioDBusConnectionClass.C.fromPtr false) getConnection_ self
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GioDBusObjectManagerClientFlags.C.fromVal) getFlags_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getNameOwner self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getNameOwner_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceProxySignalSig f =
        signal "interface-proxy-signal"
          (
            get 0w1 GioDBusObjectProxyClass.t
             &&&> get 0w2 GioDBusProxyClass.t
             &&&> get 0w3 string
             &&&> get 0w4 string
             &&&> get 0w5 GLibVariantRecord.t
             ---> ret_void
          )
          (
            fn
              objectProxy
               & interfaceProxy
               & senderName
               & signalName
               & parameters =>
                f objectProxy interfaceProxy senderName signalName parameters
          )
    end
    local
      open Property
    in
      val busTypeProp = {set = fn x => set "bus-type" GioBusType.t x}
      val connectionProp =
        {
          get = fn x => get "connection" GioDBusConnectionClass.tOpt x,
          set = fn x => set "connection" GioDBusConnectionClass.tOpt x
        }
      val flagsProp =
        {
          get = fn x => get "flags" GioDBusObjectManagerClientFlags.t x,
          set = fn x => set "flags" GioDBusObjectManagerClientFlags.t x
        }
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x
        }
      val nameOwnerProp = {get = fn x => get "name-owner" stringOpt x}
      val objectPathProp =
        {
          get = fn x => get "object-path" stringOpt x,
          set = fn x => set "object-path" stringOpt x
        }
    end
  end
