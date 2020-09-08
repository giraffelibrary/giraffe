structure GioMountOperation :>
  GIO_MOUNT_OPERATION
    where type 'a class = 'a GioMountOperationClass.class
    where type ask_password_flags_t = GioAskPasswordFlags.t
    where type mount_operation_result_t = GioMountOperationResult.t
    where type password_save_t = GioPasswordSave.t =
  struct
    val getType_ = _import "g_mount_operation_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_mount_operation_new" : unit -> GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p;
    val getAnonymous_ = _import "g_mount_operation_get_anonymous" : GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p -> GBool.FFI.val_;
    val getChoice_ = _import "g_mount_operation_get_choice" : GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p -> GInt32.FFI.val_;
    val getDomain_ = _import "g_mount_operation_get_domain" : GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPassword_ = _import "g_mount_operation_get_password" : GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPasswordSave_ = _import "g_mount_operation_get_password_save" : GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p -> GioPasswordSave.FFI.val_;
    val getUsername_ = _import "g_mount_operation_get_username" : GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val reply_ = fn x1 & x2 => (_import "g_mount_operation_reply" : GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p * GioMountOperationResult.FFI.val_ -> unit;) (x1, x2)
    val setAnonymous_ = fn x1 & x2 => (_import "g_mount_operation_set_anonymous" : GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setChoice_ = fn x1 & x2 => (_import "g_mount_operation_set_choice" : GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setDomain_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_mount_operation_set_domain" :
              GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPasswordSave_ = fn x1 & x2 => (_import "g_mount_operation_set_password_save" : GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p * GioPasswordSave.FFI.val_ -> unit;) (x1, x2)
    val setUsername_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_mount_operation_set_username" :
              GioMountOperationClass.FFI.non_opt GioMountOperationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    fun getAnonymous self = (GioMountOperationClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAnonymous_ self
    fun getChoice self = (GioMountOperationClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getChoice_ self
    fun getDomain self = (GioMountOperationClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDomain_ self
    fun getPassword self = (GioMountOperationClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getPassword_ self
    fun getPasswordSave self = (GioMountOperationClass.FFI.withPtr false ---> GioPasswordSave.FFI.fromVal) getPasswordSave_ self
    fun getUsername self = (GioMountOperationClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getUsername_ self
    fun reply self result = (GioMountOperationClass.FFI.withPtr false &&&> GioMountOperationResult.FFI.withVal ---> I) reply_ (self & result)
    fun setAnonymous self anonymous = (GioMountOperationClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAnonymous_ (self & anonymous)
    fun setChoice self choice = (GioMountOperationClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setChoice_ (self & choice)
    fun setDomain self domain = (GioMountOperationClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setDomain_ (self & domain)
    fun setPassword self password = (GioMountOperationClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setPassword_ (self & password)
    fun setPasswordSave self save = (GioMountOperationClass.FFI.withPtr false &&&> GioPasswordSave.FFI.withVal ---> I) setPasswordSave_ (self & save)
    fun setUsername self username = (GioMountOperationClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setUsername_ (self & username)
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
                f
                  (
                    message,
                    defaultUser,
                    defaultDomain,
                    flags
                  )
          )
      fun askQuestionSig f = signal "ask-question" (get 0w1 string &&&> get 0w2 Utf8CPtrArray.t ---> ret_void) (fn message & choices => f (message, choices))
      fun replySig f = signal "reply" (get 0w1 GioMountOperationResult.t ---> ret_void) f
      fun showUnmountProgressSig f =
        signal "show-unmount-progress"
          (
            get 0w1 string
             &&&> get 0w2 long
             &&&> get 0w3 long
             ---> ret_void
          )
          (
            fn
              message
               & timeLeft
               & bytesLeft =>
                f
                  (
                    message,
                    timeLeft,
                    bytesLeft
                  )
          )
    end
    local
      open ValueAccessor
    in
      val anonymousProp =
        {
          name = "anonymous",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val choiceProp =
        {
          name = "choice",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val domainProp =
        {
          name = "domain",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val passwordProp =
        {
          name = "password",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val passwordSaveProp =
        {
          name = "password-save",
          gtype = fn () => C.gtype GioPasswordSave.t (),
          get = fn x => fn () => C.get GioPasswordSave.t x,
          set = fn x => C.set GioPasswordSave.t x,
          init = fn x => C.set GioPasswordSave.t x
        }
      val usernameProp =
        {
          name = "username",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
