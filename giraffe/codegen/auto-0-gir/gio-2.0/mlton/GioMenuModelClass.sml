structure GioMenuModelClass :>
  GIO_MENU_MODEL_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a menu_model = unit
    type 'a class = 'a menu_model class
  end
