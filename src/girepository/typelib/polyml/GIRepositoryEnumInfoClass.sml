structure GIRepositoryEnumInfoClass :>
  G_I_REPOSITORY_ENUM_INFO_CLASS
    where type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    where type C.opt = GIRepositoryRegisteredTypeInfoClass.C.opt
    where type C.non_opt = GIRepositoryRegisteredTypeInfoClass.C.non_opt
    where type 'a C.p = 'a GIRepositoryRegisteredTypeInfoClass.C.p =
  struct
    type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    open GIRepositoryRegisteredTypeInfoClass
    type 'a enuminfo = unit
    type 'a class = 'a enuminfo class
  end
