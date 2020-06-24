structure GIRepositoryPropertyInfoClass :>
  G_I_REPOSITORY_PROPERTY_INFO_CLASS
    where type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    where type C.opt = GIRepositoryBaseInfoClass.C.opt
    where type C.non_opt = GIRepositoryBaseInfoClass.C.non_opt
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    open GIRepositoryBaseInfoClass
    type 'a propertyinfo = unit
    type 'a class = 'a propertyinfo class
  end
