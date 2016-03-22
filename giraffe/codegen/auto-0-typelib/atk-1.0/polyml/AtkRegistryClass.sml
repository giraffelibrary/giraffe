structure AtkRegistryClass :>
  ATK_REGISTRY_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a registry = unit
    type 'a class = 'a registry class
  end
