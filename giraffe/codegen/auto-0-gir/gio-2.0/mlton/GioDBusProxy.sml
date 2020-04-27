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
    val newFinish_ = fn x1 & x2 => (_import "g_dbus_proxy_new_finish" : GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p;) (x1, x2)
    val newForBusFinish_ = fn x1 & x2 => (_import "g_dbus_proxy_new_for_bus_finish" : GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p;) (x1, x2)
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
               * unit GioDBusInterfaceInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p;
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
              GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p
               * GioDBusProxyFlags.FFI.val_
               * unit GioDBusInterfaceInfoRecord.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p;
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
              GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
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
              GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.FFI.p
               * GioDBusCallFlags.FFI.val_
               * GInt.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
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
              GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p
               * (unit, GioUnixFDListClass.FFI.notnull) GioUnixFDListClass.FFI.r
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
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
              GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.FFI.p
               * GioDBusCallFlags.FFI.val_
               * GInt.FFI.val_
               * unit GioUnixFDListClass.FFI.p
               * (unit, GioUnixFDListClass.FFI.notnull) GioUnixFDListClass.FFI.r
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
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
              GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getCachedPropertyNames_ = _import "g_dbus_proxy_get_cached_property_names" : GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p -> Utf8CPtrArray.FFI.notnull Utf8CPtrArray.FFI.out_p;
    val getConnection_ = _import "g_dbus_proxy_get_connection" : GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p -> GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p;
    val getDefaultTimeout_ = _import "g_dbus_proxy_get_default_timeout" : GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p -> GInt.FFI.val_;
    val getFlags_ = _import "g_dbus_proxy_get_flags" : GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p -> GioDBusProxyFlags.FFI.val_;
    val getInterfaceInfo_ = _import "g_dbus_proxy_get_interface_info" : GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p -> GioDBusInterfaceInfoRecord.FFI.notnull GioDBusInterfaceInfoRecord.FFI.p;
    val getInterfaceName_ = _import "g_dbus_proxy_get_interface_name" : GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getName_ = _import "g_dbus_proxy_get_name" : GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getNameOwner_ = _import "g_dbus_proxy_get_name_owner" : GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getObjectPath_ = _import "g_dbus_proxy_get_object_path" : GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val setCachedProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_dbus_proxy_set_cached_property" :
              GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setDefaultTimeout_ = fn x1 & x2 => (_import "g_dbus_proxy_set_default_timeout" : GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setInterfaceInfo_ = fn x1 & x2 => (_import "g_dbus_proxy_set_interface_info" : GioDBusProxyClass.FFI.notnull GioDBusProxyClass.FFI.p * unit GioDBusInterfaceInfoRecord.FFI.p -> unit;) (x1, x2)
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
    fun asAsyncInitable self = (GObjectObjectClass.FFI.withPtr ---> GioAsyncInitableClass.FFI.fromPtr false) I self
    fun asDBusInterface self = (GObjectObjectClass.FFI.withPtr ---> GioDBusInterfaceClass.FFI.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.FFI.withPtr ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFinish res = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusProxyClass.FFI.fromPtr true) newFinish_ (res & [])
    fun newForBusFinish res = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusProxyClass.FFI.fromPtr true) newForBusFinish_ (res & [])
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
         &&&> GioDBusInterfaceInfoRecord.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioDBusConnectionClass.FFI.withPtr
         &&&> GioDBusProxyFlags.FFI.withVal
         &&&> GioDBusInterfaceInfoRecord.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioDBusProxyClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
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
        GioDBusProxyClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         &&&> GioDBusCallFlags.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
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
            GioDBusProxyClass.FFI.withPtr
             &&&> GioUnixFDListClass.FFI.withRefOptPtr
             &&&> GioAsyncResultClass.FFI.withPtr
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
            GioDBusProxyClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GLibVariantRecord.FFI.withOptPtr
             &&&> GioDBusCallFlags.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GioUnixFDListClass.FFI.withOptPtr
             &&&> GioUnixFDListClass.FFI.withRefOptPtr
             &&&> GioCancellableClass.FFI.withOptPtr
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
    fun getCachedProperty self propertyName = (GioDBusProxyClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getCachedProperty_ (self & propertyName)
    fun getCachedPropertyNames self = (GioDBusProxyClass.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 2) getCachedPropertyNames_ self
    fun getConnection self = (GioDBusProxyClass.FFI.withPtr ---> GioDBusConnectionClass.FFI.fromPtr false) getConnection_ self
    fun getDefaultTimeout self = (GioDBusProxyClass.FFI.withPtr ---> GInt.FFI.fromVal) getDefaultTimeout_ self
    fun getFlags self = (GioDBusProxyClass.FFI.withPtr ---> GioDBusProxyFlags.FFI.fromVal) getFlags_ self
    fun getInterfaceInfo self = (GioDBusProxyClass.FFI.withPtr ---> GioDBusInterfaceInfoRecord.FFI.fromPtr true) getInterfaceInfo_ self
    fun getInterfaceName self = (GioDBusProxyClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getInterfaceName_ self
    fun getName self = (GioDBusProxyClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getNameOwner self = (GioDBusProxyClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getNameOwner_ self
    fun getObjectPath self = (GioDBusProxyClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getObjectPath_ self
    fun setCachedProperty self (propertyName, value) =
      (
        GioDBusProxyClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         ---> I
      )
        setCachedProperty_
        (
          self
           & propertyName
           & value
        )
    fun setDefaultTimeout self timeoutMsec = (GioDBusProxyClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setDefaultTimeout_ (self & timeoutMsec)
    fun setInterfaceInfo self info = (GioDBusProxyClass.FFI.withPtr &&&> GioDBusInterfaceInfoRecord.FFI.withOptPtr ---> I) setInterfaceInfo_ (self & info)
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
      open Property
    in
      val gBusTypeProp = {new = fn x => new "g-bus-type" GioBusType.t x}
      val gConnectionProp =
        {
          get = fn x => get "g-connection" GioDBusConnectionClass.tOpt x,
          new = fn x => new "g-connection" GioDBusConnectionClass.tOpt x
        }
      val gDefaultTimeoutProp =
        {
          get = fn x => get "g-default-timeout" int x,
          set = fn x => set "g-default-timeout" int x,
          new = fn x => new "g-default-timeout" int x
        }
      val gFlagsProp =
        {
          get = fn x => get "g-flags" GioDBusProxyFlags.t x,
          new = fn x => new "g-flags" GioDBusProxyFlags.t x
        }
      val gInterfaceInfoProp =
        {
          get = fn x => get "g-interface-info" GioDBusInterfaceInfoRecord.tOpt x,
          set = fn x => set "g-interface-info" GioDBusInterfaceInfoRecord.tOpt x,
          new = fn x => new "g-interface-info" GioDBusInterfaceInfoRecord.tOpt x
        }
      val gInterfaceNameProp =
        {
          get = fn x => get "g-interface-name" stringOpt x,
          new = fn x => new "g-interface-name" stringOpt x
        }
      val gNameProp =
        {
          get = fn x => get "g-name" stringOpt x,
          new = fn x => new "g-name" stringOpt x
        }
      val gNameOwnerProp = {get = fn x => get "g-name-owner" stringOpt x}
      val gObjectPathProp =
        {
          get = fn x => get "g-object-path" stringOpt x,
          new = fn x => new "g-object-path" stringOpt x
        }
    end
  end
