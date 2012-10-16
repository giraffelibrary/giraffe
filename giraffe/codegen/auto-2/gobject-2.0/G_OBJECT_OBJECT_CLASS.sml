signature G_OBJECT_OBJECT_CLASS =
  sig
    type 'a t
    type ('a, 'b) value_accessor
    val toBase : 'a t -> base t
    val t : (base t, 'a t) value_accessor
    val tOpt : (base t option, 'a t option) value_accessor
    structure C :
      sig
        type notnull
        type 'a p
        type ('a, 'b) r

        val withPtr : (notnull p -> 'b) -> 'a t -> 'b
        val withOptPtr : (unit p -> 'b) -> 'a t option -> 'b

        val withRefPtr : (('a, 'b) r -> 'c) -> 'd t -> ('b p, 'c) pair
        val withRefOptPtr : ((unit, 'a) r -> 'b) -> 'c t option -> ('a p, 'b) pair

        val fromPtr : bool -> notnull p -> 'a t
        val fromOptPtr : bool -> unit p -> 'a t option
      end
  end
