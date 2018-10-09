signature GIO_BYTES_ICON_CLASS =
  sig
    type 'a bytes_icon
    include
      CLASS
        where type 'a class = 'a bytes_icon GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
