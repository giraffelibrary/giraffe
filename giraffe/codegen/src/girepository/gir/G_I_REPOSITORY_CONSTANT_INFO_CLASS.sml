signature G_I_REPOSITORY_CONSTANT_INFO_CLASS =
  sig
    type 'a constantinfo
    type 'a baseinfoclass_t
    type 'a t = 'a constantinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a constantinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a constantinfo
        val update : ('a -> 'b) -> 'a constantinfo -> 'b constantinfo
      end
  end
