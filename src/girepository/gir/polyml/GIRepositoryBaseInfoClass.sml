structure GIRepositoryBaseInfoClass :>
  G_I_REPOSITORY_BASE_INFO_CLASS
    where type Obj.data = Info.basedata =
  struct
    type data = Info.basedata
    type 'a class = (data, 'a) pair
    type t = base class
    structure Obj =
      struct
        type data = data
        val unpack = I
        val pack = I
        fun update f = pack o (I && f) o unpack
      end
    fun toBase obj = Obj.update (K ()) obj
  end

local
  fun pp _ _ (_ : 'a GIRepositoryBaseInfoClass.class) = PolyML.PrettyString "?"
in
  val () = PolyML.addPrettyPrinter pp
end
