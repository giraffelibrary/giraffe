signature G_I_REPOSITORY_OBJECT_INFO_CLASS =
  sig
    type 'a objectinfo
    type 'a registeredtypeinfo_class
    type 'a class = 'a objectinfo registeredtypeinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a objectinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a objectinfo
        val update : ('a -> 'b) -> 'a objectinfo -> 'b objectinfo
      end
  end
