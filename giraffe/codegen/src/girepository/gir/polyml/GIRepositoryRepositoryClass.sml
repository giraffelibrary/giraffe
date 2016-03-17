structure GIRepositoryRepositoryClass :>
  G_I_REPOSITORY_REPOSITORY_CLASS
    where type Obj.data = Info.repository =
  struct
    type data = Info.repository
    type 'a class = (data, 'a) pair
    type t = base class
    structure Obj =
      struct
        type data = data
        val unpack = I
        val pack = I
        fun update f = pack o (I && f) o unpack
      end
    fun toBase x = Obj.update (K ()) x
  end
