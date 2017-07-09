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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_application_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_application_new") (Utf8.PolyML.cInPtr &&> GioApplicationFlags.PolyML.cVal --> GioApplicationClass.PolyML.cPtr)
      val idIsValid_ = call (getSymbol "g_application_id_is_valid") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val activate_ = call (getSymbol "g_application_activate") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val getApplicationId_ = call (getSymbol "g_application_get_application_id") (GioApplicationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (getSymbol "g_application_get_flags") (GioApplicationClass.PolyML.cPtr --> GioApplicationFlags.PolyML.cVal)
      val getInactivityTimeout_ = call (getSymbol "g_application_get_inactivity_timeout") (GioApplicationClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getIsRegistered_ = call (getSymbol "g_application_get_is_registered") (GioApplicationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsRemote_ = call (getSymbol "g_application_get_is_remote") (GioApplicationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hold_ = call (getSymbol "g_application_hold") (GioApplicationClass.PolyML.cPtr --> cVoid)
      val open_ =
        call (getSymbol "g_application_open")
          (
            GioApplicationClass.PolyML.cPtr
             &&> GioFileClassCVectorN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
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
             &&> Utf8CVectorN.PolyML.cInOptPtr
             --> GInt.PolyML.cVal
          )
      val setActionGroup_ = call (getSymbol "g_application_set_action_group") (GioApplicationClass.PolyML.cPtr &&> GioActionGroupClass.PolyML.cOptPtr --> cVoid)
      val setApplicationId_ = call (getSymbol "g_application_set_application_id") (GioApplicationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setFlags_ = call (getSymbol "g_application_set_flags") (GioApplicationClass.PolyML.cPtr &&> GioApplicationFlags.PolyML.cVal --> cVoid)
      val setInactivityTimeout_ = call (getSymbol "g_application_set_inactivity_timeout") (GioApplicationClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioApplicationClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a application_command_line_class = 'a GioApplicationCommandLineClass.class
    type 'a file_class = 'a GioFileClass.class
    type 'a action_group_class = 'a GioActionGroupClass.class
    type application_flags_t = GioApplicationFlags.t
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr ---> GioActionGroupClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new applicationId flags = (Utf8.FFI.withPtr &&&> GioApplicationFlags.FFI.withVal ---> GioApplicationClass.FFI.fromPtr true) new_ (applicationId & flags)
    fun idIsValid applicationId = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) idIsValid_ applicationId
    fun activate self = (GioApplicationClass.FFI.withPtr ---> I) activate_ self
    fun getApplicationId self = (GioApplicationClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getApplicationId_ self
    fun getFlags self = (GioApplicationClass.FFI.withPtr ---> GioApplicationFlags.FFI.fromVal) getFlags_ self
    fun getInactivityTimeout self = (GioApplicationClass.FFI.withPtr ---> GUInt.FFI.fromVal) getInactivityTimeout_ self
    fun getIsRegistered self = (GioApplicationClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsRegistered_ self
    fun getIsRemote self = (GioApplicationClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsRemote_ self
    fun hold self = (GioApplicationClass.FFI.withPtr ---> I) hold_ self
    fun open' self files hint =
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
         ---> GBool.FFI.fromVal
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
                f (files (LargeInt.toInt nFiles)) hint
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
