signature G_I_REPOSITORY_ARG_INFO_CLASS =
  sig
    type 'a arginfo
    type 'a baseinfoclass_t
    type 'a t = 'a arginfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a arginfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a arginfo
        val update : ('a -> 'b) -> 'a arginfo -> 'b arginfo
      end
  end
