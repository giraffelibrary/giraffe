signature NEW_RECORD =
  sig
    type t
    structure C :
      sig
        type notnull
        type 'a p
        type ('a, 'b) r
        val withPtr : (notnull p -> 'a) -> t -> 'a
        val withOptPtr : (unit p -> 'a) -> t option -> 'a
        val withNewPtr : (notnull p -> 'a) -> unit -> (notnull p, 'a) pair
        val withRefPtr : (('a, 'b) r -> 'c) -> t -> ('b p, 'c) pair
        val withRefOptPtr : ((unit, 'a) r -> 'b) -> t option -> ('a p, 'b) pair
        val fromPtr : bool -> notnull p -> t
        val fromOptPtr : bool -> unit p -> t option
      end
  end
