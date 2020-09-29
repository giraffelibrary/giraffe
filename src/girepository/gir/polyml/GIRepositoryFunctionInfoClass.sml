structure GIRepositoryFunctionInfoClass :>
  G_I_REPOSITORY_FUNCTION_INFO_CLASS
    where type 'a callableinfo_class = 'a GIRepositoryCallableInfoClass.class
    where type Obj.data = Info.functiondata =
  struct
    type data = Info.functiondata
    type 'a functioninfo = (data, 'a) pair
    type 'a callableinfo_class = 'a GIRepositoryCallableInfoClass.class
    type 'a class = 'a functioninfo callableinfo_class
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
