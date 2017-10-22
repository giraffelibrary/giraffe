structure GioMenuAttributeIterClass :>
  GIO_MENU_ATTRIBUTE_ITER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a menu_attribute_iter = unit
    type 'a class = 'a menu_attribute_iter class
  end
