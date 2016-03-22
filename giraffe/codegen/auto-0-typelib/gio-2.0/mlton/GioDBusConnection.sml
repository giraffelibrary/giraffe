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
    val getType_ = _import "g_dbus_connection_get_type" : unit -> GObjectType.C.val_;
    val newFinish_ = fn x1 & x2 => (_import "g_dbus_connection_new_finish" : GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p;) (x1, x2)
    val newForAddressFinish_ = fn x1 & x2 => (_import "g_dbus_connection_new_for_address_finish" : GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p;) (x1, x2)
    val newForAddressSync_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_dbus_connection_new_for_address_sync" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GioDBusConnectionFlags.C.val_
               * unit GioDBusAuthObserverClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p;
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
              GioIOStreamClass.C.notnull GioIOStreamClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GioDBusConnectionFlags.C.val_
               * unit GioDBusAuthObserverClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p;
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
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
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
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.C.p
               * unit GLibVariantTypeRecord.C.p
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
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
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
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.C.p
               * unit GLibVariantTypeRecord.C.p
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
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GLibVariantRecord.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getCapabilities_ = _import "g_dbus_connection_get_capabilities" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p -> GioDBusCapabilityFlags.C.val_;
    val getExitOnClose_ = _import "g_dbus_connection_get_exit_on_close" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p -> FFI.Bool.C.val_;
    val getGuid_ = _import "g_dbus_connection_get_guid" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getPeerCredentials_ = _import "g_dbus_connection_get_peer_credentials" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p -> GioCredentialsClass.C.notnull GioCredentialsClass.C.p;
    val getStream_ = _import "g_dbus_connection_get_stream" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p -> GioIOStreamClass.C.notnull GioIOStreamClass.C.p;
    val getUniqueName_ = _import "g_dbus_connection_get_unique_name" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val isClosed_ = _import "g_dbus_connection_is_closed" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p -> FFI.Bool.C.val_;
    val removeFilter_ = fn x1 & x2 => (_import "g_dbus_connection_remove_filter" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val sendMessage_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_dbus_connection_send_message" :
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
               * GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p
               * GioDBusSendMessageFlags.C.val_
               * FFI.UInt32.C.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p;
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
              GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p
               * GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p
               * GioDBusSendMessageFlags.C.val_
               * FFI.Int32.C.val_
               * FFI.UInt32.C.ref_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p;
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
    val setExitOnClose_ = fn x1 & x2 => (_import "g_dbus_connection_set_exit_on_close" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val signalUnsubscribe_ = fn x1 & x2 => (_import "g_dbus_connection_signal_unsubscribe" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val startMessageProcessing_ = _import "g_dbus_connection_start_message_processing" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p -> unit;
    val unregisterObject_ = fn x1 & x2 => (_import "g_dbus_connection_unregister_object" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p * FFI.UInt32.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val unregisterSubtree_ = fn x1 & x2 => (_import "g_dbus_connection_unregister_subtree" : GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p * FFI.UInt32.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
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
    fun newFinish res = (GioAsyncResultClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusConnectionClass.C.fromPtr true) newFinish_ (res & [])
    fun newForAddressFinish res = (GioAsyncResultClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioDBusConnectionClass.C.fromPtr true) newForAddressFinish_ (res & [])
    fun newForAddressSync address flags observer cancellable =
      (
        Utf8.C.withPtr
         &&&> GioDBusConnectionFlags.C.withVal
         &&&> GioDBusAuthObserverClass.C.withOptPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioIOStreamClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GioDBusConnectionFlags.C.withVal
         &&&> GioDBusAuthObserverClass.C.withOptPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioDBusConnectionClass.C.withPtr
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
    fun callSync self busName objectPath interfaceName methodName parameters replyType flags timeoutMsec cancellable =
      (
        GioDBusConnectionClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibVariantRecord.C.withOptPtr
         &&&> GLibVariantTypeRecord.C.withOptPtr
         &&&> GioDBusCallFlags.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
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
            GioDBusConnectionClass.C.withPtr
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
    fun callWithUnixFdListSync self busName objectPath interfaceName methodName parameters replyType flags timeoutMsec fdList cancellable =
      let
        val outFdList & retVal =
          (
            GioDBusConnectionClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> GLibVariantRecord.C.withOptPtr
             &&&> GLibVariantTypeRecord.C.withOptPtr
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
        GioDBusConnectionClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioDBusConnectionClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioDBusConnectionClass.C.withPtr
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
        GioDBusConnectionClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
        GioDBusConnectionClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        flushSync_
        (
          self
           & cancellable
           & []
        )
    fun getCapabilities self = (GioDBusConnectionClass.C.withPtr ---> GioDBusCapabilityFlags.C.fromVal) getCapabilities_ self
    fun getExitOnClose self = (GioDBusConnectionClass.C.withPtr ---> FFI.Bool.C.fromVal) getExitOnClose_ self
    fun getGuid self = (GioDBusConnectionClass.C.withPtr ---> Utf8.C.fromPtr false) getGuid_ self
    fun getPeerCredentials self = (GioDBusConnectionClass.C.withPtr ---> GioCredentialsClass.C.fromPtr false) getPeerCredentials_ self
    fun getStream self = (GioDBusConnectionClass.C.withPtr ---> GioIOStreamClass.C.fromPtr false) getStream_ self
    fun getUniqueName self = (GioDBusConnectionClass.C.withPtr ---> Utf8.C.fromPtr false) getUniqueName_ self
    fun isClosed self = (GioDBusConnectionClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun removeFilter self filterId = (GioDBusConnectionClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) removeFilter_ (self & filterId)
    fun sendMessage self message flags =
      let
        val outSerial & retVal =
          (
            GioDBusConnectionClass.C.withPtr
             &&&> GioDBusMessageClass.C.withPtr
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
        GioDBusConnectionClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
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
            GioDBusConnectionClass.C.withPtr
             &&&> GioDBusMessageClass.C.withPtr
             &&&> GioDBusSendMessageFlags.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.UInt32.C.withRefVal
             &&&> GioCancellableClass.C.withOptPtr
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
    fun setExitOnClose self exitOnClose = (GioDBusConnectionClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setExitOnClose_ (self & exitOnClose)
    fun signalUnsubscribe self subscriptionId = (GioDBusConnectionClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) signalUnsubscribe_ (self & subscriptionId)
    fun startMessageProcessing self = (GioDBusConnectionClass.C.withPtr ---> I) startMessageProcessing_ self
    fun unregisterObject self registrationId = (GioDBusConnectionClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> FFI.Bool.C.fromVal) unregisterObject_ (self & registrationId)
    fun unregisterSubtree self registrationId = (GioDBusConnectionClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> FFI.Bool.C.fromVal) unregisterSubtree_ (self & registrationId)
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
