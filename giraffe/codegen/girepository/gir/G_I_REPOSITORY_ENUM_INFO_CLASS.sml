signature G_I_REPOSITORY_ENUM_INFO_CLASS =
  sig
    type 'a enuminfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a enuminfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a enuminfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a enuminfo
        val update : ('a -> 'b) -> 'a enuminfo -> 'b enuminfo
      end
  end
