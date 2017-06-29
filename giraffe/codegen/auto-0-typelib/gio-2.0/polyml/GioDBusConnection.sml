structure GioDBusConnection :>
  GIO_D_BUS_CONNECTION
    where type 'a class = 'a GioDBusConnectionClass.class
    where type 'a async_initable_class = 'a GioAsyncInitableClass.class
    where type 'a initable_class = 'a GioInitableClass.class
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    where type d_bus_call_flags_t = GioDBusCallFlags.t
    where type 'a credentials_class = 'a GioCredentialsClass.class
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
      val getType_ = call (getSymbol "g_dbus_connection_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
             &&> Utf8.PolyML.cInPtr
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
             &&> Utf8.PolyML.cInPtr
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
      val getPeerCredentials_ = call (getSymbol "g_dbus_connection_get_peer_credentials") (GioDBusConnectionClass.PolyML.cPtr --> GioCredentialsClass.PolyML.cPtr)
      val getStream_ = call (getSymbol "g_dbus_connection_get_stream") (GioDBusConnectionClass.PolyML.cPtr --> GioIOStreamClass.PolyML.cPtr)
      val getUniqueName_ = call (getSymbol "g_dbus_connection_get_unique_name") (GioDBusConnectionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isClosed_ = call (getSymbol "g_dbus_connection_is_closed") (GioDBusConnectionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val removeFilter_ = call (getSymbol "g_dbus_connection_remove_filter") (GioDBusConnectionClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> PolyMLFFI.cVoid)
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
      val setExitOnClose_ = call (getSymbol "g_dbus_connection_set_exit_on_close") (GioDBusConnectionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val signalUnsubscribe_ = call (getSymbol "g_dbus_connection_signal_unsubscribe") (GioDBusConnectionClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val startMessageProcessing_ = call (getSymbol "g_dbus_connection_start_message_processing") (GioDBusConnectionClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val unregisterObject_ = call (getSymbol "g_dbus_connection_unregister_object") (GioDBusConnectionClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val unregisterSubtree_ = call (getSymbol "g_dbus_connection_unregister_subtree") (GioDBusConnectionClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioDBusConnectionClass.class
    type 'a async_initable_class = 'a GioAsyncInitableClass.class
    type 'a initable_class = 'a GioInitableClass.class
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type d_bus_call_flags_t = GioDBusCallFlags.t
    type 'a credentials_class = 'a GioCredentialsClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type d_bus_send_message_flags_t = GioDBusSendMessageFlags.t
    type 'a d_bus_message_class = 'a GioDBusMessageClass.class
    type 'a d_bus_auth_observer_class = 'a GioDBusAuthObserverClass.class
    type d_bus_capability_flags_t = GioDBusCapabilityFlags.t
    type d_bus_connection_flags_t = GioDBusConnectionFlags.t
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type t = base class
    fun asAsyncInitable self = (GObjectObjectClass.FFI.withPtr ---> GioAsyncInitableClass.FFI.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.FFI.withPtr ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFinish res = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusConnectionClass.FFI.fromPtr true) newFinish_ (res & [])
    fun newForAddressFinish res = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusConnectionClass.FFI.fromPtr true) newForAddressFinish_ (res & [])
    fun newForAddressSync address flags observer cancellable =
      (
        Utf8.FFI.withPtr
         &&&> GioDBusConnectionFlags.FFI.withVal
         &&&> GioDBusAuthObserverClass.FFI.withOptPtr
         &&&> GioCancellableClass.FFI.withOptPtr
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
    fun newSync stream guid flags observer cancellable =
      (
        GioIOStreamClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GioDBusConnectionFlags.FFI.withVal
         &&&> GioDBusAuthObserverClass.FFI.withOptPtr
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioDBusConnectionClass.FFI.withPtr
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
    fun callSync self busName objectPath interfaceName methodName parameters replyType flags timeoutMsec cancellable =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         &&&> GLibVariantTypeRecord.FFI.withOptPtr
         &&&> GioDBusCallFlags.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
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
            GioDBusConnectionClass.FFI.withPtr
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
    fun callWithUnixFdListSync self busName objectPath interfaceName methodName parameters replyType flags timeoutMsec fdList cancellable =
      let
        val outFdList & retVal =
          (
            GioDBusConnectionClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GLibVariantRecord.FFI.withOptPtr
             &&&> GLibVariantTypeRecord.FFI.withOptPtr
             &&&> GioDBusCallFlags.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GioUnixFDListClass.FFI.withOptPtr
             &&&> GioUnixFDListClass.FFI.withRefOptPtr
             &&&> GioCancellableClass.FFI.withOptPtr
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
        GioDBusConnectionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        closeFinish_
        (
          self
           & res
           & []
        )
    fun closeSync self cancellable =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        closeSync_
        (
          self
           & cancellable
           & []
        )
    fun emitSignal self destinationBusName objectPath interfaceName signalName parameters =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
    fun flushFinish self res =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        flushFinish_
        (
          self
           & res
           & []
        )
    fun flushSync self cancellable =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        flushSync_
        (
          self
           & cancellable
           & []
        )
    fun getCapabilities self = (GioDBusConnectionClass.FFI.withPtr ---> GioDBusCapabilityFlags.FFI.fromVal) getCapabilities_ self
    fun getExitOnClose self = (GioDBusConnectionClass.FFI.withPtr ---> GBool.FFI.fromVal) getExitOnClose_ self
    fun getGuid self = (GioDBusConnectionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getGuid_ self
    fun getPeerCredentials self = (GioDBusConnectionClass.FFI.withPtr ---> GioCredentialsClass.FFI.fromPtr false) getPeerCredentials_ self
    fun getStream self = (GioDBusConnectionClass.FFI.withPtr ---> GioIOStreamClass.FFI.fromPtr false) getStream_ self
    fun getUniqueName self = (GioDBusConnectionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getUniqueName_ self
    fun isClosed self = (GioDBusConnectionClass.FFI.withPtr ---> GBool.FFI.fromVal) isClosed_ self
    fun removeFilter self filterId = (GioDBusConnectionClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) removeFilter_ (self & filterId)
    fun sendMessage self message flags =
      let
        val outSerial & retVal =
          (
            GioDBusConnectionClass.FFI.withPtr
             &&&> GioDBusMessageClass.FFI.withPtr
             &&&> GioDBusSendMessageFlags.FFI.withVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt32.FFI.fromVal && GBool.FFI.fromVal
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
        if retVal then SOME outSerial else NONE
      end
    fun sendMessageWithReplyFinish self res =
      (
        GioDBusConnectionClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDBusMessageClass.FFI.fromPtr true
      )
        sendMessageWithReplyFinish_
        (
          self
           & res
           & []
        )
    fun sendMessageWithReplySync self message flags timeoutMsec cancellable =
      let
        val outSerial & retVal =
          (
            GioDBusConnectionClass.FFI.withPtr
             &&&> GioDBusMessageClass.FFI.withPtr
             &&&> GioDBusSendMessageFlags.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr
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
    fun setExitOnClose self exitOnClose = (GioDBusConnectionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setExitOnClose_ (self & exitOnClose)
    fun signalUnsubscribe self subscriptionId = (GioDBusConnectionClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) signalUnsubscribe_ (self & subscriptionId)
    fun startMessageProcessing self = (GioDBusConnectionClass.FFI.withPtr ---> I) startMessageProcessing_ self
    fun unregisterObject self registrationId = (GioDBusConnectionClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GBool.FFI.fromVal) unregisterObject_ (self & registrationId)
    fun unregisterSubtree self registrationId = (GioDBusConnectionClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GBool.FFI.fromVal) unregisterSubtree_ (self & registrationId)
    local
      open Property
    in
      val addressProp = {set = fn x => set "address" stringOpt x}
      val authenticationObserverProp = {set = fn x => set "authentication-observer" GioDBusAuthObserverClass.tOpt x}
      val capabilitiesProp = {get = fn x => get "capabilities" GioDBusCapabilityFlags.t x}
      val closedProp = {get = fn x => get "closed" boolean x}
      val exitOnCloseProp =
        {
          get = fn x => get "exit-on-close" boolean x,
          set = fn x => set "exit-on-close" boolean x
        }
      val flagsProp = {set = fn x => set "flags" GioDBusConnectionFlags.t x}
      val guidProp =
        {
          get = fn x => get "guid" stringOpt x,
          set = fn x => set "guid" stringOpt x
        }
      val streamProp =
        {
          get = fn x => get "stream" GioIOStreamClass.tOpt x,
          set = fn x => set "stream" GioIOStreamClass.tOpt x
        }
      val uniqueNameProp = {get = fn x => get "unique-name" stringOpt x}
    end
  end
