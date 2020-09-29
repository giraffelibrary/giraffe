structure GIRepositorySignalInfoClass :>
  G_I_REPOSITORY_SIGNAL_INFO_CLASS
    where type 'a callableinfo_class = 'a GIRepositoryCallableInfoClass.class
    where type Obj.data = Info.signaldata =
  struct
    type data = Info.signaldata
    type 'a signalinfo = (data, 'a) pair
    type 'a callableinfo_class = 'a GIRepositoryCallableInfoClass.class
    type 'a class = 'a signalinfo callableinfo_class
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
