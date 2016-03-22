structure GdkAppLaunchContextClass :>
  GDK_APP_LAUNCH_CONTEXT_CLASS
    where type C.notnull = GioAppLaunchContextClass.C.notnull
    where type 'a C.p = 'a GioAppLaunchContextClass.C.p =
  struct
    open GioAppLaunchContextClass
    type 'a app_launch_context = unit
    type 'a class = 'a app_launch_context class
  end
