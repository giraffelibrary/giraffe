structure GIRepositoryVFuncInfoClass :>
  G_I_REPOSITORY_VFUNC_INFO_CLASS
    where type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    where type C.notnull = GIRepositoryCallableInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryCallableInfoClass.C.p =
  struct
    type 'a vfuncinfo = unit
    type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    type 'a t = 'a vfuncinfo callableinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryCallableInfoClass.C
  end
