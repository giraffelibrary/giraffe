structure GioMenuLinkIterClass :>
  GIO_MENU_LINK_ITER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a menu_link_iter = unit
    type 'a class = 'a menu_link_iter class
  end
