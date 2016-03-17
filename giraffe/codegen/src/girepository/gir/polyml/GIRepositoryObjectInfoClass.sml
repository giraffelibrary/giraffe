structure GIRepositoryObjectInfoClass :>
  G_I_REPOSITORY_OBJECT_INFO_CLASS
    where type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    where type Obj.data = Info.objectdata =
  struct
    type data = Info.objectdata
    type 'a objectinfo = (data, 'a) pair
    type 'a registeredtypeinfo_class = 'a GIRepositoryRegisteredTypeInfoClass.class
    type 'a class = 'a objectinfo registeredtypeinfo_class
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
