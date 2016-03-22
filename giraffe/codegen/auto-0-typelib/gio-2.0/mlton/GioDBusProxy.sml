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
    val getType_ = _import "g_dbus_proxy_get_type" : unit -> GObjectType.C.val_;
    val newFinish_ = fn x1 & x2 => (_import "g_dbus_proxy_new_finish" : GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p;) (x1, x2)
    val newForBusFinish_ = fn x1 & x2 => (_import "g_dbus_proxy_new_for_bus_finish" : GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p;) (x1, x2)
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
              GioBusType.C.val_
               * GioDBusProxyFlags.C.val_
               * unit GioDBusInterfaceInfoRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p;
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
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
               * GioDBusProxyFlags.C.val_
               * unit GioDBusInterfaceInfoRecord.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p;
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
              GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
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
              GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.C.p
               * GioDBusCallFlags.C.val_
               * FFI.Int32.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
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
              GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p
               * (unit, GioUnixFDListClass.C.notnull) GioUnixFDListClass.C.r
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
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
              GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.C.p
               * GioDBusCallFlags.C.val_
               * FFI.Int32.C.val_
               * unit GioUnixFDListClass.C.p
               * (unit, GioUnixFDListClass.C.notnull) GioUnixFDListClass.C.r
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
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
              GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getConnection_ = _import "g_dbus_proxy_get_connection" : GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p -> GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p;
    val getDefaultTimeout_ = _import "g_dbus_proxy_get_default_timeout" : GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p -> FFI.Int32.C.val_;
    val getFlags_ = _import "g_dbus_proxy_get_flags" : GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p -> GioDBusProxyFlags.C.val_;
    val getInterfaceInfo_ = _import "g_dbus_proxy_get_interface_info" : GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p -> GioDBusInterfaceInfoRecord.C.notnull GioDBusInterfaceInfoRecord.C.p;
    val getInterfaceName_ = _import "g_dbus_proxy_get_interface_name" : GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getName_ = _import "g_dbus_proxy_get_name" : GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getNameOwner_ = _import "g_dbus_proxy_get_name_owner" : GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getObjectPath_ = _import "g_dbus_proxy_get_object_path" : GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val setCachedProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_dbus_proxy_set_cached_property" :
              GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setDefaultTimeout_ = fn x1 & x2 => (_import "g_dbus_proxy_set_default_timeout" : GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setInterfaceInfo_ = fn x1 & x2 => (_import "g_dbus_proxy_set_interface_info" : GioDBusProxyClass.C.notnull GioDBusProxyClass.C.p * unit GioDBusInterfaceInfoRecord.C.p -> unit;) (x1, x2)
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
    fun asAsyncInitable self = (GObjectObjectClass.C.withPtr ---> GioAsyncInitableClass.C.fromPtr false) I self
    fun asDBusInterface self = (GObjectObjectClass.C.withPtr ---> GioDBusInterfaceClass.C.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFinish res = (GioAsyncResultClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusProxyClass.C.fromPtr true) newFinish_ (res & [])
    fun newForBusFinish res = (GioAsyncResultClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusProxyClass.C.fromPtr true) newForBusFinish_ (res & [])
    fun newForBusSync busType flags info name objectPath interfaceName cancellable =
      (
        GioBusType.C.withVal
         &&&> GioDBusProxyFlags.C.withVal
         &&&> GioDBusInterfaceInfoRecord.C.withOptPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDBusProxyClass.C.fromPtr true
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
    fun newSync connection flags info name objectPath interfaceName cancellable =
      (
        GioDBusConnectionClass.C.withPtr
         &&&> GioDBusProxyFlags.C.withVal
         &&&> GioDBusInterfaceInfoRecord.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDBusProxyClass.C.fromPtr true
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
        GioDBusProxyClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.C.fromPtr true
      )
        callFinish_
        (
          self
           & res
           & []
        )
    fun callSync self methodName parameters flags timeoutMsec cancellable =
      (
        GioDBusProxyClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibVariantRecord.C.withOptPtr
         &&&> GioDBusCallFlags.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.C.fromPtr true
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
            GioDBusProxyClass.C.withPtr
             &&&> GioUnixFDListClass.C.withRefOptPtr
             &&&> GioAsyncResultClass.C.withPtr
             &&&> GLibErrorRecord.handleError
             ---> GioUnixFDListClass.C.fromPtr true && GLibVariantRecord.C.fromPtr true
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
    fun callWithUnixFdListSync self methodName parameters flags timeoutMsec fdList cancellable =
      let
        val outFdList & retVal =
          (
            GioDBusProxyClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> GLibVariantRecord.C.withOptPtr
             &&&> GioDBusCallFlags.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> GioUnixFDListClass.C.withOptPtr
             &&&> GioUnixFDListClass.C.withRefOptPtr
             &&&> GioCancellableClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GioUnixFDListClass.C.fromPtr true && GLibVariantRecord.C.fromPtr true
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
    fun getCachedProperty self propertyName = (GioDBusProxyClass.C.withPtr &&&> Utf8.C.withPtr ---> GLibVariantRecord.C.fromPtr true) getCachedProperty_ (self & propertyName)
    fun getConnection self = (GioDBusProxyClass.C.withPtr ---> GioDBusConnectionClass.C.fromPtr false) getConnection_ self
    fun getDefaultTimeout self = (GioDBusProxyClass.C.withPtr ---> FFI.Int32.C.fromVal) getDefaultTimeout_ self
    fun getFlags self = (GioDBusProxyClass.C.withPtr ---> GioDBusProxyFlags.C.fromVal) getFlags_ self
    fun getInterfaceInfo self = (GioDBusProxyClass.C.withPtr ---> GioDBusInterfaceInfoRecord.C.fromPtr true) getInterfaceInfo_ self
    fun getInterfaceName self = (GioDBusProxyClass.C.withPtr ---> Utf8.C.fromPtr false) getInterfaceName_ self
    fun getName self = (GioDBusProxyClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getNameOwner self = (GioDBusProxyClass.C.withPtr ---> Utf8.C.fromPtr true) getNameOwner_ self
    fun getObjectPath self = (GioDBusProxyClass.C.withPtr ---> Utf8.C.fromPtr false) getObjectPath_ self
    fun setCachedProperty self propertyName value =
      (
        GioDBusProxyClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibVariantRecord.C.withOptPtr
         ---> I
      )
        setCachedProperty_
        (
          self
           & propertyName
           & value
        )
    fun setDefaultTimeout self timeoutMsec = (GioDBusProxyClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setDefaultTimeout_ (self & timeoutMsec)
    fun setInterfaceInfo self info = (GioDBusProxyClass.C.withPtr &&&> GioDBusInterfaceInfoRecord.C.withOptPtr ---> I) setInterfaceInfo_ (self & info)
    local
      open ClosureMarshal Signal
    in
      fun gSignalSig f =
        signal "g-signal"
          (
            get 0w1 string
             &&&> get 0w2 string
             &&&> get 0w3 GLibVariantRecord.t
             ---> ret_void
          )
          (
            fn
              senderName
               & signalName
               & parameters =>
                f senderName signalName parameters
          )
    end
    local
      open Property
    in
      val gBusTypeProp = {set = fn x => set "g-bus-type" GioBusType.t x}
      val gConnectionProp =
        {
          get = fn x => get "g-connection" GioDBusConnectionClass.tOpt x,
          set = fn x => set "g-connection" GioDBusConnectionClass.tOpt x
        }
      val gDefaultTimeoutProp =
        {
          get = fn x => get "g-default-timeout" int x,
          set = fn x => set "g-default-timeout" int x
        }
      val gFlagsProp =
        {
          get = fn x => get "g-flags" GioDBusProxyFlags.t x,
          set = fn x => set "g-flags" GioDBusProxyFlags.t x
        }
      val gInterfaceInfoProp =
        {
          get = fn x => get "g-interface-info" GioDBusInterfaceInfoRecord.tOpt x,
          set = fn x => set "g-interface-info" GioDBusInterfaceInfoRecord.tOpt x
        }
      val gInterfaceNameProp =
        {
          get = fn x => get "g-interface-name" stringOpt x,
          set = fn x => set "g-interface-name" stringOpt x
        }
      val gNameProp =
        {
          get = fn x => get "g-name" stringOpt x,
          set = fn x => set "g-name" stringOpt x
        }
      val gNameOwnerProp = {get = fn x => get "g-name-owner" stringOpt x}
      val gObjectPathProp =
        {
          get = fn x => get "g-object-path" stringOpt x,
          set = fn x => set "g-object-path" stringOpt x
        }
    end
  end
