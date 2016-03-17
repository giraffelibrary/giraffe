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
      val getType_ = call (load_sym libgio "g_dbus_connection_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val newFinish_ = call (load_sym libgio "g_dbus_connection_new_finish") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val newForAddressFinish_ = call (load_sym libgio "g_dbus_connection_new_for_address_finish") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val newForAddressSync_ =
        call (load_sym libgio "g_dbus_connection_new_for_address_sync")
          (
            Utf8.PolyML.cInPtr
             &&> GioDBusConnectionFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val newSync_ =
        call (load_sym libgio "g_dbus_connection_new_sync")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GioDBusConnectionFlags.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val callFinish_ =
        call (load_sym libgio "g_dbus_connection_call_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val callSync_ =
        call (load_sym libgio "g_dbus_connection_call_sync")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GLibVariantTypeRecord.PolyML.cOptPtr
             &&> GioDBusCallFlags.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val callWithUnixFdListFinish_ =
        call (load_sym libgio "g_dbus_connection_call_with_unix_fd_list_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val callWithUnixFdListSync_ =
        call (load_sym libgio "g_dbus_connection_call_with_unix_fd_list_sync")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GLibVariantTypeRecord.PolyML.cOptPtr
             &&> GioDBusCallFlags.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GObjectObjectClass.PolyML.cOutRef
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val closeFinish_ =
        call (load_sym libgio "g_dbus_connection_close_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val closeSync_ =
        call (load_sym libgio "g_dbus_connection_close_sync")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val emitSignal_ =
        call (load_sym libgio "g_dbus_connection_emit_signal")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val flushFinish_ =
        call (load_sym libgio "g_dbus_connection_flush_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val flushSync_ =
        call (load_sym libgio "g_dbus_connection_flush_sync")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val getCapabilities_ = call (load_sym libgio "g_dbus_connection_get_capabilities") (GObjectObjectClass.PolyML.cPtr --> GioDBusCapabilityFlags.PolyML.cVal)
      val getExitOnClose_ = call (load_sym libgio "g_dbus_connection_get_exit_on_close") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getGuid_ = call (load_sym libgio "g_dbus_connection_get_guid") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPeerCredentials_ = call (load_sym libgio "g_dbus_connection_get_peer_credentials") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getStream_ = call (load_sym libgio "g_dbus_connection_get_stream") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getUniqueName_ = call (load_sym libgio "g_dbus_connection_get_unique_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val isClosed_ = call (load_sym libgio "g_dbus_connection_is_closed") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val removeFilter_ = call (load_sym libgio "g_dbus_connection_remove_filter") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val sendMessage_ =
        call (load_sym libgio "g_dbus_connection_send_message")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GioDBusSendMessageFlags.PolyML.cVal
             &&> FFI.UInt32.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val sendMessageWithReplyFinish_ =
        call (load_sym libgio "g_dbus_connection_send_message_with_reply_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val sendMessageWithReplySync_ =
        call (load_sym libgio "g_dbus_connection_send_message_with_reply_sync")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GioDBusSendMessageFlags.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cRef
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val setExitOnClose_ = call (load_sym libgio "g_dbus_connection_set_exit_on_close") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val signalUnsubscribe_ = call (load_sym libgio "g_dbus_connection_signal_unsubscribe") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val startMessageProcessing_ = call (load_sym libgio "g_dbus_connection_start_message_processing") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unregisterObject_ = call (load_sym libgio "g_dbus_connection_unregister_object") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unregisterSubtree_ = call (load_sym libgio "g_dbus_connection_unregister_subtree") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
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
    fun asAsyncInitable self = (GObjectObjectClass.C.withPtr ---> GioAsyncInitableClass.C.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFinish res = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusConnectionClass.C.fromPtr true) newFinish_ (res & [])
    fun newForAddressFinish res = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusConnectionClass.C.fromPtr true) newForAddressFinish_ (res & [])
    fun newForAddressSync address flags observer cancellable =
      (
        Utf8.C.withPtr
         &&&> GioDBusConnectionFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDBusConnectionClass.C.fromPtr true
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
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GioDBusConnectionFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDBusConnectionClass.C.fromPtr true
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.C.fromPtr true
      )
        callFinish_
        (
          self
           & res
           & []
        )
    fun callSync self busName objectPath interfaceName methodName parameters replyType flags timeoutMsec cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibVariantRecord.C.withOptPtr
         &&&> GLibVariantTypeRecord.C.withOptPtr
         &&&> GioDBusCallFlags.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.C.fromPtr true
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
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withPtr
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
    fun callWithUnixFdListSync self busName objectPath interfaceName methodName parameters replyType flags timeoutMsec fdList cancellable =
      let
        val outFdList & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> GLibVariantRecord.C.withOptPtr
             &&&> GLibVariantTypeRecord.C.withOptPtr
             &&&> GioDBusCallFlags.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GioUnixFDListClass.C.fromPtr true && GLibVariantRecord.C.fromPtr true
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        closeFinish_
        (
          self
           & res
           & []
        )
    fun closeSync self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        closeSync_
        (
          self
           & cancellable
           & []
        )
    fun emitSignal self destinationBusName objectPath interfaceName signalName parameters =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibVariantRecord.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        flushFinish_
        (
          self
           & res
           & []
        )
    fun flushSync self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        flushSync_
        (
          self
           & cancellable
           & []
        )
    fun getCapabilities self = (GObjectObjectClass.C.withPtr ---> GioDBusCapabilityFlags.C.fromVal) getCapabilities_ self
    fun getExitOnClose self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getExitOnClose_ self
    fun getGuid self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getGuid_ self
    fun getPeerCredentials self = (GObjectObjectClass.C.withPtr ---> GioCredentialsClass.C.fromPtr false) getPeerCredentials_ self
    fun getStream self = (GObjectObjectClass.C.withPtr ---> GioIOStreamClass.C.fromPtr false) getStream_ self
    fun getUniqueName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getUniqueName_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun removeFilter self filterId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) removeFilter_ (self & filterId)
    fun sendMessage self message flags =
      let
        val outSerial & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GioDBusSendMessageFlags.C.withVal
             &&&> FFI.UInt32.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> FFI.UInt32.C.fromVal && FFI.Bool.C.fromVal
          )
            sendMessage_
            (
              self
               & message
               & flags
               & FFI.UInt32.null
               & []
            )
      in
        if retVal then SOME outSerial else NONE
      end
    fun sendMessageWithReplyFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioDBusMessageClass.C.fromPtr true
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
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GioDBusSendMessageFlags.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.UInt32.C.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> FFI.UInt32.C.fromVal && GioDBusMessageClass.C.fromPtr true
          )
            sendMessageWithReplySync_
            (
              self
               & message
               & flags
               & timeoutMsec
               & FFI.UInt32.null
               & cancellable
               & []
            )
      in
        (retVal, outSerial)
      end
    fun setExitOnClose self exitOnClose = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setExitOnClose_ (self & exitOnClose)
    fun signalUnsubscribe self subscriptionId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) signalUnsubscribe_ (self & subscriptionId)
    fun startMessageProcessing self = (GObjectObjectClass.C.withPtr ---> I) startMessageProcessing_ self
    fun unregisterObject self registrationId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> FFI.Bool.C.fromVal) unregisterObject_ (self & registrationId)
    fun unregisterSubtree self registrationId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> FFI.Bool.C.fromVal) unregisterSubtree_ (self & registrationId)
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
