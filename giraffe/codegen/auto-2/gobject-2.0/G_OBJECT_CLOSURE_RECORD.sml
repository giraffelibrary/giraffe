signature G_OBJECT_CLOSURE_RECORD =
  sig
    type t
    type ('a, 'b) value_accessor
    val t : (t, t) value_accessor
    val tOpt : (t option, t option) value_accessor
    structure C :
      sig
        type notnull
        type 'a p
        val withPtr : (notnull p -> 'a) -> t -> 'a
        val withOptPtr : (unit p -> 'a) -> t option -> 'a
        val fromPtr : bool -> notnull p -> t
        val fromOptPtr : bool -> unit p -> t option
      end
  end
