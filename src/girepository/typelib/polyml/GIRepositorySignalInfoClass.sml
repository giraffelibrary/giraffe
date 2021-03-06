structure GIRepositorySignalInfoClass :>
  G_I_REPOSITORY_SIGNAL_INFO_CLASS
    where type 'a callableinfo_class = 'a GIRepositoryCallableInfoClass.class
    where type C.opt = GIRepositoryCallableInfoClass.C.opt
    where type C.non_opt = GIRepositoryCallableInfoClass.C.non_opt
    where type 'a C.p = 'a GIRepositoryCallableInfoClass.C.p =
  struct
    type 'a callableinfo_class = 'a GIRepositoryCallableInfoClass.class
    open GIRepositoryCallableInfoClass
    type 'a signalinfo = unit
    type 'a class = 'a signalinfo class
  end
