structure GIRepositoryRegisteredTypeInfoClass :>
  G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type Obj.data = Info.registeredtypedata =
  struct
    type data = Info.registeredtypedata
    type 'a registeredtypeinfo = (data, 'a) pair
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a registeredtypeinfo baseinfoclass_t
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
