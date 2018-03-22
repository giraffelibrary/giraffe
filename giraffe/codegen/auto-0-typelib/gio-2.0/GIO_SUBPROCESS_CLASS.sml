signature GIO_SUBPROCESS_CLASS =
  sig
    type 'a subprocess
    include
      CLASS
        where type 'a class = 'a subprocess GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
