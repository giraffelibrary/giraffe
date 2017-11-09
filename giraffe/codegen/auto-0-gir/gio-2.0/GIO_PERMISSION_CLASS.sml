signature GIO_PERMISSION_CLASS =
  sig
    type 'a permission
    include
      CLASS
        where type 'a class = 'a permission GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
