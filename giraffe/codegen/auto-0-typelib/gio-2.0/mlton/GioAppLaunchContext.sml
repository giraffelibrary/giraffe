structure GioAppLaunchContext :>
  GIO_APP_LAUNCH_CONTEXT
    where type 'a class = 'a GioAppLaunchContextClass.class =
  struct
    val getType_ = _import "g_app_launch_context_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_app_launch_context_new" : unit -> GioAppLaunchContextClass.FFI.notnull GioAppLaunchContextClass.FFI.p;
    val launchFailed_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_app_launch_context_launch_failed" :
              GioAppLaunchContextClass.FFI.notnull GioAppLaunchContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioAppLaunchContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioAppLaunchContextClass.FFI.fromPtr true) new_ ()
    fun launchFailed self startupNotifyId = (GioAppLaunchContextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) launchFailed_ (self & startupNotifyId)
  end
