signature GIO_SIMPLE_PERMISSION_CLASS =
  sig
    type 'a simple_permission
    type 'a permission_class
    include
      CLASS
        where type 'a class = 'a simple_permission permission_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
