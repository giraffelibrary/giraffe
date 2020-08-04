structure GioApplication :>
  GIO_APPLICATION
    where type 'a class = 'a GioApplicationClass.class
    where type 'a action_map_class = 'a GioActionMapClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a notification_class = 'a GioNotificationClass.class
    where type 'a application_command_line_class = 'a GioApplicationCommandLineClass.class
    where type file_class_c_ptr_array_n_t = GioFileClassCPtrArrayN.t
    where type 'a action_group_class = 'a GioActionGroupClass.class
    where type application_flags_t = GioApplicationFlags.t =
  struct
    val getType_ = _import "g_application_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_application_new" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GioApplicationFlags.FFI.val_
               -> GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefault_ = _import "g_application_get_default" : unit -> GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p;
    val idIsValid_ = _import "mlton_g_application_id_is_valid" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GBool.FFI.val_;
    val activate_ = _import "g_application_activate" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> unit;
    val addMainOption_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & (x7, x8)
         & (x9, x10) =>
          (
            _import "mlton_g_application_add_main_option" :
              GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GChar.FFI.val_
               * GLibOptionFlags.FFI.val_
               * GLibOptionArg.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
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
              x10
            )
    val addOptionGroup_ = fn x1 & x2 => (_import "g_application_add_option_group" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p * GLibOptionGroupRecord.FFI.non_opt GLibOptionGroupRecord.FFI.p -> unit;) (x1, x2)
    val bindBusyProperty_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_g_application_bind_busy_property" :
              GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p
               * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getApplicationId_ = _import "g_application_get_application_id" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getDbusConnection_ = _import "g_application_get_dbus_connection" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> GioDBusConnectionClass.FFI.non_opt GioDBusConnectionClass.FFI.p;
    val getDbusObjectPath_ = _import "g_application_get_dbus_object_path" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getFlags_ = _import "g_application_get_flags" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> GioApplicationFlags.FFI.val_;
    val getInactivityTimeout_ = _import "g_application_get_inactivity_timeout" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> GUInt.FFI.val_;
    val getIsBusy_ = _import "g_application_get_is_busy" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> GBool.FFI.val_;
    val getIsRegistered_ = _import "g_application_get_is_registered" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> GBool.FFI.val_;
    val getIsRemote_ = _import "g_application_get_is_remote" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> GBool.FFI.val_;
    val getResourceBasePath_ = _import "g_application_get_resource_base_path" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val hold_ = _import "g_application_hold" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> unit;
    val markBusy_ = _import "g_application_mark_busy" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> unit;
    val open_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6) =>
          (
            _import "mlton_g_application_open" :
              GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p
               * GioFileClassCPtrArrayN.MLton.p1
               * GioFileClassCPtrArrayN.FFI.non_opt GioFileClassCPtrArrayN.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val quit_ = _import "g_application_quit" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> unit;
    val register_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_application_register" :
              GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val release_ = _import "g_application_release" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> unit;
    val run_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_g_application_run" :
              GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p
               * GInt.FFI.val_
               * Utf8CPtrArrayN.MLton.p1
               * Utf8CPtrArrayN.FFI.opt Utf8CPtrArrayN.MLton.p2
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val sendNotification_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_application_send_notification" :
              GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GioNotificationClass.FFI.non_opt GioNotificationClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setActionGroup_ = fn x1 & x2 => (_import "g_application_set_action_group" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p * GioActionGroupClass.FFI.opt GioActionGroupClass.FFI.p -> unit;) (x1, x2)
    val setApplicationId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_application_set_application_id" :
              GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDefault_ = _import "g_application_set_default" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> unit;
    val setFlags_ = fn x1 & x2 => (_import "g_application_set_flags" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p * GioApplicationFlags.FFI.val_ -> unit;) (x1, x2)
    val setInactivityTimeout_ = fn x1 & x2 => (_import "g_application_set_inactivity_timeout" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setResourceBasePath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_application_set_resource_base_path" :
              GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unbindBusyProperty_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_g_application_unbind_busy_property" :
              GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p
               * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val unmarkBusy_ = _import "g_application_unmark_busy" : GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p -> unit;
    val withdrawNotification_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_application_withdraw_notification" :
              GioApplicationClass.FFI.non_opt GioApplicationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioApplicationClass.class
    type 'a action_map_class = 'a GioActionMapClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a notification_class = 'a GioNotificationClass.class
    type 'a application_command_line_class = 'a GioApplicationCommandLineClass.class
    type file_class_c_ptr_array_n_t = GioFileClassCPtrArrayN.t
    type 'a action_group_class = 'a GioActionGroupClass.class
    type application_flags_t = GioApplicationFlags.t
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr false ---> GioActionGroupClass.FFI.fromPtr false) I self
    fun asActionMap self = (GObjectObjectClass.FFI.withPtr false ---> GioActionMapClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (applicationId, flags) = (Utf8.FFI.withOptPtr 0 &&&> GioApplicationFlags.FFI.withVal ---> GioApplicationClass.FFI.fromPtr true) new_ (applicationId & flags)
    fun getDefault () = (I ---> GioApplicationClass.FFI.fromPtr false) getDefault_ ()
    fun idIsValid applicationId = (Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) idIsValid_ applicationId
    fun activate self = (GioApplicationClass.FFI.withPtr false ---> I) activate_ self
    fun addMainOption
      self
      (
        longName,
        shortName,
        flags,
        arg,
        description,
        argDescription
      ) =
      (
        GioApplicationClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GChar.FFI.withVal
         &&&> GLibOptionFlags.FFI.withVal
         &&&> GLibOptionArg.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        addMainOption_
        (
          self
           & longName
           & shortName
           & flags
           & arg
           & description
           & argDescription
        )
    fun addOptionGroup self group = (GioApplicationClass.FFI.withPtr false &&&> GLibOptionGroupRecord.FFI.withPtr true ---> I) addOptionGroup_ (self & group)
    fun bindBusyProperty self (object, property) =
      (
        GioApplicationClass.FFI.withPtr false
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        bindBusyProperty_
        (
          self
           & object
           & property
        )
    fun getApplicationId self = (GioApplicationClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getApplicationId_ self
    fun getDbusConnection self = (GioApplicationClass.FFI.withPtr false ---> GioDBusConnectionClass.FFI.fromPtr false) getDbusConnection_ self
    fun getDbusObjectPath self = (GioApplicationClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDbusObjectPath_ self
    fun getFlags self = (GioApplicationClass.FFI.withPtr false ---> GioApplicationFlags.FFI.fromVal) getFlags_ self
    fun getInactivityTimeout self = (GioApplicationClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getInactivityTimeout_ self
    fun getIsBusy self = (GioApplicationClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsBusy_ self
    fun getIsRegistered self = (GioApplicationClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsRegistered_ self
    fun getIsRemote self = (GioApplicationClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsRemote_ self
    fun getResourceBasePath self = (GioApplicationClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getResourceBasePath_ self
    fun hold self = (GioApplicationClass.FFI.withPtr false ---> I) hold_ self
    fun markBusy self = (GioApplicationClass.FFI.withPtr false ---> I) markBusy_ self
    fun open' self (files, hint) =
      let
        val nFiles = LargeInt.fromInt (GioFileClassCPtrArrayN.length files)
        val () =
          (
            GioApplicationClass.FFI.withPtr false
             &&&> GioFileClassCPtrArrayN.FFI.withPtr 0
             &&&> GInt.FFI.withVal
             &&&> Utf8.FFI.withPtr 0
             ---> I
          )
            open_
            (
              self
               & files
               & nFiles
               & hint
            )
      in
        ()
      end
    fun quit self = (GioApplicationClass.FFI.withPtr false ---> I) quit_ self
    fun register self cancellable =
      (
        GioApplicationClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        register_
        (
          self
           & cancellable
           & []
        )
    fun release self = (GioApplicationClass.FFI.withPtr false ---> I) release_ self
    fun run self argv =
      let
        val argc =
          case argv of
            SOME argv => LargeInt.fromInt (Utf8CPtrArrayN.length argv)
          | NONE => GInt.null
        val retVal =
          (
            GioApplicationClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> Utf8CPtrArrayN.FFI.withOptPtr 0
             ---> GInt.FFI.fromVal
          )
            run_
            (
              self
               & argc
               & argv
            )
      in
        retVal
      end
    fun sendNotification self (id, notification) =
      (
        GioApplicationClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GioNotificationClass.FFI.withPtr false
         ---> I
      )
        sendNotification_
        (
          self
           & id
           & notification
        )
    fun setActionGroup self actionGroup = (GioApplicationClass.FFI.withPtr false &&&> GioActionGroupClass.FFI.withOptPtr false ---> I) setActionGroup_ (self & actionGroup)
    fun setApplicationId self applicationId = (GioApplicationClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setApplicationId_ (self & applicationId)
    fun setDefault self = (GioApplicationClass.FFI.withPtr false ---> I) setDefault_ self
    fun setFlags self flags = (GioApplicationClass.FFI.withPtr false &&&> GioApplicationFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun setInactivityTimeout self inactivityTimeout = (GioApplicationClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setInactivityTimeout_ (self & inactivityTimeout)
    fun setResourceBasePath self resourcePath = (GioApplicationClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setResourceBasePath_ (self & resourcePath)
    fun unbindBusyProperty self (object, property) =
      (
        GioApplicationClass.FFI.withPtr false
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        unbindBusyProperty_
        (
          self
           & object
           & property
        )
    fun unmarkBusy self = (GioApplicationClass.FFI.withPtr false ---> I) unmarkBusy_ self
    fun withdrawNotification self id = (GioApplicationClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) withdrawNotification_ (self & id)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun commandLineSig f = signal "command-line" (get 0w1 GioApplicationCommandLineClass.t ---> ret int) f
      fun handleLocalOptionsSig f = signal "handle-local-options" (get 0w1 GLibVariantDictRecord.t ---> ret int) f
      fun openSig f =
        signal "open"
          (
            get 0w1 GioFileClassCPtrArrayN.t
             &&&> get 0w2 int
             &&&> get 0w3 string
             ---> ret_void
          )
          (
            fn
              files
               & nFiles
               & hint =>
                f (files (LargeInt.toInt nFiles), hint)
          )
      fun shutdownSig f = signal "shutdown" (void ---> ret_void) f
      fun startupSig f = signal "startup" (void ---> ret_void) f
    end
    local
      open Property
    in
      val actionGroupProp =
        {
          set = fn x => set "action-group" GioActionGroupClass.tOpt x,
          new = fn x => new "action-group" GioActionGroupClass.tOpt x
        }
      val applicationIdProp =
        {
          get = fn x => get "application-id" stringOpt x,
          set = fn x => set "application-id" stringOpt x,
          new = fn x => new "application-id" stringOpt x
        }
      val flagsProp =
        {
          get = fn x => get "flags" GioApplicationFlags.t x,
          set = fn x => set "flags" GioApplicationFlags.t x,
          new = fn x => new "flags" GioApplicationFlags.t x
        }
      val inactivityTimeoutProp =
        {
          get = fn x => get "inactivity-timeout" uint x,
          set = fn x => set "inactivity-timeout" uint x,
          new = fn x => new "inactivity-timeout" uint x
        }
      val isBusyProp = {get = fn x => get "is-busy" boolean x}
      val isRegisteredProp = {get = fn x => get "is-registered" boolean x}
      val isRemoteProp = {get = fn x => get "is-remote" boolean x}
      val resourceBasePathProp =
        {
          get = fn x => get "resource-base-path" stringOpt x,
          set = fn x => set "resource-base-path" stringOpt x,
          new = fn x => new "resource-base-path" stringOpt x
        }
    end
  end
