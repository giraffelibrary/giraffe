signature G_I_REPOSITORY_ALIAS_INFO_CLASS =
  sig
    type 'a aliasinfo
    type 'a baseinfoclass_t
    type 'a t = 'a aliasinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a aliasinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a aliasinfo
        val update : ('a -> 'b) -> 'a aliasinfo -> 'b aliasinfo
      end
  end
