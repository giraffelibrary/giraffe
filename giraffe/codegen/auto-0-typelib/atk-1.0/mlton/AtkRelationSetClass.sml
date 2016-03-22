structure AtkRelationSetClass :>
  ATK_RELATION_SET_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a relation_set = unit
    type 'a class = 'a relation_set class
  end
