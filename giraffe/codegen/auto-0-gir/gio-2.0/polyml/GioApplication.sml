structure GioApplication :>
  GIO_APPLICATION
    where type 'a class = 'a GioApplicationClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a application_command_line_class = 'a GioApplicationCommandLineClass.class
    where type 'a action_group_class = 'a GioActionGroupClass.class
    where type application_flags_t = GioApplicationFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_application_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_application_new") (Utf8.PolyML.cInPtr &&> GioApplicationFlags.PolyML.cVal --> GioApplicationClass.PolyML.cPtr)
      val idIsValid_ = call (load_sym libgio "g_application_id_is_valid") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val activate_ = call (load_sym libgio "g_application_activate") (GioApplicationClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getApplicationId_ = call (load_sym libgio "g_application_get_application_id") (GioApplicationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (load_sym libgio "g_application_get_flags") (GioApplicationClass.PolyML.cPtr --> GioApplicationFlags.PolyML.cVal)
      val getInactivityTimeout_ = call (load_sym libgio "g_application_get_inactivity_timeout") (GioApplicationClass.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val getIsRegistered_ = call (load_sym libgio "g_application_get_is_registered") (GioApplicationClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIsRemote_ = call (load_sym libgio "g_application_get_is_remote") (GioApplicationClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hold_ = call (load_sym libgio "g_application_hold") (GioApplicationClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val register_ =
        call (load_sym libgio "g_application_register")
          (
            GioApplicationClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val release_ = call (load_sym libgio "g_application_release") (GioApplicationClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setActionGroup_ = call (load_sym libgio "g_application_set_action_group") (GioApplicationClass.PolyML.cPtr &&> GioActionGroupClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setApplicationId_ = call (load_sym libgio "g_application_set_application_id") (GioApplicationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setFlags_ = call (load_sym libgio "g_application_set_flags") (GioApplicationClass.PolyML.cPtr &&> GioApplicationFlags.PolyML.cVal --> FFI.PolyML.cVoid)
      val setInactivityTimeout_ = call (load_sym libgio "g_application_set_inactivity_timeout") (GioApplicationClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioApplicationClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a application_command_line_class = 'a GioApplicationCommandLineClass.class
    type 'a action_group_class = 'a GioActionGroupClass.class
    type application_flags_t = GioApplicationFlags.t
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.C.withPtr ---> GioActionGroupClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new applicationId flags = (Utf8.C.withPtr &&&> GioApplicationFlags.C.withVal ---> GioApplicationClass.C.fromPtr true) new_ (applicationId & flags)
    fun idIsValid applicationId = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) idIsValid_ applicationId
    fun activate self = (GioApplicationClass.C.withPtr ---> I) activate_ self
    fun getApplicationId self = (GioApplicationClass.C.withPtr ---> Utf8.C.fromPtr false) getApplicationId_ self
    fun getFlags self = (GioApplicationClass.C.withPtr ---> GioApplicationFlags.C.fromVal) getFlags_ self
    fun getInactivityTimeout self = (GioApplicationClass.C.withPtr ---> FFI.UInt.C.fromVal) getInactivityTimeout_ self
    fun getIsRegistered self = (GioApplicationClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsRegistered_ self
    fun getIsRemote self = (GioApplicationClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsRemote_ self
    fun hold self = (GioApplicationClass.C.withPtr ---> I) hold_ self
    fun register self cancellable =
      (
        GioApplicationClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        register_
        (
          self
           & cancellable
           & []
        )
    fun release self = (GioApplicationClass.C.withPtr ---> I) release_ self
    fun setActionGroup self actionGroup = (GioApplicationClass.C.withPtr &&&> GioActionGroupClass.C.withOptPtr ---> I) setActionGroup_ (self & actionGroup)
    fun setApplicationId self applicationId = (GioApplicationClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setApplicationId_ (self & applicationId)
    fun setFlags self flags = (GioApplicationClass.C.withPtr &&&> GioApplicationFlags.C.withVal ---> I) setFlags_ (self & flags)
    fun setInactivityTimeout self inactivityTimeout = (GioApplicationClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setInactivityTimeout_ (self & inactivityTimeout)
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
