signature G_I_REPOSITORY_OBJECT_INFO_CLASS =
  sig
    type 'a objectinfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a objectinfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a objectinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a objectinfo
        val update : ('a -> 'b) -> 'a objectinfo -> 'b objectinfo
      end
  end
