structure GioDBusConnection :>
  GIO_D_BUS_CONNECTION
    where type 'a class_t = 'a GioDBusConnectionClass.t
    where type 'a async_initable_class_t = 'a GioAsyncInitableClass.t
    where type 'a initable_class_t = 'a GioInitableClass.t
    where type 'a unix_f_d_list_class_t = 'a GioUnixFDListClass.t
    where type d_bus_call_flags_t = GioDBusCallFlags.t
    where type 'a credentials_class_t = 'a GioCredentialsClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type d_bus_send_message_flags_t = GioDBusSendMessageFlags.t
    where type 'a d_bus_message_class_t = 'a GioDBusMessageClass.t
    where type 'a d_bus_auth_observer_class_t = 'a GioDBusAuthObserverClass.t
    where type d_bus_capability_flags_t = GioDBusCapabilityFlags.t
    where type d_bus_connection_flags_t = GioDBusConnectionFlags.t
    where type 'a i_o_stream_class_t = 'a GioIOStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_connection_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newFinish_ = call (load_sym libgio "g_dbus_connection_new_finish") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val newForAddressFinish_ = call (load_sym libgio "g_dbus_connection_new_for_address_finish") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val newForAddressSync_ =
        call (load_sym libgio "g_dbus_connection_new_for_address_sync")
          (
            FFI.String.PolyML.INPTR
             &&> GioDBusConnectionFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val newSync_ =
        call (load_sym libgio "g_dbus_connection_new_sync")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> GioDBusConnectionFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val callFinish_ =
        call (load_sym libgio "g_dbus_connection_call_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibVariantRecord.PolyML.PTR
          )
      val callSync_ =
        call (load_sym libgio "g_dbus_connection_call_sync")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibVariantRecord.PolyML.OPTPTR
             &&> GLibVariantTypeRecord.PolyML.OPTPTR
             &&> GioDBusCallFlags.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibVariantRecord.PolyML.PTR
          )
      val callWithUnixFdListFinish_ =
        call (load_sym libgio "g_dbus_connection_call_with_unix_fd_list_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibVariantRecord.PolyML.PTR
          )
      val callWithUnixFdListSync_ =
        call (load_sym libgio "g_dbus_connection_call_with_unix_fd_list_sync")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibVariantRecord.PolyML.OPTPTR
             &&> GLibVariantTypeRecord.PolyML.OPTPTR
             &&> GioDBusCallFlags.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibVariantRecord.PolyML.PTR
          )
      val closeFinish_ =
        call (load_sym libgio "g_dbus_connection_close_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val closeSync_ =
        call (load_sym libgio "g_dbus_connection_close_sync")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val emitSignal_ =
        call (load_sym libgio "g_dbus_connection_emit_signal")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibVariantRecord.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val flushFinish_ =
        call (load_sym libgio "g_dbus_connection_flush_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val flushSync_ =
        call (load_sym libgio "g_dbus_connection_flush_sync")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val getCapabilities_ = call (load_sym libgio "g_dbus_connection_get_capabilities") (GObjectObjectClass.PolyML.PTR --> GioDBusCapabilityFlags.PolyML.VAL)
      val getExitOnClose_ = call (load_sym libgio "g_dbus_connection_get_exit_on_close") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getGuid_ = call (load_sym libgio "g_dbus_connection_get_guid") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getPeerCredentials_ = call (load_sym libgio "g_dbus_connection_get_peer_credentials") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getStream_ = call (load_sym libgio "g_dbus_connection_get_stream") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getUniqueName_ = call (load_sym libgio "g_dbus_connection_get_unique_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val isClosed_ = call (load_sym libgio "g_dbus_connection_is_closed") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val removeFilter_ = call (load_sym libgio "g_dbus_connection_remove_filter") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt.PolyML.VAL --> FFI.PolyML.VOID)
      val sendMessage_ =
        call (load_sym libgio "g_dbus_connection_send_message")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GioDBusSendMessageFlags.PolyML.VAL
             &&> FFI.UInt32.PolyML.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val sendMessageWithReplyFinish_ =
        call (load_sym libgio "g_dbus_connection_send_message_with_reply_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val sendMessageWithReplySync_ =
        call (load_sym libgio "g_dbus_connection_send_message_with_reply_sync")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GioDBusSendMessageFlags.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.UInt32.PolyML.REF
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val setExitOnClose_ = call (load_sym libgio "g_dbus_connection_set_exit_on_close") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val signalUnsubscribe_ = call (load_sym libgio "g_dbus_connection_signal_unsubscribe") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt.PolyML.VAL --> FFI.PolyML.VOID)
      val startMessageProcessing_ = call (load_sym libgio "g_dbus_connection_start_message_processing") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unregisterObject_ = call (load_sym libgio "g_dbus_connection_unregister_object") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val unregisterSubtree_ = call (load_sym libgio "g_dbus_connection_unregister_subtree") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt.PolyML.VAL --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GioDBusConnectionClass.t
    type 'a async_initable_class_t = 'a GioAsyncInitableClass.t
    type 'a initable_class_t = 'a GioInitableClass.t
    type 'a unix_f_d_list_class_t = 'a GioUnixFDListClass.t
    type d_bus_call_flags_t = GioDBusCallFlags.t
    type 'a credentials_class_t = 'a GioCredentialsClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type d_bus_send_message_flags_t = GioDBusSendMessageFlags.t
    type 'a d_bus_message_class_t = 'a GioDBusMessageClass.t
    type 'a d_bus_auth_observer_class_t = 'a GioDBusAuthObserverClass.t
    type d_bus_capability_flags_t = GioDBusCapabilityFlags.t
    type d_bus_connection_flags_t = GioDBusConnectionFlags.t
    type 'a i_o_stream_class_t = 'a GioIOStreamClass.t
    type t = base class_t
    fun asAsyncInitable self = (GObjectObjectClass.C.withPtr ---> GioAsyncInitableClass.C.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFinish res = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioDBusConnectionClass.C.fromPtr true) newFinish_ (res & [])
    fun newForAddressFinish res = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioDBusConnectionClass.C.fromPtr true) newForAddressFinish_ (res & [])
    fun newForAddressSync address flags observer cancellable =
      (
        FFI.String.C.withConstPtr
         &&&> GioDBusConnectionFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstOptPtr
         &&&> GioDBusConnectionFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibVariantRecord.C.withOptPtr
         &&&> GLibVariantTypeRecord.C.withOptPtr
         &&&> GioDBusCallFlags.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
    fun callWithUnixFdListSync self busName objectPath interfaceName methodName parameters replyType flags timeoutMsec fdList cancellable =
      let
        val outFdList & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.String.C.withConstPtr
             &&&> FFI.String.C.withConstPtr
             &&&> FFI.String.C.withConstPtr
             &&&> FFI.String.C.withConstPtr
             &&&> GLibVariantRecord.C.withOptPtr
             &&&> GLibVariantTypeRecord.C.withOptPtr
             &&&> GioDBusCallFlags.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibVariantRecord.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
    fun getGuid self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getGuid_ self
    fun getPeerCredentials self = (GObjectObjectClass.C.withPtr ---> GioCredentialsClass.C.fromPtr false) getPeerCredentials_ self
    fun getStream self = (GObjectObjectClass.C.withPtr ---> GioIOStreamClass.C.fromPtr false) getStream_ self
    fun getUniqueName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getUniqueName_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun removeFilter self filterId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) removeFilter_ (self & filterId)
    fun sendMessage self message flags =
      let
        val outSerial & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GioDBusSendMessageFlags.C.withVal
             &&&> FFI.UInt32.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
             &&&> FFI.Int.C.withVal
             &&&> FFI.UInt32.C.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
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
    fun signalUnsubscribe self subscriptionId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) signalUnsubscribe_ (self & subscriptionId)
    fun startMessageProcessing self = (GObjectObjectClass.C.withPtr ---> I) startMessageProcessing_ self
    fun unregisterObject self registrationId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> FFI.Bool.C.fromVal) unregisterObject_ (self & registrationId)
    fun unregisterSubtree self registrationId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> FFI.Bool.C.fromVal) unregisterSubtree_ (self & registrationId)
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
