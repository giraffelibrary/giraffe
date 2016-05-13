structure GioAppLaunchContext :>
  GIO_APP_LAUNCH_CONTEXT
    where type 'a class = 'a GioAppLaunchContextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_app_launch_context_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_app_launch_context_new") (PolyMLFFI.cVoid --> GioAppLaunchContextClass.PolyML.cPtr)
      val launchFailed_ = call (load_sym libgio "g_app_launch_context_launch_failed") (GioAppLaunchContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioAppLaunchContextClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioAppLaunchContextClass.C.fromPtr true) new_ ()
    fun launchFailed self startupNotifyId = (GioAppLaunchContextClass.C.withPtr &&&> Utf8.C.withPtr ---> I) launchFailed_ (self & startupNotifyId)
  end
