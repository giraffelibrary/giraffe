signature G_I_REPOSITORY_ENUM_INFO_CLASS =
  sig
    type 'a enuminfo
    type 'a registeredtypeinfo_class
    type 'a class = 'a enuminfo registeredtypeinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a enuminfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a enuminfo
        val update : ('a -> 'b) -> 'a enuminfo -> 'b enuminfo
      end
  end
