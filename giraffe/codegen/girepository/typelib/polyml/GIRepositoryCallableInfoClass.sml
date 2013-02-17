structure GIRepositoryCallableInfoClass :>
  G_I_REPOSITORY_CALLABLE_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type C.notnull = GIRepositoryBaseInfoClass.C.notnull
    where type 'a C.p = 'a GIRepositoryBaseInfoClass.C.p =
  struct
    type 'a callableinfo = unit
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a callableinfo baseinfoclass_t
    fun toBase obj = obj
    structure C = GIRepositoryBaseInfoClass.C
  end
