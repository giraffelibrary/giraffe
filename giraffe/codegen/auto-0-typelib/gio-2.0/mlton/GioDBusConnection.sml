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
    val getType_ = _import "g_dbus_connection_get_type" : unit -> GObjectType.FFI.val_;
    val newFinish_ = fn x1 & x2 => (_import "g_dbus_connection_new_finish" : GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p;) (x1, x2)
    val newForAddressFinish_ = fn x1 & x2 => (_import "g_dbus_connection_new_for_address_finish" : GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p;) (x1, x2)
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioDBusConnectionFlags.FFI.val_
               * GioDBusAuthObserverClass.FFI.opt GioDBusAuthObserverClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p;
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
              GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GioDBusConnectionFlags.FFI.val_
               * GioDBusAuthObserverClass.FFI.opt GioDBusAuthObserverClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p;
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
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
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
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               * GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p
               * GioDBusCallFlags.FFI.val_
               * GInt32.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
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
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * (GioUnixFDListClass.FFI.opt, GioUnixFDListClass.FFI.non_opt) GioUnixFDListClass.FFI.r
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
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
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               * GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p
               * GioDBusCallFlags.FFI.val_
               * GInt32.FFI.val_
               * GioUnixFDListClass.FFI.opt GioUnixFDListClass.FFI.p
               * (GioUnixFDListClass.FFI.opt, GioUnixFDListClass.FFI.non_opt) GioUnixFDListClass.FFI.r
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
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
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
    val exportActionGroup_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_dbus_connection_export_action_group" :
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioActionGroupClass.FFI.non_opt GioActionGroupClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val exportMenuModel_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_dbus_connection_export_menu_model" :
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val flushFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_connection_flush_finish" :
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getCapabilities_ = _import "g_dbus_connection_get_capabilities" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p -> GioDBusCapabilityFlags.FFI.val_;
    val getExitOnClose_ = _import "g_dbus_connection_get_exit_on_close" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p -> GBool.FFI.val_;
    val getGuid_ = _import "g_dbus_connection_get_guid" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getLastSerial_ = _import "g_dbus_connection_get_last_serial" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p -> GUInt32.FFI.val_;
    val getPeerCredentials_ = _import "g_dbus_connection_get_peer_credentials" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p -> GioCredentialsClass.FFI.opt GioCredentialsClass.FFI.p;
    val getStream_ = _import "g_dbus_connection_get_stream" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p -> GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p;
    val getUniqueName_ = _import "g_dbus_connection_get_unique_name" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val isClosed_ = _import "g_dbus_connection_is_closed" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p -> GBool.FFI.val_;
    val registerObject_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_g_dbus_connection_register_object_with_closures" :
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioDBusInterfaceInfoRecord.FFI.non_opt GioDBusInterfaceInfoRecord.FFI.p
               * GObjectClosureRecord.FFI.opt GObjectClosureRecord.FFI.p
               * GObjectClosureRecord.FFI.opt GObjectClosureRecord.FFI.p
               * GObjectClosureRecord.FFI.opt GObjectClosureRecord.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt32.FFI.val_;
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
    val removeFilter_ = fn x1 & x2 => (_import "g_dbus_connection_remove_filter" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val sendMessage_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_dbus_connection_send_message" :
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * GioDBusMessageClass.FFI.non_opt GioDBusMessageClass.FFI.p
               * GioDBusSendMessageFlags.FFI.val_
               * GUInt32.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioDBusMessageClass.FFI.non_opt GioDBusMessageClass.FFI.p;
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
              GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p
               * GioDBusMessageClass.FFI.non_opt GioDBusMessageClass.FFI.p
               * GioDBusSendMessageFlags.FFI.val_
               * GInt32.FFI.val_
               * GUInt32.FFI.ref_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioDBusMessageClass.FFI.non_opt GioDBusMessageClass.FFI.p;
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
    val setExitOnClose_ = fn x1 & x2 => (_import "g_dbus_connection_set_exit_on_close" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val signalUnsubscribe_ = fn x1 & x2 => (_import "g_dbus_connection_signal_unsubscribe" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val startMessageProcessing_ = _import "g_dbus_connection_start_message_processing" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p -> unit;
    val unexportActionGroup_ = fn x1 & x2 => (_import "g_dbus_connection_unexport_action_group" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val unexportMenuModel_ = fn x1 & x2 => (_import "g_dbus_connection_unexport_menu_model" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val unregisterObject_ = fn x1 & x2 => (_import "g_dbus_connection_unregister_object" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p * GUInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val unregisterSubtree_ = fn x1 & x2 => (_import "g_dbus_connection_unregister_subtree" : GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p * GUInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
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
    fun getGuid self = (GioDBusConnectionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getGuid_ self
    fun getLastSerial self = (GioDBusConnectionClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getLastSerial_ self
    fun getPeerCredentials self = (GioDBusConnectionClass.FFI.withPtr false ---> GioCredentialsClass.FFI.fromOptPtr false) getPeerCredentials_ self
    fun getStream self = (GioDBusConnectionClass.FFI.withPtr false ---> GioIOStreamClass.FFI.fromPtr false) getStream_ self
    fun getUniqueName self = (GioDBusConnectionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getUniqueName_ self
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
      open Property
    in
      val addressProp = {new = fn x => new "address" stringOpt x}
      val authenticationObserverProp = {new = fn x => new "authentication-observer" GioDBusAuthObserverClass.tOpt x}
      val capabilitiesProp = {get = fn x => get "capabilities" GioDBusCapabilityFlags.t x}
      val closedProp = {get = fn x => get "closed" boolean x}
      val exitOnCloseProp =
        {
          get = fn x => get "exit-on-close" boolean x,
          set = fn x => set "exit-on-close" boolean x,
          new = fn x => new "exit-on-close" boolean x
        }
      val flagsProp = {new = fn x => new "flags" GioDBusConnectionFlags.t x}
      val guidProp =
        {
          get = fn x => get "guid" stringOpt x,
          new = fn x => new "guid" stringOpt x
        }
      val streamProp =
        {
          get = fn x => get "stream" GioIOStreamClass.tOpt x,
          new = fn x => new "stream" GioIOStreamClass.tOpt x
        }
      val uniqueNameProp = {get = fn x => get "unique-name" stringOpt x}
    end
  end
