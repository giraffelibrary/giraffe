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
    val getType_ = _import "g_dbus_object_manager_client_get_type" : unit -> GObjectType.FFI.val_;
    val newFinish_ = fn x1 & x2 => (_import "g_dbus_object_manager_client_new_finish" : GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GioDBusObjectManagerClientClass.FFI.non_opt GioDBusObjectManagerClientClass.FFI.p;) (x1, x2)
    val newForBusFinish_ = fn x1 & x2 => (_import "g_dbus_object_manager_client_new_for_bus_finish" : GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GioDBusObjectManagerClientClass.FFI.non_opt GioDBusObjectManagerClientClass.FFI.p;) (x1, x2)
    val getConnection_ = _import "g_dbus_object_manager_client_get_connection" : GioDBusObjectManagerClientClass.FFI.non_opt GioDBusObjectManagerClientClass.FFI.p -> GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p;
    val getFlags_ = _import "g_dbus_object_manager_client_get_flags" : GioDBusObjectManagerClientClass.FFI.non_opt GioDBusObjectManagerClientClass.FFI.p -> GioDBusObjectManagerClientFlags.FFI.val_;
    val getName_ = _import "g_dbus_object_manager_client_get_name" : GioDBusObjectManagerClientClass.FFI.non_opt GioDBusObjectManagerClientClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getNameOwner_ = _import "g_dbus_object_manager_client_get_name_owner" : GioDBusObjectManagerClientClass.FFI.non_opt GioDBusObjectManagerClientClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
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
    fun asAsyncInitable self = (GObjectObjectClass.FFI.withPtr false ---> GioAsyncInitableClass.FFI.fromPtr false) I self
    fun asDBusObjectManager self = (GObjectObjectClass.FFI.withPtr false ---> GioDBusObjectManagerClass.FFI.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.FFI.withPtr false ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFinish res = (GioAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GioDBusObjectManagerClientClass.FFI.fromPtr true) newFinish_ (res & [])
    fun newForBusFinish res = (GioAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GioDBusObjectManagerClientClass.FFI.fromPtr true) newForBusFinish_ (res & [])
    fun getConnection self = (GioDBusObjectManagerClientClass.FFI.withPtr false ---> GioDBusConnectionClass.FFI.fromPtr false) getConnection_ self before GioDBusObjectManagerClientClass.FFI.touchPtr self
    fun getFlags self = (GioDBusObjectManagerClientClass.FFI.withPtr false ---> GioDBusObjectManagerClientFlags.FFI.fromVal) getFlags_ self
    fun getName self = (GioDBusObjectManagerClientClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GioDBusObjectManagerClientClass.FFI.touchPtr self
    fun getNameOwner self = (GioDBusObjectManagerClientClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getNameOwner_ self
    local
      open ClosureMarshal Signal
    in
      fun interfaceProxyPropertiesChangedSig f =
        signal "interface-proxy-properties-changed"
          (
            get 0w1 GioDBusObjectProxyClass.t
             &&&> get 0w2 GioDBusProxyClass.t
             &&&> get 0w3 GLibVariantRecord.t
             &&&> get 0w4 Utf8CPtrArray.t
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
      open ValueAccessor
    in
      val busTypeProp =
        {
          name = "bus-type",
          gtype = fn () => C.gtype GioBusType.t (),
          get = ignore,
          set = ignore,
          init = fn x => C.set GioBusType.t x
        }
      val connectionProp =
        {
          name = "connection",
          gtype = fn () => C.gtype GioDBusConnectionClass.tOpt (),
          get = fn x => fn () => C.get GioDBusConnectionClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioDBusConnectionClass.tOpt x
        }
      val flagsProp =
        {
          name = "flags",
          gtype = fn () => C.gtype GioDBusObjectManagerClientFlags.t (),
          get = fn x => fn () => C.get GioDBusObjectManagerClientFlags.t x,
          set = ignore,
          init = fn x => C.set GioDBusObjectManagerClientFlags.t x
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val nameOwnerProp =
        {
          name = "name-owner",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val objectPathProp =
        {
          name = "object-path",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
