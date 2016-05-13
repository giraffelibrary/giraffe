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
      val getType_ = call (load_sym libgio "g_dbus_proxy_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val newFinish_ = call (load_sym libgio "g_dbus_proxy_new_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusProxyClass.PolyML.cPtr)
      val newForBusFinish_ = call (load_sym libgio "g_dbus_proxy_new_for_bus_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusProxyClass.PolyML.cPtr)
      val newForBusSync_ =
        call (load_sym libgio "g_dbus_proxy_new_for_bus_sync")
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
        call (load_sym libgio "g_dbus_proxy_new_sync")
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
        call (load_sym libgio "g_dbus_proxy_call_finish")
          (
            GioDBusProxyClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val callSync_ =
        call (load_sym libgio "g_dbus_proxy_call_sync")
          (
            GioDBusProxyClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GioDBusCallFlags.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val callWithUnixFdListFinish_ =
        call (load_sym libgio "g_dbus_proxy_call_with_unix_fd_list_finish")
          (
            GioDBusProxyClass.PolyML.cPtr
             &&> GioUnixFDListClass.PolyML.cOutRef
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val callWithUnixFdListSync_ =
        call (load_sym libgio "g_dbus_proxy_call_with_unix_fd_list_sync")
          (
            GioDBusProxyClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GioDBusCallFlags.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> GioUnixFDListClass.PolyML.cOptPtr
             &&> GioUnixFDListClass.PolyML.cOutRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val getCachedProperty_ = call (load_sym libgio "g_dbus_proxy_get_cached_property") (GioDBusProxyClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GLibVariantRecord.PolyML.cPtr)
      val getConnection_ = call (load_sym libgio "g_dbus_proxy_get_connection") (GioDBusProxyClass.PolyML.cPtr --> GioDBusConnectionClass.PolyML.cPtr)
      val getDefaultTimeout_ = call (load_sym libgio "g_dbus_proxy_get_default_timeout") (GioDBusProxyClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getFlags_ = call (load_sym libgio "g_dbus_proxy_get_flags") (GioDBusProxyClass.PolyML.cPtr --> GioDBusProxyFlags.PolyML.cVal)
      val getInterfaceInfo_ = call (load_sym libgio "g_dbus_proxy_get_interface_info") (GioDBusProxyClass.PolyML.cPtr --> GioDBusInterfaceInfoRecord.PolyML.cPtr)
      val getInterfaceName_ = call (load_sym libgio "g_dbus_proxy_get_interface_name") (GioDBusProxyClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (load_sym libgio "g_dbus_proxy_get_name") (GioDBusProxyClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNameOwner_ = call (load_sym libgio "g_dbus_proxy_get_name_owner") (GioDBusProxyClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getObjectPath_ = call (load_sym libgio "g_dbus_proxy_get_object_path") (GioDBusProxyClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setCachedProperty_ =
        call (load_sym libgio "g_dbus_proxy_set_cached_property")
          (
            GioDBusProxyClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             --> PolyMLFFI.cVoid
          )
      val setDefaultTimeout_ = call (load_sym libgio "g_dbus_proxy_set_default_timeout") (GioDBusProxyClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> PolyMLFFI.cVoid)
      val setInterfaceInfo_ = call (load_sym libgio "g_dbus_proxy_set_interface_info") (GioDBusProxyClass.PolyML.cPtr &&> GioDBusInterfaceInfoRecord.PolyML.cOptPtr --> PolyMLFFI.cVoid)
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
         &&&> FFI.Int.C.withVal
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
             &&&> FFI.Int.C.withVal
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
    fun getDefaultTimeout self = (GioDBusProxyClass.C.withPtr ---> FFI.Int.C.fromVal) getDefaultTimeout_ self
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
    fun setDefaultTimeout self timeoutMsec = (GioDBusProxyClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setDefaultTimeout_ (self & timeoutMsec)
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
