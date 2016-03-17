signature G_I_REPOSITORY_BASE_INFO_CLASS =
  sig
    type 'a class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a class -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a class
        val update : ('a -> 'b) -> 'a class -> 'b class
      end
  end
