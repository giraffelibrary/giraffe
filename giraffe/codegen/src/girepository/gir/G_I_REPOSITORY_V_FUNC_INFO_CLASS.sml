signature G_I_REPOSITORY_V_FUNC_INFO_CLASS =
  sig
    type 'a vfuncinfo
    type 'a callableinfoclass_t
    type 'a t = 'a vfuncinfo callableinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a vfuncinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a vfuncinfo
        val update : ('a -> 'b) -> 'a vfuncinfo -> 'b vfuncinfo
      end
  end
