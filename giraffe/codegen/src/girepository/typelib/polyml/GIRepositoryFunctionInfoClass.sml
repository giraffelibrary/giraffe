structure GIRepositoryFunctionInfoClass :>
  G_I_REPOSITORY_FUNCTION_INFO_CLASS
    where type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    where type C.notnull = GIRepositoryCallableInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryCallableInfoClass.C.p =
  struct
    type 'a functioninfo = unit
    type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    type 'a t = 'a functioninfo callableinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryCallableInfoClass.C
  end
