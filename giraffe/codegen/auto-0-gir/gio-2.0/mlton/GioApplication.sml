structure GioApplication :>
  GIO_APPLICATION
    where type 'a class = 'a GioApplicationClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a application_command_line_class = 'a GioApplicationCommandLineClass.class
    where type 'a file_class = 'a GioFileClass.class
    where type 'a action_group_class = 'a GioActionGroupClass.class
    where type application_flags_t = GioApplicationFlags.t =
  struct
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    structure GioFileClassCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GioFileClass.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GioFileClassCVectorN = CVectorN(GioFileClassCVectorNType)
    val getType_ = _import "g_application_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_application_new" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GioApplicationFlags.FFI.val_
               -> GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val idIsValid_ = _import "mlton_g_application_id_is_valid" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val activate_ = _import "g_application_activate" : GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p -> unit;
    val getApplicationId_ = _import "g_application_get_application_id" : GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getFlags_ = _import "g_application_get_flags" : GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p -> GioApplicationFlags.FFI.val_;
    val getInactivityTimeout_ = _import "g_application_get_inactivity_timeout" : GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p -> GUInt.FFI.val_;
    val getIsRegistered_ = _import "g_application_get_is_registered" : GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p -> GBool.FFI.val_;
    val getIsRemote_ = _import "g_application_get_is_remote" : GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p -> GBool.FFI.val_;
    val hold_ = _import "g_application_hold" : GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p -> unit;
    val open_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6) =>
          (
            _import "mlton_g_application_open" :
              GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p
               * GioFileClassCVectorN.MLton.p1
               * GioFileClassCVectorN.FFI.notnull GioFileClassCVectorN.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
    val register_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_application_register" :
              GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val release_ = _import "g_application_release" : GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p -> unit;
    val run_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_g_application_run" :
              GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p
               * GInt.FFI.val_
               * Utf8CVectorN.MLton.p1
               * unit Utf8CVectorN.MLton.p2
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setActionGroup_ = fn x1 & x2 => (_import "g_application_set_action_group" : GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p * unit GioActionGroupClass.FFI.p -> unit;) (x1, x2)
    val setApplicationId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_application_set_application_id" :
              GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFlags_ = fn x1 & x2 => (_import "g_application_set_flags" : GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p * GioApplicationFlags.FFI.val_ -> unit;) (x1, x2)
    val setInactivityTimeout_ = fn x1 & x2 => (_import "g_application_set_inactivity_timeout" : GioApplicationClass.FFI.notnull GioApplicationClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioApplicationClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a application_command_line_class = 'a GioApplicationCommandLineClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a action_group_class = 'a GioActionGroupClass.class
    type application_flags_t = GioApplicationFlags.t
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr ---> GioActionGroupClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (applicationId, flags) = (Utf8.FFI.withPtr &&&> GioApplicationFlags.FFI.withVal ---> GioApplicationClass.FFI.fromPtr true) new_ (applicationId & flags)
    fun idIsValid applicationId = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) idIsValid_ applicationId
    fun activate self = (GioApplicationClass.FFI.withPtr ---> I) activate_ self
    fun getApplicationId self = (GioApplicationClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getApplicationId_ self
    fun getFlags self = (GioApplicationClass.FFI.withPtr ---> GioApplicationFlags.FFI.fromVal) getFlags_ self
    fun getInactivityTimeout self = (GioApplicationClass.FFI.withPtr ---> GUInt.FFI.fromVal) getInactivityTimeout_ self
    fun getIsRegistered self = (GioApplicationClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsRegistered_ self
    fun getIsRemote self = (GioApplicationClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsRemote_ self
    fun hold self = (GioApplicationClass.FFI.withPtr ---> I) hold_ self
    fun open' self (files, hint) =
      let
        val nFiles = LargeInt.fromInt (GioFileClassCVectorN.length files)
        val () =
          (
            GioApplicationClass.FFI.withPtr
             &&&> GioFileClassCVectorN.FFI.withPtr
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
            SOME argv => LargeInt.fromInt (Utf8CVectorN.length argv)
          | NONE => GInt.null
        val retVal =
          (
            GioApplicationClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> Utf8CVectorN.FFI.withOptPtr
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
    fun setActionGroup self actionGroup = (GioApplicationClass.FFI.withPtr &&&> GioActionGroupClass.FFI.withOptPtr ---> I) setActionGroup_ (self & actionGroup)
    fun setApplicationId self applicationId = (GioApplicationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setApplicationId_ (self & applicationId)
    fun setFlags self flags = (GioApplicationClass.FFI.withPtr &&&> GioApplicationFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun setInactivityTimeout self inactivityTimeout = (GioApplicationClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setInactivityTimeout_ (self & inactivityTimeout)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun commandLineSig f = signal "command-line" (get 0w1 GioApplicationCommandLineClass.t ---> ret int) f
      fun openSig f =
        signal "open"
          (
            get 0w1 GioFileClassCVectorN.t
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
