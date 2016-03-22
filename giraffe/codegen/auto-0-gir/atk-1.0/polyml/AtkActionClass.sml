structure AtkActionClass :>
  ATK_ACTION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a action = unit
    type 'a class = 'a action class
  end
