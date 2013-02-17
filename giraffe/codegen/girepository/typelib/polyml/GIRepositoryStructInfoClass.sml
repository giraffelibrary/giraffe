structure GIRepositoryStructInfoClass :>
  G_I_REPOSITORY_STRUCT_INFO_CLASS
    where type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    where type C.notnull = GIRepositoryRegisteredTypeInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryRegisteredTypeInfoClass.C.p =
  struct
    type 'a structinfo = unit
    type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    type 'a t = 'a structinfo registeredtypeinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryRegisteredTypeInfoClass.C
  end
