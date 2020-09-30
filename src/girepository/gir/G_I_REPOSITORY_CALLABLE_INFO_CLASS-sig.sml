signature G_I_REPOSITORY_CALLABLE_INFO_CLASS =
  sig
    type 'a callableinfo
    type 'a baseinfo_class
    type 'a class = 'a callableinfo baseinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a callableinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a callableinfo
        val update : ('a -> 'b) -> 'a callableinfo -> 'b callableinfo
      end
  end
