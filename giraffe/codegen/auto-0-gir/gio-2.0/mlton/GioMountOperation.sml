structure GioMountOperation :>
  GIO_MOUNT_OPERATION
    where type 'a class_t = 'a GioMountOperationClass.t
    where type askpasswordflags_t = GioAskPasswordFlags.t
    where type mountoperationresult_t = GioMountOperationResult.t
    where type passwordsave_t = GioPasswordSave.t =
  struct
    val getType_ = _import "g_mount_operation_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_mount_operation_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAnonymous_ = _import "g_mount_operation_get_anonymous" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getChoice_ = _import "g_mount_operation_get_choice" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getDomain_ = _import "g_mount_operation_get_domain" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getPassword_ = _import "g_mount_operation_get_password" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getPasswordSave_ = _import "g_mount_operation_get_password_save" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioPasswordSave.C.val_;
    val getUsername_ = _import "g_mount_operation_get_username" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val reply_ = fn x1 & x2 => (_import "g_mount_operation_reply" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioMountOperationResult.C.val_ -> unit;) (x1, x2)
    val setAnonymous_ = fn x1 & x2 => (_import "g_mount_operation_set_anonymous" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setChoice_ = fn x1 & x2 => (_import "g_mount_operation_set_choice" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setDomain_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_mount_operation_set_domain" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPasswordSave_ = fn x1 & x2 => (_import "g_mount_operation_set_password_save" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioPasswordSave.C.val_ -> unit;) (x1, x2)
    val setUsername_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_mount_operation_set_username" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioMountOperationClass.t
    type askpasswordflags_t = GioAskPasswordFlags.t
    type mountoperationresult_t = GioMountOperationResult.t
    type passwordsave_t = GioPasswordSave.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioMountOperationClass.C.fromPtr true) new_ ()
    fun getAnonymous self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAnonymous_ self
    fun getChoice self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getChoice_ self
    fun getDomain self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDomain_ self
    fun getPassword self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getPassword_ self
    fun getPasswordSave self = (GObjectObjectClass.C.withPtr ---> GioPasswordSave.C.fromVal) getPasswordSave_ self
    fun getUsername self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getUsername_ self
    fun reply self result = (GObjectObjectClass.C.withPtr &&&> GioMountOperationResult.C.withVal ---> I) reply_ (self & result)
    fun setAnonymous self anonymous = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAnonymous_ (self & anonymous)
    fun setChoice self choice = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setChoice_ (self & choice)
    fun setDomain self domain = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setDomain_ (self & domain)
    fun setPassword self password = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setPassword_ (self & password)
    fun setPasswordSave self save = (GObjectObjectClass.C.withPtr &&&> GioPasswordSave.C.withVal ---> I) setPasswordSave_ (self & save)
    fun setUsername self username = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setUsername_ (self & username)
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
