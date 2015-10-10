signature G_I_REPOSITORY_BASE_INFO_CLASS =
  sig
    type 'a t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a t -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a t
        val update : ('a -> 'b) -> 'a t -> 'b t
      end
  end
