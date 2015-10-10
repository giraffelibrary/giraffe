signature G_I_REPOSITORY_TYPE_INFO_CLASS =
  sig
    type 'a typeinfo
    type 'a baseinfoclass_t
    type 'a t = 'a typeinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a typeinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a typeinfo
        val update : ('a -> 'b) -> 'a typeinfo -> 'b typeinfo
      end
  end
