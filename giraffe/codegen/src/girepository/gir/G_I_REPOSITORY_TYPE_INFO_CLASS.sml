signature G_I_REPOSITORY_TYPE_INFO_CLASS =
  sig
    type 'a typeinfo
    type 'a baseinfo_class
    type 'a class = 'a typeinfo baseinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a typeinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a typeinfo
        val update : ('a -> 'b) -> 'a typeinfo -> 'b typeinfo
      end
  end
