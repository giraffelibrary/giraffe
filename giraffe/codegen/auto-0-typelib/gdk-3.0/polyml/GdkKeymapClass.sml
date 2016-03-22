structure GdkKeymapClass :>
  GDK_KEYMAP_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a keymap = unit
    type 'a class = 'a keymap class
  end
