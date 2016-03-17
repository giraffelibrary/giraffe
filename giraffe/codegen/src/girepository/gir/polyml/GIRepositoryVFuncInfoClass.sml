structure GIRepositoryVFuncInfoClass :>
  G_I_REPOSITORY_V_FUNC_INFO_CLASS
    where type 'a callableinfo_class = 'a GIRepositoryCallableInfoClass.class
    where type Obj.data = Info.vfuncdata =
  struct
    type data = Info.vfuncdata
    type 'a vfuncinfo = (data, 'a) pair
    type 'a callableinfo_class = 'a GIRepositoryCallableInfoClass.class
    type 'a class = 'a vfuncinfo callableinfo_class
    type t = base class
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
