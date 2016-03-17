structure GIRepositoryUnionInfoClass :>
  G_I_REPOSITORY_UNION_INFO_CLASS
    where type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    where type Obj.data = Info.uniondata =
  struct
    type data = Info.uniondata
    type 'a unioninfo = (data, 'a) pair
    type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    type 'a class = 'a unioninfo registeredtypeinfo_class
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
        o GIRepositoryRegisteredTypeInfoClass.Obj.update
        o Obj.update)
        (K ())
        obj
  end
