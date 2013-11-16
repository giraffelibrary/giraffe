structure GdkAppLaunchContextClass :>
  GDK_APP_LAUNCH_CONTEXT_CLASS
    where type C.notnull = GioAppLaunchContextClass.C.notnull
    where type 'a C.p = 'a GioAppLaunchContextClass.C.p =
  struct
    type 'a applaunchcontext = unit
    type 'a t = 'a applaunchcontext GioAppLaunchContextClass.t
    fun toBase obj = obj
    val t = GioAppLaunchContextClass.t
    val tOpt = GioAppLaunchContextClass.tOpt
    structure C = GioAppLaunchContextClass.C
  end
