structure GIRepositoryUnionInfoClass :>
  G_I_REPOSITORY_UNION_INFO_CLASS
    where type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    where type C.notnull = GIRepositoryRegisteredTypeInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryRegisteredTypeInfoClass.C.p =
  struct
    type 'a unioninfo = unit
    type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    type 'a class = 'a unioninfo registeredtypeinfo_class
    fun toBase obj = obj
    structure C = GIRepositoryRegisteredTypeInfoClass.C
  end
