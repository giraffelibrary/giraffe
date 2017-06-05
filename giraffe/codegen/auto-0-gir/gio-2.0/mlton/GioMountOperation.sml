structure GioMountOperation :>
  GIO_MOUNT_OPERATION
    where type 'a class = 'a GioMountOperationClass.class
    where type ask_password_flags_t = GioAskPasswordFlags.t
    where type mount_operation_result_t = GioMountOperationResult.t
    where type password_save_t = GioPasswordSave.t =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    val getType_ = _import "g_mount_operation_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_mount_operation_new" : unit -> GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p;
    val getAnonymous_ = _import "g_mount_operation_get_anonymous" : GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p -> GBool.FFI.val_;
    val getChoice_ = _import "g_mount_operation_get_choice" : GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p -> GInt.FFI.val_;
    val getDomain_ = _import "g_mount_operation_get_domain" : GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPassword_ = _import "g_mount_operation_get_password" : GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPasswordSave_ = _import "g_mount_operation_get_password_save" : GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p -> GioPasswordSave.FFI.val_;
    val getUsername_ = _import "g_mount_operation_get_username" : GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val reply_ = fn x1 & x2 => (_import "g_mount_operation_reply" : GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p * GioMountOperationResult.FFI.val_ -> unit;) (x1, x2)
    val setAnonymous_ = fn x1 & x2 => (_import "g_mount_operation_set_anonymous" : GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setChoice_ = fn x1 & x2 => (_import "g_mount_operation_set_choice" : GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setDomain_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_mount_operation_set_domain" :
              GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPasswordSave_ = fn x1 & x2 => (_import "g_mount_operation_set_password_save" : GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p * GioPasswordSave.FFI.val_ -> unit;) (x1, x2)
    val setUsername_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_mount_operation_set_username" :
              GioMountOperationClass.FFI.notnull GioMountOperationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioMountOperationClass.FFI.fromPtr true) new_ ()
    fun getAnonymous self = (GioMountOperationClass.FFI.withPtr ---> GBool.FFI.fromVal) getAnonymous_ self
    fun getChoice self = (GioMountOperationClass.FFI.withPtr ---> GInt.FFI.fromVal) getChoice_ self
    fun getDomain self = (GioMountOperationClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDomain_ self
    fun getPassword self = (GioMountOperationClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPassword_ self
    fun getPasswordSave self = (GioMountOperationClass.FFI.withPtr ---> GioPasswordSave.FFI.fromVal) getPasswordSave_ self
    fun getUsername self = (GioMountOperationClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getUsername_ self
    fun reply self result = (GioMountOperationClass.FFI.withPtr &&&> GioMountOperationResult.FFI.withVal ---> I) reply_ (self & result)
    fun setAnonymous self anonymous = (GioMountOperationClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAnonymous_ (self & anonymous)
    fun setChoice self choice = (GioMountOperationClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setChoice_ (self & choice)
    fun setDomain self domain = (GioMountOperationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setDomain_ (self & domain)
    fun setPassword self password = (GioMountOperationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setPassword_ (self & password)
    fun setPasswordSave self save = (GioMountOperationClass.FFI.withPtr &&&> GioPasswordSave.FFI.withVal ---> I) setPasswordSave_ (self & save)
    fun setUsername self username = (GioMountOperationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setUsername_ (self & username)
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
      fun askQuestionSig f = signal "ask-question" (get 0w1 string &&&> get 0w2 Utf8CVector.t ---> ret_void) (fn message & choices => f message choices)
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
