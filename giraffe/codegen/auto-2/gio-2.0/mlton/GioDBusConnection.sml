structure GioDBusConnection :>
  GIO_D_BUS_CONNECTION
    where type 'a class_t = 'a GioDBusConnectionClass.t
    where type 'a asyncinitableclass_t = 'a GioAsyncInitableClass.t
    where type 'a initableclass_t = 'a GioInitableClass.t
    where type 'a unixfdlistclass_t = 'a GioUnixFDListClass.t
    where type dbuscallflags_t = GioDBusCallFlags.t
    where type 'a credentialsclass_t = 'a GioCredentialsClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type dbussendmessageflags_t = GioDBusSendMessageFlags.t
    where type 'a dbusmessageclass_t = 'a GioDBusMessageClass.t
    where type 'a dbusauthobserverclass_t = 'a GioDBusAuthObserverClass.t
    where type dbuscapabilityflags_t = GioDBusCapabilityFlags.t
    where type dbusconnectionflags_t = GioDBusConnectionFlags.t
    where type 'a iostreamclass_t = 'a GioIOStreamClass.t =
  struct
    val getType_ = _import "g_dbus_connection_get_type" : unit -> GObjectType.C.val_;
    val newFinish_ = fn x1 & x2 => (_import "g_dbus_connection_new_finish" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val newForAddressFinish_ = fn x1 & x2 => (_import "g_dbus_connection_new_for_address_finish" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val newForAddressSync_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_dbus_connection_new_for_address_sync" :
              cstring
               * unit CPointer.t
               * GioDBusConnectionFlags.C.val_
               * unit GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val newSync_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_dbus_connection_new_sync" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GioDBusConnectionFlags.C.val_
               * unit GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val callFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_call_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10
         & x11
         & x12
         & x13
         & x14
         & x15 =>
          (
            _import "mlton_g_dbus_connection_call_sync" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * unit GLibVariantRecord.C.p
               * unit GLibVariantTypeRecord.C.p
               * GioDBusCallFlags.C.val_
               * FFI.Int32.val_
               * unit GObjectObjectClass.C.p
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
              x10,
              x11,
              x12,
              x13,
              x14,
              x15
            )
    val callWithUnixFdListFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_dbus_connection_call_with_unix_fd_list_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10
         & x11
         & x12
         & x13
         & x14
         & x15
         & x16
         & x17 =>
          (
            _import "mlton_g_dbus_connection_call_with_unix_fd_list_sync" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * unit GLibVariantRecord.C.p
               * unit GLibVariantTypeRecord.C.p
               * GioDBusCallFlags.C.val_
               * FFI.Int32.val_
               * unit GObjectObjectClass.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * unit GObjectObjectClass.C.p
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
              x10,
              x11,
              x12,
              x13,
              x14,
              x15,
              x16,
              x17
            )
    val closeFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_close_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val closeSync_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_close_sync" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val emitSignal_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10
         & x11 =>
          (
            _import "mlton_g_dbus_connection_emit_signal" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * unit GLibVariantRecord.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
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
    val flushFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_flush_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val flushSync_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_flush_sync" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getCapabilities_ = _import "g_dbus_connection_get_capabilities" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioDBusCapabilityFlags.C.val_;
    val getExitOnClose_ = _import "g_dbus_connection_get_exit_on_close" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getGuid_ = _import "g_dbus_connection_get_guid" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getPeerCredentials_ = _import "g_dbus_connection_get_peer_credentials" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getStream_ = _import "g_dbus_connection_get_stream" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getUniqueName_ = _import "g_dbus_connection_get_unique_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val isClosed_ = _import "g_dbus_connection_is_closed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val removeFilter_ = fn x1 & x2 => (_import "g_dbus_connection_remove_filter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Word32.val_ -> unit;) (x1, x2)
    val sendMessage_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_dbus_connection_send_message" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioDBusSendMessageFlags.C.val_
               * FFI.Word32.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val sendMessageWithReplyFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_send_message_with_reply_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val sendMessageWithReplySync_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "g_dbus_connection_send_message_with_reply_sync" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GioDBusSendMessageFlags.C.val_
               * FFI.Int32.val_
               * FFI.Word32.ref_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val setExitOnClose_ = fn x1 & x2 => (_import "g_dbus_connection_set_exit_on_close" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val signalUnsubscribe_ = fn x1 & x2 => (_import "g_dbus_connection_signal_unsubscribe" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Word32.val_ -> unit;) (x1, x2)
    val startMessageProcessing_ = _import "g_dbus_connection_start_message_processing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val unregisterObject_ = fn x1 & x2 => (_import "g_dbus_connection_unregister_object" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Word32.val_ -> FFI.Bool.val_;) (x1, x2)
    val unregisterSubtree_ = fn x1 & x2 => (_import "g_dbus_connection_unregister_subtree" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Word32.val_ -> FFI.Bool.val_;) (x1, x2)
    type 'a class_t = 'a GioDBusConnectionClass.t
    type 'a asyncinitableclass_t = 'a GioAsyncInitableClass.t
    type 'a initableclass_t = 'a GioInitableClass.t
    type 'a unixfdlistclass_t = 'a GioUnixFDListClass.t
    type dbuscallflags_t = GioDBusCallFlags.t
    type 'a credentialsclass_t = 'a GioCredentialsClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type dbussendmessageflags_t = GioDBusSendMessageFlags.t
    type 'a dbusmessageclass_t = 'a GioDBusMessageClass.t
    type 'a dbusauthobserverclass_t = 'a GioDBusAuthObserverClass.t
    type dbuscapabilityflags_t = GioDBusCapabilityFlags.t
    type dbusconnectionflags_t = GioDBusConnectionFlags.t
    type 'a iostreamclass_t = 'a GioIOStreamClass.t
    fun asAsyncInitable self = (GObjectObjectClass.C.withPtr ---> GioAsyncInitableClass.C.fromPtr false) I self
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFinish res = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioDBusConnectionClass.C.fromPtr true) newFinish_ (res & [])
    fun newForAddressFinish res = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioDBusConnectionClass.C.fromPtr true) newForAddressFinish_ (res & [])
    fun newForAddressSync address flags observer cancellable =
      (
        FFI.String.withConstPtr
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
         &&&> FFI.String.withConstOptPtr
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibVariantRecord.C.withOptPtr
         &&&> GLibVariantTypeRecord.C.withOptPtr
         &&&> GioDBusCallFlags.C.withVal
         &&&> FFI.Int32.withVal
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
             &&&> FFI.String.withConstPtr
             &&&> FFI.String.withConstPtr
             &&&> FFI.String.withConstPtr
             &&&> FFI.String.withConstPtr
             &&&> GLibVariantRecord.C.withOptPtr
             &&&> GLibVariantTypeRecord.C.withOptPtr
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
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstOptPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibVariantRecord.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
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
         ---> FFI.Bool.fromVal
      )
        flushSync_
        (
          self
           & cancellable
           & []
        )
    fun getCapabilities self = (GObjectObjectClass.C.withPtr ---> GioDBusCapabilityFlags.C.fromVal) getCapabilities_ self
    fun getExitOnClose self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getExitOnClose_ self
    fun getGuid self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getGuid_ self
    fun getPeerCredentials self = (GObjectObjectClass.C.withPtr ---> GioCredentialsClass.C.fromPtr false) getPeerCredentials_ self
    fun getStream self = (GObjectObjectClass.C.withPtr ---> GioIOStreamClass.C.fromPtr false) getStream_ self
    fun getUniqueName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getUniqueName_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isClosed_ self
    fun removeFilter self filterId = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> I) removeFilter_ (self & filterId)
    fun sendMessage self message flags =
      let
        val outSerial & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GioDBusSendMessageFlags.C.withVal
             &&&> FFI.Word32.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Word32.fromVal && FFI.Bool.fromVal
          )
            sendMessage_
            (
              self
               & message
               & flags
               & 0
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
             &&&> FFI.Int32.withVal
             &&&> FFI.Word32.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Word32.fromVal && GioDBusMessageClass.C.fromPtr true
          )
            sendMessageWithReplySync_
            (
              self
               & message
               & flags
               & timeoutMsec
               & 0
               & cancellable
               & []
            )
      in
        (retVal, outSerial)
      end
    fun setExitOnClose self exitOnClose = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setExitOnClose_ (self & exitOnClose)
    fun signalUnsubscribe self subscriptionId = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> I) signalUnsubscribe_ (self & subscriptionId)
    fun startMessageProcessing self = (GObjectObjectClass.C.withPtr ---> I) startMessageProcessing_ self
    fun unregisterObject self registrationId = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> FFI.Bool.fromVal) unregisterObject_ (self & registrationId)
    fun unregisterSubtree self registrationId = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> FFI.Bool.fromVal) unregisterSubtree_ (self & registrationId)
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
