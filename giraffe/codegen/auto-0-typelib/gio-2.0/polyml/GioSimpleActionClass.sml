structure GioSimpleActionClass :>
  GIO_SIMPLE_ACTION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a simple_action = unit
    type 'a class = 'a simple_action class
  end
