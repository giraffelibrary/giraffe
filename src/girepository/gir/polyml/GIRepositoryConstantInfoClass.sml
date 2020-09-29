structure GIRepositoryConstantInfoClass :>
  G_I_REPOSITORY_CONSTANT_INFO_CLASS
    where type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class 
    where type Obj.data = Info.constantdata =
  struct
    type data = Info.constantdata
    type 'a constantinfo = (data, 'a) pair
    type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    type 'a class = 'a constantinfo baseinfo_class
    type t = base class
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
