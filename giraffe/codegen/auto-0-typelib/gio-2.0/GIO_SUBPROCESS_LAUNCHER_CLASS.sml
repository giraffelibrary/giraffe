signature GIO_SUBPROCESS_LAUNCHER_CLASS =
  sig
    type 'a subprocess_launcher
    include
      CLASS
        where type 'a class = 'a subprocess_launcher GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
