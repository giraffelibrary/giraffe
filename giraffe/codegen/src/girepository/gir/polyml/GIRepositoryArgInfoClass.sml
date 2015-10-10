structure GIRepositoryArgInfoClass :>
  G_I_REPOSITORY_ARG_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type Obj.data = Info.argdata =
  struct
    type data = Info.argdata
    type 'a arginfo = (data, 'a) pair
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a arginfo baseinfoclass_t
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
