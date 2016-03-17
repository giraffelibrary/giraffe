signature G_I_REPOSITORY_UNION_INFO_CLASS =
  sig
    type 'a unioninfo
    type 'a registeredtypeinfo_class
    type 'a class = 'a unioninfo registeredtypeinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a unioninfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a unioninfo
        val update : ('a -> 'b) -> 'a unioninfo -> 'b unioninfo
      end
  end
