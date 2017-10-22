structure GioMenuItemClass :>
  GIO_MENU_ITEM_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a menu_item = unit
    type 'a class = 'a menu_item class
  end
