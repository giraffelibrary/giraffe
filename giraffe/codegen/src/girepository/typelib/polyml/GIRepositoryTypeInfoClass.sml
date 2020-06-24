structure GIRepositoryTypeInfoClass :>
  G_I_REPOSITORY_TYPE_INFO_CLASS
    where type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    where type C.opt = GIRepositoryRegisteredTypeInfoClass.C.opt
    where type C.non_opt = GIRepositoryRegisteredTypeInfoClass.C.non_opt
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    open GIRepositoryBaseInfoClass
    type 'a typeinfo = unit
    type 'a class = 'a typeinfo class
  end
