structure GioDBusMenuModelClass :>
  GIO_D_BUS_MENU_MODEL_CLASS
    where type 'a menu_model_class = 'a GioMenuModelClass.class
    where type C.notnull = GioMenuModelClass.C.notnull
    where type 'a C.p = 'a GioMenuModelClass.C.p =
  struct
    type 'a menu_model_class = 'a GioMenuModelClass.class
    open GioMenuModelClass
    type 'a d_bus_menu_model = unit
    type 'a class = 'a d_bus_menu_model class
  end
