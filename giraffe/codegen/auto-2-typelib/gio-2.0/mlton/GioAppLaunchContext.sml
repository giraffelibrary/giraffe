structure GioAppLaunchContext :>
  GIO_APP_LAUNCH_CONTEXT
    where type 'a class_t = 'a GioAppLaunchContextClass.t =
  struct
    val getType_ = _import "g_app_launch_context_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_app_launch_context_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val launchFailed_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_app_launch_context_launch_failed" :
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
    type 'a class_t = 'a GioAppLaunchContextClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioAppLaunchContextClass.C.fromPtr true) new_ ()
    fun launchFailed self startupNotifyId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) launchFailed_ (self & startupNotifyId)
  end
