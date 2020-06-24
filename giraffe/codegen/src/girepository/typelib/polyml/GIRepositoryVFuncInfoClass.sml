structure GIRepositoryVFuncInfoClass :>
  G_I_REPOSITORY_V_FUNC_INFO_CLASS
    where type 'a callableinfo_class = 'a GIRepositoryCallableInfoClass.class
    where type C.opt = GIRepositoryCallableInfoClass.C.opt
    where type C.non_opt = GIRepositoryCallableInfoClass.C.non_opt
    where type 'a C.p = 'a GIRepositoryCallableInfoClass.C.p =
  struct
    type 'a callableinfo_class = 'a GIRepositoryCallableInfoClass.class
    open GIRepositoryCallableInfoClass
    type 'a vfuncinfo = unit
    type 'a class = 'a vfuncinfo class
  end
