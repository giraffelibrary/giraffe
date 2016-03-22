structure GioMountOperation :>
  GIO_MOUNT_OPERATION
    where type 'a class = 'a GioMountOperationClass.class
    where type ask_password_flags_t = GioAskPasswordFlags.t
    where type mount_operation_result_t = GioMountOperationResult.t
    where type password_save_t = GioPasswordSave.t =
  struct
    val getType_ = _import "g_mount_operation_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_mount_operation_new" : unit -> GioMountOperationClass.C.notnull GioMountOperationClass.C.p;
    val getAnonymous_ = _import "g_mount_operation_get_anonymous" : GioMountOperationClass.C.notnull GioMountOperationClass.C.p -> FFI.Bool.C.val_;
    val getChoice_ = _import "g_mount_operation_get_choice" : GioMountOperationClass.C.notnull GioMountOperationClass.C.p -> FFI.Int32.C.val_;
    val getDomain_ = _import "g_mount_operation_get_domain" : GioMountOperationClass.C.notnull GioMountOperationClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getPassword_ = _import "g_mount_operation_get_password" : GioMountOperationClass.C.notnull GioMountOperationClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getPasswordSave_ = _import "g_mount_operation_get_password_save" : GioMountOperationClass.C.notnull GioMountOperationClass.C.p -> GioPasswordSave.C.val_;
    val getUsername_ = _import "g_mount_operation_get_username" : GioMountOperationClass.C.notnull GioMountOperationClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val reply_ = fn x1 & x2 => (_import "g_mount_operation_reply" : GioMountOperationClass.C.notnull GioMountOperationClass.C.p * GioMountOperationResult.C.val_ -> unit;) (x1, x2)
    val setAnonymous_ = fn x1 & x2 => (_import "g_mount_operation_set_anonymous" : GioMountOperationClass.C.notnull GioMountOperationClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setChoice_ = fn x1 & x2 => (_import "g_mount_operation_set_choice" : GioMountOperationClass.C.notnull GioMountOperationClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setDomain_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_mount_operation_set_domain" :
              GioMountOperationClass.C.notnull GioMountOperationClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPassword_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_mount_operation_set_password" :
              GioMountOperationClass.C.notnull GioMountOperationClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPasswordSave_ = fn x1 & x2 => (_import "g_mount_operation_set_password_save" : GioMountOperationClass.C.notnull GioMountOperationClass.C.p * GioPasswordSave.C.val_ -> unit;) (x1, x2)
    val setUsername_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_mount_operation_set_username" :
              GioMountOperationClass.C.notnull GioMountOperationClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioMountOperationClass.class
    type ask_password_flags_t = GioAskPasswordFlags.t
    type mount_operation_result_t = GioMountOperationResult.t
    type password_save_t = GioPasswordSave.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioMountOperationClass.C.fromPtr true) new_ ()
    fun getAnonymous self = (GioMountOperationClass.C.withPtr ---> FFI.Bool.C.fromVal) getAnonymous_ self
    fun getChoice self = (GioMountOperationClass.C.withPtr ---> FFI.Int32.C.fromVal) getChoice_ self
    fun getDomain self = (GioMountOperationClass.C.withPtr ---> Utf8.C.fromPtr false) getDomain_ self
    fun getPassword self = (GioMountOperationClass.C.withPtr ---> Utf8.C.fromPtr false) getPassword_ self
    fun getPasswordSave self = (GioMountOperationClass.C.withPtr ---> GioPasswordSave.C.fromVal) getPasswordSave_ self
    fun getUsername self = (GioMountOperationClass.C.withPtr ---> Utf8.C.fromPtr false) getUsername_ self
    fun reply self result = (GioMountOperationClass.C.withPtr &&&> GioMountOperationResult.C.withVal ---> I) reply_ (self & result)
    fun setAnonymous self anonymous = (GioMountOperationClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAnonymous_ (self & anonymous)
    fun setChoice self choice = (GioMountOperationClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setChoice_ (self & choice)
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
