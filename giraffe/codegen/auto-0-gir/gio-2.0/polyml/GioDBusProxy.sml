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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_proxy_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newFinish_ = call (getSymbol "g_dbus_proxy_new_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusProxyClass.PolyML.cPtr)
      val newForBusFinish_ = call (getSymbol "g_dbus_proxy_new_for_bus_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusProxyClass.PolyML.cPtr)
      val newForBusSync_ =
        call (getSymbol "g_dbus_proxy_new_for_bus_sync")
          (
            GioBusType.PolyML.cVal
             &&> GioDBusProxyFlags.PolyML.cVal
             &&> GioDBusInterfaceInfoRecord.PolyML.cOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioDBusProxyClass.PolyML.cPtr
          )
      val newSync_ =
        call (getSymbol "g_dbus_proxy_new_sync")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> GioDBusProxyFlags.PolyML.cVal
             &&> GioDBusInterfaceInfoRecord.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioDBusProxyClass.PolyML.cPtr
          )
      val callFinish_ =
        call (getSymbol "g_dbus_proxy_call_finish")
          (
            GioDBusProxyClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val callSync_ =
        call (getSymbol "g_dbus_proxy_call_sync")
          (
            GioDBusProxyClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GioDBusCallFlags.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val callWithUnixFdListFinish_ =
        call (getSymbol "g_dbus_proxy_call_with_unix_fd_list_finish")
          (
            GioDBusProxyClass.PolyML.cPtr
             &&> GioUnixFDListClass.PolyML.cOutRef
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val callWithUnixFdListSync_ =
        call (getSymbol "g_dbus_proxy_call_with_unix_fd_list_sync")
          (
            GioDBusProxyClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GioDBusCallFlags.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GioUnixFDListClass.PolyML.cOptPtr
             &&> GioUnixFDListClass.PolyML.cOutRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val getCachedProperty_ = call (getSymbol "g_dbus_proxy_get_cached_property") (GioDBusProxyClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val getCachedPropertyNames_ = call (getSymbol "g_dbus_proxy_get_cached_property_names") (GioDBusProxyClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val getConnection_ = call (getSymbol "g_dbus_proxy_get_connection") (GioDBusProxyClass.PolyML.cPtr --> GioDBusConnectionClass.PolyML.cPtr)
      val getDefaultTimeout_ = call (getSymbol "g_dbus_proxy_get_default_timeout") (GioDBusProxyClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getFlags_ = call (getSymbol "g_dbus_proxy_get_flags") (GioDBusProxyClass.PolyML.cPtr --> GioDBusProxyFlags.PolyML.cVal)
      val getInterfaceInfo_ = call (getSymbol "g_dbus_proxy_get_interface_info") (GioDBusProxyClass.PolyML.cPtr --> GioDBusInterfaceInfoRecord.PolyML.cPtr)
      val getInterfaceName_ = call (getSymbol "g_dbus_proxy_get_interface_name") (GioDBusProxyClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (getSymbol "g_dbus_proxy_get_name") (GioDBusProxyClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNameOwner_ = call (getSymbol "g_dbus_proxy_get_name_owner") (GioDBusProxyClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getObjectPath_ = call (getSymbol "g_dbus_proxy_get_object_path") (GioDBusProxyClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setCachedProperty_ =
        call (getSymbol "g_dbus_proxy_set_cached_property")
          (
            GioDBusProxyClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             --> cVoid
          )
      val setDefaultTimeout_ = call (getSymbol "g_dbus_proxy_set_default_timeout") (GioDBusProxyClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setInterfaceInfo_ = call (getSymbol "g_dbus_proxy_set_interface_info") (GioDBusProxyClass.PolyML.cPtr &&> GioDBusInterfaceInfoRecord.PolyML.cOptPtr --> cVoid)
    end
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
         &&&> GInt.FFI.withVal
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
             &&&> GInt.FFI.withVal
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
    fun getConnection self = (GioDBusProxyClass.FFI.withPtr false ---> GioDBusConnectionClass.FFI.fromPtr false) getConnection_ self
    fun getDefaultTimeout self = (GioDBusProxyClass.FFI.withPtr false ---> GInt.FFI.fromVal) getDefaultTimeout_ self
    fun getFlags self = (GioDBusProxyClass.FFI.withPtr false ---> GioDBusProxyFlags.FFI.fromVal) getFlags_ self
    fun getInterfaceInfo self = (GioDBusProxyClass.FFI.withPtr false ---> GioDBusInterfaceInfoRecord.FFI.fromPtr true) getInterfaceInfo_ self
    fun getInterfaceName self = (GioDBusProxyClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getInterfaceName_ self
    fun getName self = (GioDBusProxyClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getNameOwner self = (GioDBusProxyClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getNameOwner_ self
    fun getObjectPath self = (GioDBusProxyClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getObjectPath_ self
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
    fun setDefaultTimeout self timeoutMsec = (GioDBusProxyClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setDefaultTimeout_ (self & timeoutMsec)
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
