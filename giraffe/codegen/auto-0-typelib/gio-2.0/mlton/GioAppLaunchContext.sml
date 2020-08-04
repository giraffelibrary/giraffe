structure GioAppLaunchContext :>
  GIO_APP_LAUNCH_CONTEXT
    where type 'a class = 'a GioAppLaunchContextClass.class
    where type 'a app_info_class = 'a GioAppInfoClass.class =
  struct
    val getType_ = _import "g_app_launch_context_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_app_launch_context_new" : unit -> GioAppLaunchContextClass.FFI.non_opt GioAppLaunchContextClass.FFI.p;
    val getEnvironment_ = _import "g_app_launch_context_get_environment" : GioAppLaunchContextClass.FFI.non_opt GioAppLaunchContextClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val launchFailed_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_app_launch_context_launch_failed" :
              GioAppLaunchContextClass.FFI.non_opt GioAppLaunchContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setenv_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_app_launch_context_setenv" :
              GioAppLaunchContextClass.FFI.non_opt GioAppLaunchContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val unsetenv_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_app_launch_context_unsetenv" :
              GioAppLaunchContextClass.FFI.non_opt GioAppLaunchContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioAppLaunchContextClass.class
    type 'a app_info_class = 'a GioAppInfoClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioAppLaunchContextClass.FFI.fromPtr true) new_ ()
    fun getEnvironment self = (GioAppLaunchContextClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr ~1) getEnvironment_ self
    fun launchFailed self startupNotifyId = (GioAppLaunchContextClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) launchFailed_ (self & startupNotifyId)
    fun setenv self (variable, value) =
      (
        GioAppLaunchContextClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        setenv_
        (
          self
           & variable
           & value
        )
    fun unsetenv self variable = (GioAppLaunchContextClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) unsetenv_ (self & variable)
    local
      open ClosureMarshal Signal
    in
      fun launchFailedSig f = signal "launch-failed" (get 0w1 string ---> ret_void) f
      fun launchedSig f = signal "launched" (get 0w1 GioAppInfoClass.t &&&> get 0w2 GLibVariantRecord.t ---> ret_void) (fn info & platformData => f (info, platformData))
    end
  end
