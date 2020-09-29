structure GIRepositoryRegisteredTypeInfoClass :>
  G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS
    where type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    where type Obj.data = Info.registeredtypedata =
  struct
    type data = Info.registeredtypedata
    type 'a registeredtypeinfo = (data, 'a) pair
    type 'a baseinfo_class = 'a GIRepositoryBaseInfoClass.class
    type 'a class = 'a registeredtypeinfo baseinfo_class
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
