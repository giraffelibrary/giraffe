structure AtkValueClass :>
  ATK_VALUE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a value = unit
    type 'a class = 'a value class
  end
