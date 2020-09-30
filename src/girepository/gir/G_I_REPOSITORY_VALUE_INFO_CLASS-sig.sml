signature G_I_REPOSITORY_VALUE_INFO_CLASS =
  sig
    type 'a valueinfo
    type 'a baseinfo_class
    type 'a class = 'a valueinfo baseinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a valueinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a valueinfo
        val update : ('a -> 'b) -> 'a valueinfo -> 'b valueinfo
      end
  end
