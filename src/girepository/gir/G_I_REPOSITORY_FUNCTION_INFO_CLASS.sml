signature G_I_REPOSITORY_FUNCTION_INFO_CLASS =
  sig
    type 'a functioninfo
    type 'a callableinfo_class
    type 'a class = 'a functioninfo callableinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a functioninfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a functioninfo
        val update : ('a -> 'b) -> 'a functioninfo -> 'b functioninfo
      end
  end
