signature GIO_APPLICATION_CLASS =
  sig
    type 'a application
    include
      CLASS
        where type 'a class = 'a application GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
