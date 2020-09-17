structure GioDBusConnection :>
  GIO_D_BUS_CONNECTION
    where type 'a class = 'a GioDBusConnectionClass.class
    where type 'a async_initable_class = 'a GioAsyncInitableClass.class
    where type 'a initable_class = 'a GioInitableClass.class
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    where type d_bus_call_flags_t = GioDBusCallFlags.t
    where type 'a action_group_class = 'a GioActionGroupClass.class
    where type 'a menu_model_class = 'a GioMenuModelClass.class
    where type 'a credentials_class = 'a GioCredentialsClass.class
    where type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type d_bus_send_message_flags_t = GioDBusSendMessageFlags.t
    where type 'a d_bus_message_class = 'a GioDBusMessageClass.class
    where type 'a d_bus_auth_observer_class = 'a GioDBusAuthObserverClass.class
    where type d_bus_capability_flags_t = GioDBusCapabilityFlags.t
    where type d_bus_connection_flags_t = GioDBusConnectionFlags.t
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_connection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newFinish_ = call (getSymbol "g_dbus_connection_new_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusConnectionClass.PolyML.cPtr)
      val newForAddressFinish_ = call (getSymbol "g_dbus_connection_new_for_address_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioDBusConnectionClass.PolyML.cPtr)
      val newForAddressSync_ =
        call (getSymbol "g_dbus_connection_new_for_address_sync")
          (
            Utf8.PolyML.cInPtr
             &&> GioDBusConnectionFlags.PolyML.cVal
             &&> GioDBusAuthObserverClass.PolyML.cOptPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioDBusConnectionClass.PolyML.cPtr
          )
      val newSync_ =
        call (getSymbol "g_dbus_connection_new_sync")
          (
            GioIOStreamClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GioDBusConnectionFlags.PolyML.cVal
             &&> GioDBusAuthObserverClass.PolyML.cOptPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioDBusConnectionClass.PolyML.cPtr
          )
      val callFinish_ =
        call (getSymbol "g_dbus_connection_call_finish")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val callSync_ =
        call (getSymbol "g_dbus_connection_call_sync")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GLibVariantTypeRecord.PolyML.cOptPtr
             &&> GioDBusCallFlags.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val callWithUnixFdListFinish_ =
        call (getSymbol "g_dbus_connection_call_with_unix_fd_list_finish")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> GioUnixFDListClass.PolyML.cOutRef
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val callWithUnixFdListSync_ =
        call (getSymbol "g_dbus_connection_call_with_unix_fd_list_sync")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GLibVariantTypeRecord.PolyML.cOptPtr
             &&> GioDBusCallFlags.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GioUnixFDListClass.PolyML.cOptPtr
             &&> GioUnixFDListClass.PolyML.cOutRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val closeFinish_ =
        call (getSymbol "g_dbus_connection_close_finish")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val closeSync_ =
        call (getSymbol "g_dbus_connection_close_sync")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val emitSignal_ =
        call (getSymbol "g_dbus_connection_emit_signal")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val exportActionGroup_ =
        call (getSymbol "g_dbus_connection_export_action_group")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioActionGroupClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val exportMenuModel_ =
        call (getSymbol "g_dbus_connection_export_menu_model")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioMenuModelClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val flushFinish_ =
        call (getSymbol "g_dbus_connection_flush_finish")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val flushSync_ =
        call (getSymbol "g_dbus_connection_flush_sync")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getCapabilities_ = call (getSymbol "g_dbus_connection_get_capabilities") (GioDBusConnectionClass.PolyML.cPtr --> GioDBusCapabilityFlags.PolyML.cVal)
      val getExitOnClose_ = call (getSymbol "g_dbus_connection_get_exit_on_close") (GioDBusConnectionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getGuid_ = call (getSymbol "g_dbus_connection_get_guid") (GioDBusConnectionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLastSerial_ = call (getSymbol "g_dbus_connection_get_last_serial") (GioDBusConnectionClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getPeerCredentials_ = call (getSymbol "g_dbus_connection_get_peer_credentials") (GioDBusConnectionClass.PolyML.cPtr --> GioCredentialsClass.PolyML.cOptPtr)
      val getStream_ = call (getSymbol "g_dbus_connection_get_stream") (GioDBusConnectionClass.PolyML.cPtr --> GioIOStreamClass.PolyML.cPtr)
      val getUniqueName_ = call (getSymbol "g_dbus_connection_get_unique_name") (GioDBusConnectionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isClosed_ = call (getSymbol "g_dbus_connection_is_closed") (GioDBusConnectionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val registerObject_ =
        call (getSymbol "g_dbus_connection_register_object_with_closures")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioDBusInterfaceInfoRecord.PolyML.cPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GObjectClosureRecord.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val removeFilter_ = call (getSymbol "g_dbus_connection_remove_filter") (GioDBusConnectionClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val sendMessage_ =
        call (getSymbol "g_dbus_connection_send_message")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> GioDBusMessageClass.PolyML.cPtr
             &&> GioDBusSendMessageFlags.PolyML.cVal
             &&> GUInt32.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val sendMessageWithReplyFinish_ =
        call (getSymbol "g_dbus_connection_send_message_with_reply_finish")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioDBusMessageClass.PolyML.cPtr
          )
      val sendMessageWithReplySync_ =
        call (getSymbol "g_dbus_connection_send_message_with_reply_sync")
          (
            GioDBusConnectionClass.PolyML.cPtr
             &&> GioDBusMessageClass.PolyML.cPtr
             &&> GioDBusSendMessageFlags.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GUInt32.PolyML.cRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioDBusMessageClass.PolyML.cPtr
          )
      val setExitOnClose_ = call (getSymbol "g_dbus_connection_set_exit_on_close") (GioDBusConnectionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val signalUnsubscribe_ = call (getSymbol "g_dbus_connection_signal_unsubscribe") (GioDBusConnectionClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val startMessageProcessing_ = call (getSymbol "g_dbus_connection_start_message_processing") (GioDBusConnectionClass.PolyML.cPtr --> cVoid)
      val unexportActionGroup_ = call (getSymbol "g_dbus_connection_unexport_action_group") (GioDBusConnectionClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val unexportMenuModel_ = call (getSymbol "g_dbus_connection_unexport_menu_model") (GioDBusConnectionClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val unregisterObject_ = call (getSymbol "g_dbus_connection_unregister_object") (GioDBusConnectionClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val unregisterSubtree_ = call (getSymbol "g_dbus_connection_unregister_subtree") (GioDBusConnectionClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioDBusConnectionClass.class
    type 'a async_initable_class = 'a GioAsyncInitableClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type d_bus_call_flags_t = GioDBusCallFlags.t
    type 'a action_group_class = 'a GioActionGroupClass.class
    type 'a menu_model_class = 'a GioMenuModelClass.class
    type 'a credentials_class = 'a GioCredentialsClass.class
    type d_bus_interface_info_t = GioDBusInterfaceInfoRecord.t
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type d_bus_send_message_flags_t = GioDBusSendMessageFlags.t
    type 'a d_bus_message_class = 'a GioDBusMessageClass.class
    type 'a d_bus_auth_observer_class = 'a GioDBusAuthObserverClass.class
    type d_bus_capability_flags_t = GioDBusCapabilityFlags.t
    type d_bus_connection_flags_t = GioDBusConnectionFlags.t
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type t = base class
    fun asAsyncInitable self = (GObjectObjectClass.FFI.withPtr false ---> GioAsyncInitableClass.FFI.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.FFI.withPtr false ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFinish res = (GioAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GioDBusConnectionClass.FFI.fromPtr true) newFinish_ (res & [])
    fun newForAddressFinish res = (GioAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GioDBusConnectionClass.FFI.fromPtr true) newForAddressFinish_ (res & [])
    fun newForAddressSync
      (
        address,
        flags,
        observer,
        cancellable
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GioDBusConnectionFlags.FFI.withVal
         &&&> GioDBusAuthObserverClass.FFI.withOptPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioDBusConnectionClass.FFI.fromPtr true
      )
        newForAddressSync_
        (
          address
           & flags
           & observer
           & cancellable
           & []
        )
    fun newSync
      (
        stream,
        guid,
        flags,
        observer,
        cancellable
      ) =
      (
        GioIOStreamClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GioDBusConnectionFlags.FFI.withVal
         &&&> GioDBusAuthObserverClass.FFI.withOptPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioDBusConnectionClass.FFI.fromPtr true
      )
        newSync_
        (
          stream
           & guid
           & flags
           & observer
           & cancellable
           & []
        )
    fun callFinish self res =
      (
        GioDBusConnectionClass.FFI.withPtr false
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
        busName,
        objectPath,
        interfaceName,
        methodName,
        parameters,
        replyType,
        flags,
        timeoutMsec,
        cancellable
      ) =
      (
        GioDBusConnectionClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantRecord.FFI.withOptPtr false
         &&&> GLibVariantTypeRecord.FFI.withOptPtr false
         &&&> GioDBusCallFlags.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        callSync_
        (
          self
           & busName
           & objectPath
           & interfaceName
           & methodName
           & parameters
           & replyType
           & flags
           & timeoutMsec
           & cancellable
           & []
        )
    fun callWithUnixFdListFinish self res =
      let
        val outFdList & retVal =
          (
            GioDBusConnectionClass.FFI.withPtr false
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
        busName,
        objectPath,
        interfaceName,
        methodName,
        parameters,
        replyType,
        flags,
        timeoutMsec,
        fdList,
        cancellable
      ) =
      let
        val outFdList & retVal =
          (
            GioDBusConnectionClass.FFI.withPtr false
             &&&> Utf8.FFI.withOptPtr 0
             &&&> Utf8.FFI.withPtr 0
             &&&> Utf8.FFI.withPtr 0
             &&&> Utf8.FFI.withPtr 0
             &&&> GLibVariantRecord.FFI.withOptPtr false
             &&&> GLibVariantTypeRecord.FFI.withOptPtr false
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
               & busName
               & objectPath
               & interfaceName
               & methodName
               & parameters
               & replyType
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
    fun closeFinish self res =
      (
        GioDBusConnectionClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        closeFinish_
        (
          self
           & res
           & []
        )
    fun closeSync self cancellable =
      (
        GioDBusConnectionClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        closeSync_
        (
          self
           & cancellable
           & []
        )
    fun emitSignal
      self
      (
        destinationBusName,
        objectPath,
        interfaceName,
        signalName,
        parameters
      ) =
      (
        GioDBusConnectionClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantRecord.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        emitSignal_
        (
          self
           & destinationBusName
           & objectPath
           & interfaceName
           & signalName
           & parameters
           & []
        )
    fun exportActionGroup self (objectPath, actionGroup) =
      (
        GioDBusConnectionClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioActionGroupClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        exportActionGroup_
        (
          self
           & objectPath
           & actionGroup
           & []
        )
    fun exportMenuModel self (objectPath, menu) =
      (
        GioDBusConnectionClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioMenuModelClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        exportMenuModel_
        (
          self
           & objectPath
           & menu
           & []
        )
    fun flushFinish self res =
      (
        GioDBusConnectionClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        flushFinish_
        (
          self
           & res
           & []
        )
    fun flushSync self cancellable =
      (
        GioDBusConnectionClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        flushSync_
        (
          self
           & cancellable
           & []
        )
    fun getCapabilities self = (GioDBusConnectionClass.FFI.withPtr false ---> GioDBusCapabilityFlags.FFI.fromVal) getCapabilities_ self
    fun getExitOnClose self = (GioDBusConnectionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getExitOnClose_ self
    fun getGuid self = (GioDBusConnectionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getGuid_ self before GioDBusConnectionClass.FFI.touchPtr self
    fun getLastSerial self = (GioDBusConnectionClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getLastSerial_ self
    fun getPeerCredentials self = (GioDBusConnectionClass.FFI.withPtr false ---> GioCredentialsClass.FFI.fromOptPtr false) getPeerCredentials_ self before GioDBusConnectionClass.FFI.touchPtr self
    fun getStream self = (GioDBusConnectionClass.FFI.withPtr false ---> GioIOStreamClass.FFI.fromPtr false) getStream_ self before GioDBusConnectionClass.FFI.touchPtr self
    fun getUniqueName self = (GioDBusConnectionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getUniqueName_ self before GioDBusConnectionClass.FFI.touchPtr self
    fun isClosed self = (GioDBusConnectionClass.FFI.withPtr false ---> GBool.FFI.fromVal) isClosed_ self
    fun registerObject
      self
      (
        objectPath,
        interfaceInfo,
        methodCallClosure,
        getPropertyClosure,
        setPropertyClosure
      ) =
      (
        GioDBusConnectionClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioDBusInterfaceInfoRecord.FFI.withPtr false
         &&&> GObjectClosureRecord.FFI.withOptPtr false
         &&&> GObjectClosureRecord.FFI.withOptPtr false
         &&&> GObjectClosureRecord.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        registerObject_
        (
          self
           & objectPath
           & interfaceInfo
           & methodCallClosure
           & getPropertyClosure
           & setPropertyClosure
           & []
        )
    fun removeFilter self filterId = (GioDBusConnectionClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) removeFilter_ (self & filterId)
    fun sendMessage self (message, flags) =
      let
        val outSerial & () =
          (
            GioDBusConnectionClass.FFI.withPtr false
             &&&> GioDBusMessageClass.FFI.withPtr false
             &&&> GioDBusSendMessageFlags.FFI.withVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt32.FFI.fromVal && ignore
          )
            sendMessage_
            (
              self
               & message
               & flags
               & GUInt32.null
               & []
            )
      in
        outSerial
      end
    fun sendMessageWithReplyFinish self res =
      (
        GioDBusConnectionClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioDBusMessageClass.FFI.fromPtr true
      )
        sendMessageWithReplyFinish_
        (
          self
           & res
           & []
        )
    fun sendMessageWithReplySync
      self
      (
        message,
        flags,
        timeoutMsec,
        cancellable
      ) =
      let
        val outSerial & retVal =
          (
            GioDBusConnectionClass.FFI.withPtr false
             &&&> GioDBusMessageClass.FFI.withPtr false
             &&&> GioDBusSendMessageFlags.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GUInt32.FFI.fromVal && GioDBusMessageClass.FFI.fromPtr true
          )
            sendMessageWithReplySync_
            (
              self
               & message
               & flags
               & timeoutMsec
               & GUInt32.null
               & cancellable
               & []
            )
      in
        (retVal, outSerial)
      end
    fun setExitOnClose self exitOnClose = (GioDBusConnectionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setExitOnClose_ (self & exitOnClose)
    fun signalUnsubscribe self subscriptionId = (GioDBusConnectionClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) signalUnsubscribe_ (self & subscriptionId)
    fun startMessageProcessing self = (GioDBusConnectionClass.FFI.withPtr false ---> I) startMessageProcessing_ self
    fun unexportActionGroup self exportId = (GioDBusConnectionClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) unexportActionGroup_ (self & exportId)
    fun unexportMenuModel self exportId = (GioDBusConnectionClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) unexportMenuModel_ (self & exportId)
    fun unregisterObject self registrationId = (GioDBusConnectionClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> GBool.FFI.fromVal) unregisterObject_ (self & registrationId)
    fun unregisterSubtree self registrationId = (GioDBusConnectionClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> GBool.FFI.fromVal) unregisterSubtree_ (self & registrationId)
    local
      open ValueAccessor
    in
      val addressProp =
        {
          name = "address",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val authenticationObserverProp =
        {
          name = "authentication-observer",
          gtype = fn () => C.gtype GioDBusAuthObserverClass.tOpt (),
          get = ignore,
          set = ignore,
          init = fn x => C.set GioDBusAuthObserverClass.tOpt x
        }
      val capabilitiesProp =
        {
          name = "capabilities",
          gtype = fn () => C.gtype GioDBusCapabilityFlags.t (),
          get = fn x => fn () => C.get GioDBusCapabilityFlags.t x,
          set = ignore,
          init = ignore
        }
      val closedProp =
        {
          name = "closed",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val exitOnCloseProp =
        {
          name = "exit-on-close",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val flagsProp =
        {
          name = "flags",
          gtype = fn () => C.gtype GioDBusConnectionFlags.t (),
          get = ignore,
          set = ignore,
          init = fn x => C.set GioDBusConnectionFlags.t x
        }
      val guidProp =
        {
          name = "guid",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val streamProp =
        {
          name = "stream",
          gtype = fn () => C.gtype GioIOStreamClass.tOpt (),
          get = fn x => fn () => C.get GioIOStreamClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioIOStreamClass.tOpt x
        }
      val uniqueNameProp =
        {
          name = "unique-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
    end
  end
