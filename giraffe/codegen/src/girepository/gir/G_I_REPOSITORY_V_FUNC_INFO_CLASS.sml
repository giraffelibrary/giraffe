signature G_I_REPOSITORY_V_FUNC_INFO_CLASS =
  sig
    type 'a vfuncinfo
    type 'a callableinfo_class
    type 'a class = 'a vfuncinfo callableinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a vfuncinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a vfuncinfo
        val update : ('a -> 'b) -> 'a vfuncinfo -> 'b vfuncinfo
      end
  end
