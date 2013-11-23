signature G_I_REPOSITORY_FIELD_INFO_CLASS =
  sig
    type 'a fieldinfo
    type 'a baseinfoclass_t
    type 'a t = 'a fieldinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a fieldinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a fieldinfo
        val update : ('a -> 'b) -> 'a fieldinfo -> 'b fieldinfo
      end
  end
