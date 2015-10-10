signature G_I_REPOSITORY_UNION_INFO_CLASS =
  sig
    type 'a unioninfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a unioninfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a unioninfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a unioninfo
        val update : ('a -> 'b) -> 'a unioninfo -> 'b unioninfo
      end
  end
