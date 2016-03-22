structure AtkObjectFactoryClass :>
  ATK_OBJECT_FACTORY_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a object_factory = unit
    type 'a class = 'a object_factory class
  end
