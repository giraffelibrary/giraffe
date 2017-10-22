signature GIO_MENU_MODEL_CLASS =
  sig
    type 'a menu_model
    include
      CLASS
        where type 'a class = 'a menu_model GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
