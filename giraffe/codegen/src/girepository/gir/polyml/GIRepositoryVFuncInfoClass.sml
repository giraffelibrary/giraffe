structure GIRepositoryVFuncInfoClass :>
  G_I_REPOSITORY_V_FUNC_INFO_CLASS
    where type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    where type Obj.data = Info.vfuncdata =
  struct
    type data = Info.vfuncdata
    type 'a vfuncinfo = (data, 'a) pair
    type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    type 'a t = 'a vfuncinfo callableinfoclass_t
    structure Obj =
      struct
        type data = data
        val unpack = I
        val pack = I
        fun update f = pack o (I && f) o unpack
      end
    fun toBase obj =
      (GIRepositoryBaseInfoClass.Obj.update
        o GIRepositoryCallableInfoClass.Obj.update
        o Obj.update)
        (K ())
        obj
  end
