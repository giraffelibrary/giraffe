structure GioApplication :>
  GIO_APPLICATION
    where type 'a class_t = 'a GioApplicationClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a application_command_line_class_t = 'a GioApplicationCommandLineClass.t
    where type 'a action_group_class_t = 'a GioActionGroupClass.t
    where type application_flags_t = GioApplicationFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_application_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_application_new") (Utf8.PolyML.INPTR &&> GioApplicationFlags.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val idIsValid_ = call (load_sym libgio "g_application_id_is_valid") (Utf8.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val activate_ = call (load_sym libgio "g_application_activate") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getApplicationId_ = call (load_sym libgio "g_application_get_application_id") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getFlags_ = call (load_sym libgio "g_application_get_flags") (GObjectObjectClass.PolyML.PTR --> GioApplicationFlags.PolyML.VAL)
      val getInactivityTimeout_ = call (load_sym libgio "g_application_get_inactivity_timeout") (GObjectObjectClass.PolyML.PTR --> FFI.UInt32.PolyML.VAL)
      val getIsRegistered_ = call (load_sym libgio "g_application_get_is_registered") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getIsRemote_ = call (load_sym libgio "g_application_get_is_remote") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val hold_ = call (load_sym libgio "g_application_hold") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val register_ =
        call (load_sym libgio "g_application_register")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val release_ = call (load_sym libgio "g_application_release") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setActionGroup_ = call (load_sym libgio "g_application_set_action_group") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setApplicationId_ = call (load_sym libgio "g_application_set_application_id") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val setFlags_ = call (load_sym libgio "g_application_set_flags") (GObjectObjectClass.PolyML.PTR &&> GioApplicationFlags.PolyML.VAL --> FFI.PolyML.VOID)
      val setInactivityTimeout_ = call (load_sym libgio "g_application_set_inactivity_timeout") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioApplicationClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a application_command_line_class_t = 'a GioApplicationCommandLineClass.t
    type 'a action_group_class_t = 'a GioActionGroupClass.t
    type application_flags_t = GioApplicationFlags.t
    type t = base class_t
    fun asActionGroup self = (GObjectObjectClass.C.withPtr ---> GioActionGroupClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new applicationId flags = (Utf8.C.withPtr &&&> GioApplicationFlags.C.withVal ---> GioApplicationClass.C.fromPtr true) new_ (applicationId & flags)
    fun idIsValid applicationId = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) idIsValid_ applicationId
    fun activate self = (GObjectObjectClass.C.withPtr ---> I) activate_ self
    fun getApplicationId self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getApplicationId_ self
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GioApplicationFlags.C.fromVal) getFlags_ self
    fun getInactivityTimeout self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getInactivityTimeout_ self
    fun getIsRegistered self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsRegistered_ self
    fun getIsRemote self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsRemote_ self
    fun hold self = (GObjectObjectClass.C.withPtr ---> I) hold_ self
    fun register self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        register_
        (
          self
           & cancellable
           & []
        )
    fun release self = (GObjectObjectClass.C.withPtr ---> I) release_ self
    fun setActionGroup self actionGroup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setActionGroup_ (self & actionGroup)
    fun setApplicationId self applicationId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setApplicationId_ (self & applicationId)
    fun setFlags self flags = (GObjectObjectClass.C.withPtr &&&> GioApplicationFlags.C.withVal ---> I) setFlags_ (self & flags)
    fun setInactivityTimeout self inactivityTimeout = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setInactivityTimeout_ (self & inactivityTimeout)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun commandLineSig f = signal "command-line" (get 0w1 GioApplicationCommandLineClass.t ---> ret int) f
      fun startupSig f = signal "startup" (void ---> ret_void) f
    end
    local
      open Property
    in
      val actionGroupProp = {set = fn x => set "action-group" GioActionGroupClass.tOpt x}
      val applicationIdProp =
        {
          get = fn x => get "application-id" stringOpt x,
          set = fn x => set "application-id" stringOpt x
        }
      val flagsProp =
        {
          get = fn x => get "flags" GioApplicationFlags.t x,
          set = fn x => set "flags" GioApplicationFlags.t x
        }
      val inactivityTimeoutProp =
        {
          get = fn x => get "inactivity-timeout" uint x,
          set = fn x => set "inactivity-timeout" uint x
        }
      val isRegisteredProp = {get = fn x => get "is-registered" boolean x}
      val isRemoteProp = {get = fn x => get "is-remote" boolean x}
    end
  end
