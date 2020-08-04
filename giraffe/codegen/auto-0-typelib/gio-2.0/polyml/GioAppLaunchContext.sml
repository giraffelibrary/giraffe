structure GioAppLaunchContext :>
  GIO_APP_LAUNCH_CONTEXT
    where type 'a class = 'a GioAppLaunchContextClass.class
    where type 'a app_info_class = 'a GioAppInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_app_launch_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_app_launch_context_new") (cVoid --> GioAppLaunchContextClass.PolyML.cPtr)
      val getEnvironment_ = call (getSymbol "g_app_launch_context_get_environment") (GioAppLaunchContextClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val launchFailed_ = call (getSymbol "g_app_launch_context_launch_failed") (GioAppLaunchContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setenv_ =
        call (getSymbol "g_app_launch_context_setenv")
          (
            GioAppLaunchContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val unsetenv_ = call (getSymbol "g_app_launch_context_unsetenv") (GioAppLaunchContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
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
