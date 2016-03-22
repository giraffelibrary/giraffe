signature CLASS =
  sig
    type 'a class
    type t = base class
    val toBase : 'a class -> base class
    structure C :
      sig
        type notnull
        type 'a p
        type ('a, 'b) r

        val withPtr : (notnull p -> 'b) -> 'a class -> 'b
        val withOptPtr : (unit p -> 'b) -> 'a class option -> 'b

        val withRefPtr : (('a, 'b) r -> 'c) -> 'd class -> ('b p, 'c) pair
        val withRefOptPtr : ((unit, 'a) r -> 'b) -> 'c class option -> ('a p, 'b) pair

        val fromPtr : bool -> notnull p -> base class
        val fromOptPtr : bool -> unit p -> base class option
      end
  end
