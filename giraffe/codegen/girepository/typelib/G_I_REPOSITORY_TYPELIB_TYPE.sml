signature G_I_REPOSITORY_TYPELIB_TYPE =
  sig
    type t
    structure C :
      sig
        type notnull
        type 'a p
        val withPtr : (notnull p -> 'a) -> t -> 'a
        val withOptPtr : (unit p -> 'a) -> t option -> 'a
        val fromPtr : notnull p -> t
        val fromOptPtr : unit p -> t option
      end
  end
