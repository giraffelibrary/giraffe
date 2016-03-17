structure GIRepositoryStructInfoClass :>
  G_I_REPOSITORY_STRUCT_INFO_CLASS
    where type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    where type C.notnull = GIRepositoryRegisteredTypeInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryRegisteredTypeInfoClass.C.p =
  struct
    type 'a structinfo = unit
    type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    type 'a class = 'a structinfo registeredtypeinfo_class
    fun toBase obj = obj
    structure C = GIRepositoryRegisteredTypeInfoClass.C
  end
