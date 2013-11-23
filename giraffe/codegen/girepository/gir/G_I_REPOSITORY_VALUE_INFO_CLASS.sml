signature G_I_REPOSITORY_VALUE_INFO_CLASS =
  sig
    type 'a valueinfo
    type 'a baseinfoclass_t
    type 'a t = 'a valueinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a valueinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a valueinfo
        val update : ('a -> 'b) -> 'a valueinfo -> 'b valueinfo
      end
  end
