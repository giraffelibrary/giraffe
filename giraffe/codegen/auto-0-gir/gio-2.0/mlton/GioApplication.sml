structure GioApplication :>
  GIO_APPLICATION
    where type 'a class = 'a GioApplicationClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a application_command_line_class = 'a GioApplicationCommandLineClass.class
    where type 'a action_group_class = 'a GioActionGroupClass.class
    where type application_flags_t = GioApplicationFlags.t =
  struct
    val getType_ = _import "g_application_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_application_new" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GioApplicationFlags.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val idIsValid_ = _import "mlton_g_application_id_is_valid" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> FFI.Bool.C.val_;
    val activate_ = _import "g_application_activate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getApplicationId_ = _import "g_application_get_application_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getFlags_ = _import "g_application_get_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioApplicationFlags.C.val_;
    val getInactivityTimeout_ = _import "g_application_get_inactivity_timeout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt.C.val_;
    val getIsRegistered_ = _import "g_application_get_is_registered" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIsRemote_ = _import "g_application_get_is_remote" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val hold_ = _import "g_application_hold" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val register_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_application_register" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val release_ = _import "g_application_release" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setActionGroup_ = fn x1 & x2 => (_import "g_application_set_action_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setApplicationId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_application_set_application_id" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFlags_ = fn x1 & x2 => (_import "g_application_set_flags" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioApplicationFlags.C.val_ -> unit;) (x1, x2)
    val setInactivityTimeout_ = fn x1 & x2 => (_import "g_application_set_inactivity_timeout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
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
    fun activate self = (GObjectObjectClass.C.withPtr ---> I) activate_ self
    fun getApplicationId self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getApplicationId_ self
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GioApplicationFlags.C.fromVal) getFlags_ self
    fun getInactivityTimeout self = (GObjectObjectClass.C.withPtr ---> FFI.UInt.C.fromVal) getInactivityTimeout_ self
    fun getIsRegistered self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsRegistered_ self
    fun getIsRemote self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsRemote_ self
    fun hold self = (GObjectObjectClass.C.withPtr ---> I) hold_ self
    fun register self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
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
    fun setInactivityTimeout self inactivityTimeout = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setInactivityTimeout_ (self & inactivityTimeout)
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
