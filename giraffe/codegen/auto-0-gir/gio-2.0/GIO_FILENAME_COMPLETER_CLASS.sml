signature GIO_FILENAME_COMPLETER_CLASS =
  sig
    type 'a filename_completer
    include
      CLASS
        where type 'a class = 'a filename_completer GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
