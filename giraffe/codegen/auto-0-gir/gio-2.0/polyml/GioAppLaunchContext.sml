structure GioAppLaunchContext :>
  GIO_APP_LAUNCH_CONTEXT
    where type 'a class = 'a GioAppLaunchContextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_app_launch_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_app_launch_context_new") (cVoid --> GioAppLaunchContextClass.PolyML.cPtr)
      val launchFailed_ = call (getSymbol "g_app_launch_context_launch_failed") (GioAppLaunchContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GioAppLaunchContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioAppLaunchContextClass.FFI.fromPtr true) new_ ()
    fun launchFailed self startupNotifyId = (GioAppLaunchContextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) launchFailed_ (self & startupNotifyId)
  end
