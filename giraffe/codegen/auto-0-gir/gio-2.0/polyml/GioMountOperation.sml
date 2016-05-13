structure GioMountOperation :>
  GIO_MOUNT_OPERATION
    where type 'a class = 'a GioMountOperationClass.class
    where type ask_password_flags_t = GioAskPasswordFlags.t
    where type mount_operation_result_t = GioMountOperationResult.t
    where type password_save_t = GioPasswordSave.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_mount_operation_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_mount_operation_new") (PolyMLFFI.cVoid --> GioMountOperationClass.PolyML.cPtr)
      val getAnonymous_ = call (load_sym libgio "g_mount_operation_get_anonymous") (GioMountOperationClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getChoice_ = call (load_sym libgio "g_mount_operation_get_choice") (GioMountOperationClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getDomain_ = call (load_sym libgio "g_mount_operation_get_domain") (GioMountOperationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPassword_ = call (load_sym libgio "g_mount_operation_get_password") (GioMountOperationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPasswordSave_ = call (load_sym libgio "g_mount_operation_get_password_save") (GioMountOperationClass.PolyML.cPtr --> GioPasswordSave.PolyML.cVal)
      val getUsername_ = call (load_sym libgio "g_mount_operation_get_username") (GioMountOperationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val reply_ = call (load_sym libgio "g_mount_operation_reply") (GioMountOperationClass.PolyML.cPtr &&> GioMountOperationResult.PolyML.cVal --> PolyMLFFI.cVoid)
      val setAnonymous_ = call (load_sym libgio "g_mount_operation_set_anonymous") (GioMountOperationClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setChoice_ = call (load_sym libgio "g_mount_operation_set_choice") (GioMountOperationClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> PolyMLFFI.cVoid)
      val setDomain_ = call (load_sym libgio "g_mount_operation_set_domain") (GioMountOperationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setPassword_ = call (load_sym libgio "g_mount_operation_set_password") (GioMountOperationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setPasswordSave_ = call (load_sym libgio "g_mount_operation_set_password_save") (GioMountOperationClass.PolyML.cPtr &&> GioPasswordSave.PolyML.cVal --> PolyMLFFI.cVoid)
      val setUsername_ = call (load_sym libgio "g_mount_operation_set_username") (GioMountOperationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioMountOperationClass.class
    type ask_password_flags_t = GioAskPasswordFlags.t
    type mount_operation_result_t = GioMountOperationResult.t
    type password_save_t = GioPasswordSave.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioMountOperationClass.C.fromPtr true) new_ ()
    fun getAnonymous self = (GioMountOperationClass.C.withPtr ---> FFI.Bool.C.fromVal) getAnonymous_ self
    fun getChoice self = (GioMountOperationClass.C.withPtr ---> FFI.Int.C.fromVal) getChoice_ self
    fun getDomain self = (GioMountOperationClass.C.withPtr ---> Utf8.C.fromPtr false) getDomain_ self
    fun getPassword self = (GioMountOperationClass.C.withPtr ---> Utf8.C.fromPtr false) getPassword_ self
    fun getPasswordSave self = (GioMountOperationClass.C.withPtr ---> GioPasswordSave.C.fromVal) getPasswordSave_ self
    fun getUsername self = (GioMountOperationClass.C.withPtr ---> Utf8.C.fromPtr false) getUsername_ self
    fun reply self result = (GioMountOperationClass.C.withPtr &&&> GioMountOperationResult.C.withVal ---> I) reply_ (self & result)
    fun setAnonymous self anonymous = (GioMountOperationClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAnonymous_ (self & anonymous)
    fun setChoice self choice = (GioMountOperationClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setChoice_ (self & choice)
    fun setDomain self domain = (GioMountOperationClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDomain_ (self & domain)
    fun setPassword self password = (GioMountOperationClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setPassword_ (self & password)
    fun setPasswordSave self save = (GioMountOperationClass.C.withPtr &&&> GioPasswordSave.C.withVal ---> I) setPasswordSave_ (self & save)
    fun setUsername self username = (GioMountOperationClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setUsername_ (self & username)
    local
      open ClosureMarshal Signal
    in
      fun abortedSig f = signal "aborted" (void ---> ret_void) f
      fun askPasswordSig f =
        signal "ask-password"
          (
            get 0w1 string
             &&&> get 0w2 string
             &&&> get 0w3 string
             &&&> get 0w4 GioAskPasswordFlags.t
             ---> ret_void
          )
          (
            fn
              message
               & defaultUser
               & defaultDomain
               & flags =>
                f message defaultUser defaultDomain flags
          )
      fun replySig f = signal "reply" (get 0w1 GioMountOperationResult.t ---> ret_void) f
    end
    local
      open Property
    in
      val anonymousProp =
        {
          get = fn x => get "anonymous" boolean x,
          set = fn x => set "anonymous" boolean x
        }
      val choiceProp =
        {
          get = fn x => get "choice" int x,
          set = fn x => set "choice" int x
        }
      val domainProp =
        {
          get = fn x => get "domain" stringOpt x,
          set = fn x => set "domain" stringOpt x
        }
      val passwordProp =
        {
          get = fn x => get "password" stringOpt x,
          set = fn x => set "password" stringOpt x
        }
      val passwordSaveProp =
        {
          get = fn x => get "password-save" GioPasswordSave.t x,
          set = fn x => set "password-save" GioPasswordSave.t x
        }
      val usernameProp =
        {
          get = fn x => get "username" stringOpt x,
          set = fn x => set "username" stringOpt x
        }
    end
  end
