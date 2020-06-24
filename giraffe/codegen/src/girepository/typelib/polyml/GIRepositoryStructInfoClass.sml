structure GIRepositoryStructInfoClass :>
  G_I_REPOSITORY_STRUCT_INFO_CLASS
    where type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    where type C.opt = GIRepositoryRegisteredTypeInfoClass.C.opt
    where type C.non_opt = GIRepositoryRegisteredTypeInfoClass.C.non_opt
    where type 'a C.p = 'a GIRepositoryRegisteredTypeInfoClass.C.p =
  struct
    type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    open GIRepositoryRegisteredTypeInfoClass
    type 'a structinfo = unit
    type 'a class = 'a structinfo class
  end
