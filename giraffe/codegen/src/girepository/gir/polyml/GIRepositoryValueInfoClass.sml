structure GIRepositoryValueInfoClass :>
  G_I_REPOSITORY_VALUE_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type Obj.data = Info.valuedata =
  struct
    type data = Info.valuedata
    type 'a valueinfo = (data, 'a) pair
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a valueinfo baseinfoclass_t
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
