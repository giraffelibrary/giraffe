signature GIO_D_BUS_MENU_MODEL_CLASS =
  sig
    type 'a d_bus_menu_model
    type 'a menu_model_class
    include
      CLASS
        where type 'a class = 'a d_bus_menu_model menu_model_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
