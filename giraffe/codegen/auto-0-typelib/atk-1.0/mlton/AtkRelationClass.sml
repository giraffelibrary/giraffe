structure AtkRelationClass :>
  ATK_RELATION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a relation = unit
    type 'a class = 'a relation class
  end
