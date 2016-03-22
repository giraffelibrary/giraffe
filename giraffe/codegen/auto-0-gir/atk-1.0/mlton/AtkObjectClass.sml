structure AtkObjectClass :>
  ATK_OBJECT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a object = unit
    type 'a class = 'a object class
  end
