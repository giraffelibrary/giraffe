structure GIRepositoryCallableInfoClass :>
  G_I_REPOSITORY_CALLABLE_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type Obj.data = Info.callabledata =
  struct
    type data = Info.callabledata
    type 'a callableinfo = (data, 'a) pair
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a callableinfo baseinfoclass_t
    structure Obj =
      struct
        type data = data
        val unpack = I
        val pack = I
        fun update f = pack o (I && f) o unpack
      end
    fun toBase obj =
      (GIRepositoryBaseInfoClass.Obj.update o Obj.update)
        (K ())
        obj
  end
