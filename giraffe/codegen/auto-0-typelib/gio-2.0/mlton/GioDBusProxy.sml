structure GioDBusProxy :>
  GIO_D_BUS_PROXY
    where type 'a class = 'a GioDBusProxyClass.class
    where type 'a async_initable_class = 'a GioAsyncInitableClass.class
    where type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    where type 'a initable_class = 'a GioInitableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    where type d_bus_call_flags_t = GioDBusCallFlags.t
    where type bus_type_t = GioBusType.t
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type d_bus_proxy_flags_t = GioDBusProxyFlags.t
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t =
  struct
    val getType_ = _import "g_dbus_proxy_get_type" : unit -> GObjectType.FFI.val_;
    val newFinish_ = fn x1 & x2 => (_import "g_dbus_proxy_new_finish" : GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p;) (x1, x2)
    val newForBusFinish_ = fn x1 & x2 => (_import "g_dbus_proxy_new_for_bus_finish" : GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p;) (x1, x2)
    val newForBusSync_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10
         & x11 =>
          (
            _import "mlton_g_dbus_proxy_new_for_bus_sync" :
              GioBusType.FFI.val_
               * GioDBusProxyFlags.FFI.val_
               * GioDBusInterfaceInfoRecord.FFI.opt GioDBusInterfaceInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11
            )
    val newSync_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10
         & x11 =>
          (
            _import "mlton_g_dbus_proxy_new_sync" :
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * GioDBusProxyFlags.FFI.val_
               * GioDBusInterfaceInfoRecord.FFI.opt GioDBusInterfaceInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11
            )
    val callFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_proxy_call_finish" :
              GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val callSync_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_g_dbus_proxy_call_sync" :
              GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               * GioDBusCallFlags.FFI.val_
               * GInt32.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val callWithUnixFdListFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_dbus_proxy_call_with_unix_fd_list_finish" :
              GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p
               * (GioUnixFDListClass.FFI.opt, GioUnixFDListClass.FFI.non_opt) GioUnixFDListClass.FFI.r
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val callWithUnixFdListSync_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_g_dbus_proxy_call_with_unix_fd_list_sync" :
              GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               * GioDBusCallFlags.FFI.val_
               * GInt32.FFI.val_
               * GioUnixFDListClass.FFI.opt GioUnixFDListClass.FFI.p
               * (GioUnixFDListClass.FFI.opt, GioUnixFDListClass.FFI.non_opt) GioUnixFDListClass.FFI.r
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val getCachedProperty_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_dbus_proxy_get_cached_property" :
              GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getCachedPropertyNames_ = _import "g_dbus_proxy_get_cached_property_names" : GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getConnection_ = _import "g_dbus_proxy_get_connection" : GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p -> GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p;
    val getDefaultTimeout_ = _import "g_dbus_proxy_get_default_timeout" : GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p -> GInt32.FFI.val_;
    val getFlags_ = _import "g_dbus_proxy_get_flags" : GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p -> GioDBusProxyFlags.FFI.val_;
    val getInterfaceInfo_ = _import "g_dbus_proxy_get_interface_info" : GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p -> GioDBusInterfaceInfoRecord.FFI.non_opt GioDBusInterfaceInfoRecord.FFI.p;
    val getInterfaceName_ = _import "g_dbus_proxy_get_interface_name" : GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getName_ = _import "g_dbus_proxy_get_name" : GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getNameOwner_ = _import "g_dbus_proxy_get_name_owner" : GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getObjectPath_ = _import "g_dbus_proxy_get_object_path" : GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val setCachedProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_dbus_proxy_set_cached_property" :
              GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setDefaultTimeout_ = fn x1 & x2 => (_import "g_dbus_proxy_set_default_timeout" : GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setInterfaceInfo_ = fn x1 & x2 => (_import "g_dbus_proxy_set_interface_info" : GioDBusProxyClass.FFI.non_opt GioDBusProxyClass.FFI.p * GioDBusInterfaceInfoRecord.FFI.opt GioDBusInterfaceInfoRecord.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GioDBusProxyClass.class
    type 'a async_initable_class = 'a GioAsyncInitableClass.class
    type 'a d_bus_interface_class = 'a GioDBusInterfaceClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type d_bus_call_flags_t = GioDBusCallFlags.t
    type bus_type_t = GioBusType.t
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type d_bus_proxy_flags_t = GioDBusProxyFlags.t
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    type t = base class
    fun asAsyncInitable self = (GObjectObjectClass.FFI.withPtr false ---> GioAsyncInitableClass.FFI.fromPtr false) I self
    fun asDBusInterface self = (GObjectObjectClass.FFI.withPtr false ---> GioDBusInterfaceClass.FFI.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.FFI.withPtr false ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFinish res = (GioAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GioDBusProxyClass.FFI.fromPtr true) newFinish_ (res & [])
    fun newForBusFinish res = (GioAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GioDBusProxyClass.FFI.fromPtr true) newForBusFinish_ (res & [])
    fun newForBusSync
      (
        busType,
        flags,
        info,
        name,
        objectPath,
        interfaceName,
        cancellable
      ) =
      (
        GioBusType.FFI.withVal
         &&&> GioDBusProxyFlags.FFI.withVal
         &&&> GioDBusInterfaceInfoRecord.FFI.withOptPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioDBusProxyClass.FFI.fromPtr true
      )
        newForBusSync_
        (
          busType
           & flags
           & info
           & name
           & objectPath
           & interfaceName
           & cancellable
           & []
        )
    fun newSync
      (
        connection,
        flags,
        info,
        name,
        objectPath,
        interfaceName,
        cancellable
      ) =
      (
        GioDBusConnectionClass.FFI.withPtr false
         &&&> GioDBusProxyFlags.FFI.withVal
         &&&> GioDBusInterfaceInfoRecord.FFI.withOptPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioDBusProxyClass.FFI.fromPtr true
      )
        newSync_
        (
          connection
           & flags
           & info
           & name
           & objectPath
           & interfaceName
           & cancellable
           & []
        )
    fun callFinish self res =
      (
        GioDBusProxyClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        callFinish_
        (
          self
           & res
           & []
        )
    fun callSync
      self
      (
        methodName,
        parameters,
        flags,
        timeoutMsec,
        cancellable
      ) =
      (
        GioDBusProxyClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantRecord.FFI.withOptPtr false
         &&&> GioDBusCallFlags.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        callSync_
        (
          self
           & methodName
           & parameters
           & flags
           & timeoutMsec
           & cancellable
           & []
        )
    fun callWithUnixFdListFinish self res =
      let
        val outFdList & retVal =
          (
            GioDBusProxyClass.FFI.withPtr false
             &&&> GioUnixFDListClass.FFI.withRefOptPtr true
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GLibErrorRecord.handleError
             ---> GioUnixFDListClass.FFI.fromPtr true && GLibVariantRecord.FFI.fromPtr true
          )
            callWithUnixFdListFinish_
            (
              self
               & NONE
               & res
               & []
            )
      in
        (retVal, outFdList)
      end
    fun callWithUnixFdListSync
      self
      (
        methodName,
        parameters,
        flags,
        timeoutMsec,
        fdList,
        cancellable
      ) =
      let
        val outFdList & retVal =
          (
            GioDBusProxyClass.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GLibVariantRecord.FFI.withOptPtr false
             &&&> GioDBusCallFlags.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GioUnixFDListClass.FFI.withOptPtr false
             &&&> GioUnixFDListClass.FFI.withRefOptPtr true
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GioUnixFDListClass.FFI.fromPtr true && GLibVariantRecord.FFI.fromPtr true
          )
            callWithUnixFdListSync_
            (
              self
               & methodName
               & parameters
               & flags
               & timeoutMsec
               & fdList
               & NONE
               & cancellable
               & []
            )
      in
        (retVal, outFdList)
      end
    fun getCachedProperty self propertyName = (GioDBusProxyClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GLibVariantRecord.FFI.fromPtr true) getCachedProperty_ (self & propertyName)
    fun getCachedPropertyNames self = (GioDBusProxyClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) getCachedPropertyNames_ self
    fun getConnection self = (GioDBusProxyClass.FFI.withPtr false ---> GioDBusConnectionClass.FFI.fromPtr false) getConnection_ self before GioDBusProxyClass.FFI.touchPtr self
    fun getDefaultTimeout self = (GioDBusProxyClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getDefaultTimeout_ self
    fun getFlags self = (GioDBusProxyClass.FFI.withPtr false ---> GioDBusProxyFlags.FFI.fromVal) getFlags_ self
    fun getInterfaceInfo self = (GioDBusProxyClass.FFI.withPtr false ---> GioDBusInterfaceInfoRecord.FFI.fromPtr true) getInterfaceInfo_ self
    fun getInterfaceName self = (GioDBusProxyClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getInterfaceName_ self before GioDBusProxyClass.FFI.touchPtr self
    fun getName self = (GioDBusProxyClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GioDBusProxyClass.FFI.touchPtr self
    fun getNameOwner self = (GioDBusProxyClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getNameOwner_ self
    fun getObjectPath self = (GioDBusProxyClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getObjectPath_ self before GioDBusProxyClass.FFI.touchPtr self
    fun setCachedProperty self (propertyName, value) =
      (
        GioDBusProxyClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantRecord.FFI.withOptPtr false
         ---> I
      )
        setCachedProperty_
        (
          self
           & propertyName
           & value
        )
    fun setDefaultTimeout self timeoutMsec = (GioDBusProxyClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setDefaultTimeout_ (self & timeoutMsec)
    fun setInterfaceInfo self info = (GioDBusProxyClass.FFI.withPtr false &&&> GioDBusInterfaceInfoRecord.FFI.withOptPtr false ---> I) setInterfaceInfo_ (self & info)
    local
      open ClosureMarshal Signal
    in
      fun gPropertiesChangedSig f = signal "g-properties-changed" (get 0w1 GLibVariantRecord.t &&&> get 0w2 Utf8CPtrArray.t ---> ret_void) (fn changedProperties & invalidatedProperties => f (changedProperties, invalidatedProperties))
      fun gSignalSig f =
        signal "g-signal"
          (
            get 0w1 stringOpt
             &&&> get 0w2 string
             &&&> get 0w3 GLibVariantRecord.t
             ---> ret_void
          )
          (
            fn
              senderName
               & signalName
               & parameters =>
                f
                  (
                    senderName,
                    signalName,
                    parameters
                  )
          )
    end
    local
      open ValueAccessor
    in
      val gBusTypeProp =
        {
          name = "g-bus-type",
          gtype = fn () => C.gtype GioBusType.t (),
          get = ignore,
          set = ignore,
          init = fn x => C.set GioBusType.t x
        }
      val gConnectionProp =
        {
          name = "g-connection",
          gtype = fn () => C.gtype GioDBusConnectionClass.tOpt (),
          get = fn x => fn () => C.get GioDBusConnectionClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioDBusConnectionClass.tOpt x
        }
      val gDefaultTimeoutProp =
        {
          name = "g-default-timeout",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val gFlagsProp =
        {
          name = "g-flags",
          gtype = fn () => C.gtype GioDBusProxyFlags.t (),
          get = fn x => fn () => C.get GioDBusProxyFlags.t x,
          set = ignore,
          init = fn x => C.set GioDBusProxyFlags.t x
        }
      val gInterfaceInfoProp =
        {
          name = "g-interface-info",
          gtype = fn () => C.gtype GioDBusInterfaceInfoRecord.tOpt (),
          get = fn x => fn () => C.get GioDBusInterfaceInfoRecord.tOpt x,
          set = fn x => C.set GioDBusInterfaceInfoRecord.tOpt x,
          init = fn x => C.set GioDBusInterfaceInfoRecord.tOpt x
        }
      val gInterfaceNameProp =
        {
          name = "g-interface-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val gNameProp =
        {
          name = "g-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val gNameOwnerProp =
        {
          name = "g-name-owner",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val gObjectPathProp =
        {
          name = "g-object-path",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
