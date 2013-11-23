signature G_I_REPOSITORY_CALLABLE_INFO_CLASS =
  sig
    type 'a callableinfo
    type 'a baseinfoclass_t
    type 'a t = 'a callableinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a callableinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a callableinfo
        val update : ('a -> 'b) -> 'a callableinfo -> 'b callableinfo
      end
  end
