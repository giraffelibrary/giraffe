structure GIRepositoryUnionInfoClass :>
  G_I_REPOSITORY_UNION_INFO_CLASS
    where type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    where type Obj.data = Info.uniondata =
  struct
    type data = Info.uniondata
    type 'a unioninfo = (data, 'a) pair
    type 'a registeredtypeinfoclass_t = 'a GIRepositoryRegisteredTypeInfoClass.t
    type 'a t = 'a unioninfo registeredtypeinfoclass_t
    structure Obj =
      struct
        type data = data
        val unpack = I
        val pack = I
        fun update f = pack o (I && f) o unpack
      end
    fun toBase obj =
      (GIRepositoryBaseInfoClass.Obj.update
        o GIRepositoryRegisteredTypeInfoClass.Obj.update
        o Obj.update)
        (K ())
        obj
  end
