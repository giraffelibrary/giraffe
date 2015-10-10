structure GIRepositoryFunctionInfoClass :>
  G_I_REPOSITORY_FUNCTION_INFO_CLASS
    where type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    where type Obj.data = Info.functiondata =
  struct
    type data = Info.functiondata
    type 'a functioninfo = (data, 'a) pair
    type 'a callableinfoclass_t = 'a GIRepositoryCallableInfoClass.t
    type 'a t = 'a functioninfo callableinfoclass_t
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
