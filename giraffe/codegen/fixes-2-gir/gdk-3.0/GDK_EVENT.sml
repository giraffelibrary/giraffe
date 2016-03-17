signature GDK_EVENT =
  sig
    type 'a union
    type t = base union
    val toBase : 'a union -> base union
    val t : (base union, 'a union) GObjectValue.accessor
    val tOpt : (base union option, 'a union option) GObjectValue.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val withPtr : (notnull p -> 'a) -> 'b union -> 'a
        val withOptPtr : (unit p -> 'a) -> 'b union option -> 'a
        val fromPtr : bool -> notnull p -> base union
        val fromOptPtr : bool -> unit p -> base union option
      end
  end
