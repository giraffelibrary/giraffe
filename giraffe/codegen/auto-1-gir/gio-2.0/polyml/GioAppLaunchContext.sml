structure GioAppLaunchContext :>
  GIO_APP_LAUNCH_CONTEXT
    where type 'a class_t = 'a GioAppLaunchContextClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_app_launch_context_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_app_launch_context_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val launchFailed_ = call (load_sym libgio "g_app_launch_context_launch_failed") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioAppLaunchContextClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioAppLaunchContextClass.C.fromPtr true) new_ ()
    fun launchFailed self startupNotifyId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) launchFailed_ (self & startupNotifyId)
  end
