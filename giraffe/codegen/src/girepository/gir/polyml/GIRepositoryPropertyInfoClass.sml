structure GIRepositoryPropertyInfoClass :>
  G_I_REPOSITORY_PROPERTY_INFO_CLASS
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type Obj.data = Info.propertydata =
  struct
    type data = Info.propertydata
    type 'a propertyinfo = (data, 'a) pair
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type 'a t = 'a propertyinfo baseinfoclass_t
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
