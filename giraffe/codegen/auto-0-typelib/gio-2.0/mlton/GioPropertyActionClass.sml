structure GioPropertyActionClass :>
  GIO_PROPERTY_ACTION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a property_action = unit
    type 'a class = 'a property_action class
  end
