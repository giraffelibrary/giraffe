structure GioAppLaunchContext :>
  GIO_APP_LAUNCH_CONTEXT
    where type 'a class = 'a GioAppLaunchContextClass.class =
  struct
    val getType_ = _import "g_app_launch_context_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_app_launch_context_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val launchFailed_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_app_launch_context_launch_failed" :
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
    type 'a class = 'a GioAppLaunchContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioAppLaunchContextClass.C.fromPtr true) new_ ()
    fun launchFailed self startupNotifyId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) launchFailed_ (self & startupNotifyId)
  end
