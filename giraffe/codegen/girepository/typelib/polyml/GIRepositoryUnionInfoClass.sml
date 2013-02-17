structure GIRepositoryUnionInfoClass :>
  G_I_REPOSITORY_UNION_INFO_CLASS
    where type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    where type C.notnull = GIRepositoryRegisteredTypeInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryRegisteredTypeInfoClass.C.p =
  struct
    type 'a unioninfo = unit
    type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    type 'a t = 'a unioninfo registeredtypeinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryRegisteredTypeInfoClass.C
  end
