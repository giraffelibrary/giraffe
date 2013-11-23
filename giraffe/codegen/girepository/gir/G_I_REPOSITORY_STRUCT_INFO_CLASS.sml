signature G_I_REPOSITORY_STRUCT_INFO_CLASS =
  sig
    type 'a structinfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a structinfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a structinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a structinfo
        val update : ('a -> 'b) -> 'a structinfo -> 'b structinfo
      end
  end
