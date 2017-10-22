structure GioSubprocessLauncherClass :>
  GIO_SUBPROCESS_LAUNCHER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a subprocess_launcher = unit
    type 'a class = 'a subprocess_launcher class
  end
