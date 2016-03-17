signature G_I_REPOSITORY_STRUCT_INFO_CLASS =
  sig
    type 'a structinfo
    type 'a registeredtypeinfo_class
    type 'a class = 'a structinfo registeredtypeinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a structinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a structinfo
        val update : ('a -> 'b) -> 'a structinfo -> 'b structinfo
      end
  end
