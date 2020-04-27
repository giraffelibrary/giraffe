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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_application_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_application_new") (Utf8.PolyML.cInOptPtr &&> GioApplicationFlags.PolyML.cVal --> GioApplicationClass.PolyML.cPtr)
      val getDefault_ = call (getSymbol "g_application_get_default") (cVoid --> GioApplicationClass.PolyML.cPtr)
      val idIsValid_ = call (getSymbol "g_application_id_is_valid") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val activate_ = call (getSymbol "g_application_activate") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val addMainOption_ =
        call (getSymbol "g_application_add_main_option")
          (
            GioApplicationClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GChar.PolyML.cVal
             &&> GLibOptionFlags.PolyML.cVal
             &&> GLibOptionArg.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val bindBusyProperty_ =
        call (getSymbol "g_application_bind_busy_property")
          (
            GioApplicationClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val getApplicationId_ = call (getSymbol "g_application_get_application_id") (GioApplicationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDbusConnection_ = call (getSymbol "g_application_get_dbus_connection") (GioApplicationClass.PolyML.cPtr --> GioDBusConnectionClass.PolyML.cPtr)
      val getDbusObjectPath_ = call (getSymbol "g_application_get_dbus_object_path") (GioApplicationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (getSymbol "g_application_get_flags") (GioApplicationClass.PolyML.cPtr --> GioApplicationFlags.PolyML.cVal)
      val getInactivityTimeout_ = call (getSymbol "g_application_get_inactivity_timeout") (GioApplicationClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getIsBusy_ = call (getSymbol "g_application_get_is_busy") (GioApplicationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsRegistered_ = call (getSymbol "g_application_get_is_registered") (GioApplicationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsRemote_ = call (getSymbol "g_application_get_is_remote") (GioApplicationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getResourceBasePath_ = call (getSymbol "g_application_get_resource_base_path") (GioApplicationClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val hold_ = call (getSymbol "g_application_hold") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val markBusy_ = call (getSymbol "g_application_mark_busy") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val open_ =
        call (getSymbol "g_application_open")
          (
            GioApplicationClass.PolyML.cPtr
             &&> GioFileClassCPtrArrayN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val quit_ = call (getSymbol "g_application_quit") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val register_ =
        call (getSymbol "g_application_register")
          (
            GioApplicationClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val release_ = call (getSymbol "g_application_release") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val run_ =
        call (getSymbol "g_application_run")
          (
            GioApplicationClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8CPtrArrayN.PolyML.cInOptPtr
             --> GInt.PolyML.cVal
          )
      val sendNotification_ =
        call (getSymbol "g_application_send_notification")
          (
            GioApplicationClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GioNotificationClass.PolyML.cPtr
             --> cVoid
          )
      val setActionGroup_ = call (getSymbol "g_application_set_action_group") (GioApplicationClass.PolyML.cPtr &&> GioActionGroupClass.PolyML.cOptPtr --> cVoid)
      val setApplicationId_ = call (getSymbol "g_application_set_application_id") (GioApplicationClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setDefault_ = call (getSymbol "g_application_set_default") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val setFlags_ = call (getSymbol "g_application_set_flags") (GioApplicationClass.PolyML.cPtr &&> GioApplicationFlags.PolyML.cVal --> cVoid)
      val setInactivityTimeout_ = call (getSymbol "g_application_set_inactivity_timeout") (GioApplicationClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val setResourceBasePath_ = call (getSymbol "g_application_set_resource_base_path") (GioApplicationClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val unbindBusyProperty_ =
        call (getSymbol "g_application_unbind_busy_property")
          (
            GioApplicationClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val unmarkBusy_ = call (getSymbol "g_application_unmark_busy") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val withdrawNotification_ = call (getSymbol "g_application_withdraw_notification") (GioApplicationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
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
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr ---> GioActionGroupClass.FFI.fromPtr false) I self
    fun asActionMap self = (GObjectObjectClass.FFI.withPtr ---> GioActionMapClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (applicationId, flags) = (Utf8.FFI.withOptPtr &&&> GioApplicationFlags.FFI.withVal ---> GioApplicationClass.FFI.fromPtr true) new_ (applicationId & flags)
    fun getDefault () = (I ---> GioApplicationClass.FFI.fromPtr false) getDefault_ ()
    fun idIsValid applicationId = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) idIsValid_ applicationId
    fun activate self = (GioApplicationClass.FFI.withPtr ---> I) activate_ self
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
        GioApplicationClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GChar.FFI.withVal
         &&&> GLibOptionFlags.FFI.withVal
         &&&> GLibOptionArg.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
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
    fun bindBusyProperty self (object, property) =
      (
        GioApplicationClass.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        bindBusyProperty_
        (
          self
           & object
           & property
        )
    fun getApplicationId self = (GioApplicationClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getApplicationId_ self
    fun getDbusConnection self = (GioApplicationClass.FFI.withPtr ---> GioDBusConnectionClass.FFI.fromPtr false) getDbusConnection_ self
    fun getDbusObjectPath self = (GioApplicationClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDbusObjectPath_ self
    fun getFlags self = (GioApplicationClass.FFI.withPtr ---> GioApplicationFlags.FFI.fromVal) getFlags_ self
    fun getInactivityTimeout self = (GioApplicationClass.FFI.withPtr ---> GUInt.FFI.fromVal) getInactivityTimeout_ self
    fun getIsBusy self = (GioApplicationClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsBusy_ self
    fun getIsRegistered self = (GioApplicationClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsRegistered_ self
    fun getIsRemote self = (GioApplicationClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsRemote_ self
    fun getResourceBasePath self = (GioApplicationClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getResourceBasePath_ self
    fun hold self = (GioApplicationClass.FFI.withPtr ---> I) hold_ self
    fun markBusy self = (GioApplicationClass.FFI.withPtr ---> I) markBusy_ self
    fun open' self (files, hint) =
      let
        val nFiles = LargeInt.fromInt (GioFileClassCPtrArrayN.length files)
        val () =
          (
            GioApplicationClass.FFI.withPtr
             &&&> GioFileClassCPtrArrayN.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> Utf8.FFI.withPtr
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
    fun quit self = (GioApplicationClass.FFI.withPtr ---> I) quit_ self
    fun register self cancellable =
      (
        GioApplicationClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        register_
        (
          self
           & cancellable
           & []
        )
    fun release self = (GioApplicationClass.FFI.withPtr ---> I) release_ self
    fun run self argv =
      let
        val argc =
          case argv of
            SOME argv => LargeInt.fromInt (Utf8CPtrArrayN.length argv)
          | NONE => GInt.null
        val retVal =
          (
            GioApplicationClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> Utf8CPtrArrayN.FFI.withOptPtr
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
        GioApplicationClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GioNotificationClass.FFI.withPtr
         ---> I
      )
        sendNotification_
        (
          self
           & id
           & notification
        )
    fun setActionGroup self actionGroup = (GioApplicationClass.FFI.withPtr &&&> GioActionGroupClass.FFI.withOptPtr ---> I) setActionGroup_ (self & actionGroup)
    fun setApplicationId self applicationId = (GioApplicationClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setApplicationId_ (self & applicationId)
    fun setDefault self = (GioApplicationClass.FFI.withPtr ---> I) setDefault_ self
    fun setFlags self flags = (GioApplicationClass.FFI.withPtr &&&> GioApplicationFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun setInactivityTimeout self inactivityTimeout = (GioApplicationClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setInactivityTimeout_ (self & inactivityTimeout)
    fun setResourceBasePath self resourcePath = (GioApplicationClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setResourceBasePath_ (self & resourcePath)
    fun unbindBusyProperty self (object, property) =
      (
        GioApplicationClass.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        unbindBusyProperty_
        (
          self
           & object
           & property
        )
    fun unmarkBusy self = (GioApplicationClass.FFI.withPtr ---> I) unmarkBusy_ self
    fun withdrawNotification self id = (GioApplicationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) withdrawNotification_ (self & id)
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
