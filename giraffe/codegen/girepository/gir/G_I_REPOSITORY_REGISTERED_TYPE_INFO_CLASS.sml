signature G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS =
  sig
    type 'a registeredtypeinfo
    type 'a baseinfoclass_t
    type 'a t = 'a registeredtypeinfo baseinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a registeredtypeinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a registeredtypeinfo
        val update : ('a -> 'b) -> 'a registeredtypeinfo -> 'b registeredtypeinfo
      end
  end
