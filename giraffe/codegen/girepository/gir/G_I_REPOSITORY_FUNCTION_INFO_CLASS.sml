signature G_I_REPOSITORY_FUNCTION_INFO_CLASS =
  sig
    type 'a functioninfo
    type 'a callableinfoclass_t
    type 'a t = 'a functioninfo callableinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a functioninfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a functioninfo
        val update : ('a -> 'b) -> 'a functioninfo -> 'b functioninfo
      end
  end
