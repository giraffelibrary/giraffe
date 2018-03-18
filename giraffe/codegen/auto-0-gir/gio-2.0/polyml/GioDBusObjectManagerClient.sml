structure GioDBusObjectManagerClient :>
  GIO_D_BUS_OBJECT_MANAGER_CLIENT
    where type 'a class = 'a GioDBusObjectManagerClientClass.class
    where type 'a async_initable_class = 'a GioAsyncInitableClass.class
    where type 'a d_bus_object_manager_class = 'a GioDBusObjectManagerClass.class
    where type 'a initable_class = 'a GioInitableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a d_bus_proxy_class = 'a GioDBusProxyClass.class
    where type 'a d_bus_object_proxy_class = 'a GioDBusObjectProxyClass.class
    where type bus_type_t = GioBusType.t
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type d_bus_object_manager_client_flags_t = GioDBusObjectManagerClientFlags.t =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_object_manager_client_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newFinish_ = call (getSymbol "g_dbus_object_manager_client_new_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusObjectManagerClientClass.PolyML.cPtr)
      val newForBusFinish_ = call (getSymbol "g_dbus_object_manager_client_new_for_bus_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusObjectManagerClientClass.PolyML.cPtr)
      val getConnection_ = call (getSymbol "g_dbus_object_manager_client_get_connection") (GioDBusObjectManagerClientClass.PolyML.cPtr --> GioDBusConnectionClass.PolyML.cPtr)
      val getFlags_ = call (getSymbol "g_dbus_object_manager_client_get_flags") (GioDBusObjectManagerClientClass.PolyML.cPtr --> GioDBusObjectManagerClientFlags.PolyML.cVal)
      val getName_ = call (getSymbol "g_dbus_object_manager_client_get_name") (GioDBusObjectManagerClientClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNameOwner_ = call (getSymbol "g_dbus_object_manager_client_get_name_owner") (GioDBusObjectManagerClientClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
    end
    type 'a class = 'a GioDBusObjectManagerClientClass.class
    type 'a async_initable_class = 'a GioAsyncInitableClass.class
    type 'a d_bus_object_manager_class = 'a GioDBusObjectManagerClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a d_bus_proxy_class = 'a GioDBusProxyClass.class
    type 'a d_bus_object_proxy_class = 'a GioDBusObjectProxyClass.class
    type bus_type_t = GioBusType.t
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type d_bus_object_manager_client_flags_t = GioDBusObjectManagerClientFlags.t
    type t = base class
    fun asAsyncInitable self = (GObjectObjectClass.FFI.withPtr ---> GioAsyncInitableClass.FFI.fromPtr false) I self
    fun asDBusObjectManager self = (GObjectObjectClass.FFI.withPtr ---> GioDBusObjectManagerClass.FFI.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.FFI.withPtr ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFinish res = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusObjectManagerClientClass.FFI.fromPtr true) newFinish_ (res & [])
    fun newForBusFinish res = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusObjectManagerClientClass.FFI.fromPtr true) newForBusFinish_ (res & [])
    fun getConnection self = (GioDBusObjectManagerClientClass.FFI.withPtr ---> GioDBusConnectionClass.FFI.fromPtr false) getConnection_ self
    fun getFlags self = (GioDBusObjectManagerClientClass.FFI.withPtr ---> GioDBusObjectManagerClientFlags.FFI.fromVal) getFlags_ self
    fun getName self = (GioDBusObjectManagerClientClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getNameOwner self = (GioDBusObjectManagerClientClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) getNameOwner_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceProxyPropertiesChangedSig f =
        signal "interface-proxy-properties-changed"
          (
            get 0w1 GioDBusObjectProxyClass.t
             &&&> get 0w2 GioDBusProxyClass.t
             &&&> get 0w3 GLibVariantRecord.t
             &&&> get 0w4 Utf8CVector.t
             ---> ret_void
          )
          (
            fn
              objectProxy
               & interfaceProxy
               & changedProperties
               & invalidatedProperties =>
                f
                  (
                    objectProxy,
                    interfaceProxy,
                    changedProperties,
                    invalidatedProperties
                  )
          )
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
                f
                  (
                    objectProxy,
                    interfaceProxy,
                    senderName,
                    signalName,
                    parameters
                  )
          )
    end
    local
      open Property
    in
      val busTypeProp = {new = fn x => new "bus-type" GioBusType.t x}
      val connectionProp =
        {
          get = fn x => get "connection" GioDBusConnectionClass.tOpt x,
          new = fn x => new "connection" GioDBusConnectionClass.tOpt x
        }
      val flagsProp =
        {
          get = fn x => get "flags" GioDBusObjectManagerClientFlags.t x,
          new = fn x => new "flags" GioDBusObjectManagerClientFlags.t x
        }
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          new = fn x => new "name" stringOpt x
        }
      val nameOwnerProp = {get = fn x => get "name-owner" stringOpt x}
      val objectPathProp =
        {
          get = fn x => get "object-path" stringOpt x,
          new = fn x => new "object-path" stringOpt x
        }
    end
  end
