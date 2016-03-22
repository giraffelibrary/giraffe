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
    val getType_ = _import "g_dbus_object_manager_client_get_type" : unit -> GObjectType.C.val_;
    val newFinish_ = fn x1 & x2 => (_import "g_dbus_object_manager_client_new_finish" : GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GioDBusObjectManagerClientClass.C.notnull GioDBusObjectManagerClientClass.C.p;) (x1, x2)
    val newForBusFinish_ = fn x1 & x2 => (_import "g_dbus_object_manager_client_new_for_bus_finish" : GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GioDBusObjectManagerClientClass.C.notnull GioDBusObjectManagerClientClass.C.p;) (x1, x2)
    val getConnection_ = _import "g_dbus_object_manager_client_get_connection" : GioDBusObjectManagerClientClass.C.notnull GioDBusObjectManagerClientClass.C.p -> GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p;
    val getFlags_ = _import "g_dbus_object_manager_client_get_flags" : GioDBusObjectManagerClientClass.C.notnull GioDBusObjectManagerClientClass.C.p -> GioDBusObjectManagerClientFlags.C.val_;
    val getName_ = _import "g_dbus_object_manager_client_get_name" : GioDBusObjectManagerClientClass.C.notnull GioDBusObjectManagerClientClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getNameOwner_ = _import "g_dbus_object_manager_client_get_name_owner" : GioDBusObjectManagerClientClass.C.notnull GioDBusObjectManagerClientClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
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
    fun asAsyncInitable self = (GObjectObjectClass.C.withPtr ---> GioAsyncInitableClass.C.fromPtr false) I self
    fun asDBusObjectManager self = (GObjectObjectClass.C.withPtr ---> GioDBusObjectManagerClass.C.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFinish res = (GioAsyncResultClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusObjectManagerClientClass.C.fromPtr true) newFinish_ (res & [])
    fun newForBusFinish res = (GioAsyncResultClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusObjectManagerClientClass.C.fromPtr true) newForBusFinish_ (res & [])
    fun getConnection self = (GioDBusObjectManagerClientClass.C.withPtr ---> GioDBusConnectionClass.C.fromPtr false) getConnection_ self
    fun getFlags self = (GioDBusObjectManagerClientClass.C.withPtr ---> GioDBusObjectManagerClientFlags.C.fromVal) getFlags_ self
    fun getName self = (GioDBusObjectManagerClientClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getNameOwner self = (GioDBusObjectManagerClientClass.C.withPtr ---> Utf8.C.fromPtr true) getNameOwner_ self
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
