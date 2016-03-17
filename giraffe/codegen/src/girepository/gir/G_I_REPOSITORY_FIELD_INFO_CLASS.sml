signature G_I_REPOSITORY_FIELD_INFO_CLASS =
  sig
    type 'a fieldinfo
    type 'a baseinfo_class
    type 'a class = 'a fieldinfo baseinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a fieldinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a fieldinfo
        val update : ('a -> 'b) -> 'a fieldinfo -> 'b fieldinfo
      end
  end
