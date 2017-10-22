structure GioActionMapClass :>
  GIO_ACTION_MAP_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a action_map = unit
    type 'a class = 'a action_map class
  end
