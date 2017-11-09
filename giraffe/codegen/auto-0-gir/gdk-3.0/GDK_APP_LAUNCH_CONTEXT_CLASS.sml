signature GDK_APP_LAUNCH_CONTEXT_CLASS =
  sig
    type 'a app_launch_context
    include
      CLASS
        where type 'a class = 'a app_launch_context Gio.AppLaunchContextClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
