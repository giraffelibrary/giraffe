structure GIRepositoryRepositoryClass :>
  G_I_REPOSITORY_REPOSITORY_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a repository = unit
    type 'a class = 'a repository class
  end
