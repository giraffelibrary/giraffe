structure GioAppLaunchContextClass :>
  GIO_APP_LAUNCH_CONTEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a app_launch_context = unit
    type 'a class = 'a app_launch_context class
  end
