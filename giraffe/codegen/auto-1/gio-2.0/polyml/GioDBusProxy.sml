structure GioDBusProxy :>
  GIO_D_BUS_PROXY
    where type 'a class_t = 'a GioDBusProxyClass.t
    where type 'a asyncinitableclass_t = 'a GioAsyncInitableClass.t
    where type 'a dbusinterfaceclass_t = 'a GioDBusInterfaceClass.t
    where type 'a initableclass_t = 'a GioInitableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a unixfdlistclass_t = 'a GioUnixFDListClass.t
    where type dbuscallflags_t = GioDBusCallFlags.t
    where type bustype_t = GioBusType.t
    where type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    where type dbusproxyflags_t = GioDBusProxyFlags.t
    where type dbusinterfaceinforecord_t = GioDBusInterfaceInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_proxy_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newFinish_ = call (load_sym libgio "g_dbus_proxy_new_finish") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val newForBusFinish_ = call (load_sym libgio "g_dbus_proxy_new_for_bus_finish") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val newForBusSync_ =
        call (load_sym libgio "g_dbus_proxy_new_for_bus_sync")
          (
            GioBusType.PolyML.VAL
             &&> GioDBusProxyFlags.PolyML.VAL
             &&> GioDBusInterfaceInfoRecord.PolyML.OPTPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val newSync_ =
        call (load_sym libgio "g_dbus_proxy_new_sync")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GioDBusProxyFlags.PolyML.VAL
             &&> GioDBusInterfaceInfoRecord.PolyML.OPTPTR
             &&> FFI.PolyML.String.INOPTPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val callFinish_ =
        call (load_sym libgio "g_dbus_proxy_call_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibVariantRecord.PolyML.PTR
          )
      val callSync_ =
        call (load_sym libgio "g_dbus_proxy_call_sync")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibVariantRecord.PolyML.OPTPTR
             &&> GioDBusCallFlags.PolyML.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibVariantRecord.PolyML.PTR
          )
      val callWithUnixFdListFinish_ =
        call (load_sym libgio "g_dbus_proxy_call_with_unix_fd_list_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibVariantRecord.PolyML.PTR
          )
      val callWithUnixFdListSync_ =
        call (load_sym libgio "g_dbus_proxy_call_with_unix_fd_list_sync")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibVariantRecord.PolyML.OPTPTR
             &&> GioDBusCallFlags.PolyML.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibVariantRecord.PolyML.PTR
          )
      val getCachedProperty_ = call (load_sym libgio "g_dbus_proxy_get_cached_property") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GLibVariantRecord.PolyML.PTR)
      val getConnection_ = call (load_sym libgio "g_dbus_proxy_get_connection") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDefaultTimeout_ = call (load_sym libgio "g_dbus_proxy_get_default_timeout") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getFlags_ = call (load_sym libgio "g_dbus_proxy_get_flags") (GObjectObjectClass.PolyML.PTR --> GioDBusProxyFlags.PolyML.VAL)
      val getInterfaceInfo_ = call (load_sym libgio "g_dbus_proxy_get_interface_info") (GObjectObjectClass.PolyML.PTR --> GioDBusInterfaceInfoRecord.PolyML.PTR)
      val getInterfaceName_ = call (load_sym libgio "g_dbus_proxy_get_interface_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getName_ = call (load_sym libgio "g_dbus_proxy_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getNameOwner_ = call (load_sym libgio "g_dbus_proxy_get_name_owner") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getObjectPath_ = call (load_sym libgio "g_dbus_proxy_get_object_path") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val setCachedProperty_ =
        call (load_sym libgio "g_dbus_proxy_set_cached_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibVariantRecord.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val setDefaultTimeout_ = call (load_sym libgio "g_dbus_proxy_set_default_timeout") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setInterfaceInfo_ = call (load_sym libgio "g_dbus_proxy_set_interface_info") (GObjectObjectClass.PolyML.PTR &&> GioDBusInterfaceInfoRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioDBusProxyClass.t
    type 'a asyncinitableclass_t = 'a GioAsyncInitableClass.t
    type 'a dbusinterfaceclass_t = 'a GioDBusInterfaceClass.t
    type 'a initableclass_t = 'a GioInitableClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a unixfdlistclass_t = 'a GioUnixFDListClass.t
    type dbuscallflags_t = GioDBusCallFlags.t
    type bustype_t = GioBusType.t
    type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    type dbusproxyflags_t = GioDBusProxyFlags.t
    type dbusinterfaceinforecord_t = GioDBusInterfaceInfoRecord.t
    fun asAsyncInitable self = (GObjectObjectClass.C.withPtr ---> GioAsyncInitableClass.C.fromPtr false) I self
    fun asDBusInterface self = (GObjectObjectClass.C.withPtr ---> GioDBusInterfaceClass.C.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFinish res = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioDBusProxyClass.C.fromPtr true) newFinish_ (res & [])
    fun newForBusFinish res = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioDBusProxyClass.C.fromPtr true) newForBusFinish_ (res & [])
    fun newForBusSync busType flags info name objectPath interfaceName cancellable =
      (
        GioBusType.C.withVal
         &&&> GioDBusProxyFlags.C.withVal
         &&&> GioDBusInterfaceInfoRecord.C.withOptPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GioDBusProxyFlags.C.withVal
         &&&> GioDBusInterfaceInfoRecord.C.withOptPtr
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibVariantRecord.C.withOptPtr
         &&&> GioDBusCallFlags.C.withVal
         &&&> FFI.Int32.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GLibErrorRecord.C.handleError
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.String.withConstPtr
             &&&> GLibVariantRecord.C.withOptPtr
             &&&> GioDBusCallFlags.C.withVal
             &&&> FFI.Int32.withVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
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
    fun getCachedProperty self propertyName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GLibVariantRecord.C.fromPtr true) getCachedProperty_ (self & propertyName)
    fun getConnection self = (GObjectObjectClass.C.withPtr ---> GioDBusConnectionClass.C.fromPtr false) getConnection_ self
    fun getDefaultTimeout self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getDefaultTimeout_ self
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GioDBusProxyFlags.C.fromVal) getFlags_ self
    fun getInterfaceInfo self = (GObjectObjectClass.C.withPtr ---> GioDBusInterfaceInfoRecord.C.fromPtr true) getInterfaceInfo_ self
    fun getInterfaceName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getInterfaceName_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getName_ self
    fun getNameOwner self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) getNameOwner_ self
    fun getObjectPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getObjectPath_ self
    fun setCachedProperty self propertyName value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibVariantRecord.C.withOptPtr
         ---> I
      )
        setCachedProperty_
        (
          self
           & propertyName
           & value
        )
    fun setDefaultTimeout self timeoutMsec = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setDefaultTimeout_ (self & timeoutMsec)
    fun setInterfaceInfo self info = (GObjectObjectClass.C.withPtr &&&> GioDBusInterfaceInfoRecord.C.withOptPtr ---> I) setInterfaceInfo_ (self & info)
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
