structure GioMenuClass :>
  GIO_MENU_CLASS
    where type 'a menu_model_class = 'a GioMenuModelClass.class
    where type C.notnull = GioMenuModelClass.C.notnull
    where type 'a C.p = 'a GioMenuModelClass.C.p =
  struct
    type 'a menu_model_class = 'a GioMenuModelClass.class
    open GioMenuModelClass
    type 'a menu = unit
    type 'a class = 'a menu class
  end
