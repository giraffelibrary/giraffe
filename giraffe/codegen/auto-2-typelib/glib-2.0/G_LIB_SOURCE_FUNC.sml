signature G_LIB_SOURCE_FUNC =
  sig
    type t = unit -> bool

    structure C :
      sig
        type callback
        val withCallback : (callback -> 'a) -> t -> 'a
      end
  end
