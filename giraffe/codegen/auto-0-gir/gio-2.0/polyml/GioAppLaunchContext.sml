structure GioAppLaunchContext :>
  GIO_APP_LAUNCH_CONTEXT
    where type 'a class_t = 'a GioAppLaunchContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_app_launch_context_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_app_launch_context_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val launchFailed_ = call (load_sym libgio "g_app_launch_context_launch_failed") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GioAppLaunchContextClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioAppLaunchContextClass.C.fromPtr true) new_ ()
    fun launchFailed self startupNotifyId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) launchFailed_ (self & startupNotifyId)
  end
