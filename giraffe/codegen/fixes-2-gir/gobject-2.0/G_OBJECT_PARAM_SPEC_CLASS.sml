signature G_OBJECT_PARAM_SPEC_CLASS =
  sig
    type 'a class
    type t = base class
    val toBase : 'a class -> base class
    type ('a, 'b) value_accessor
    val t : (base class, 'a class) value_accessor
    val tOpt : (base class option, 'a class option) value_accessor
    structure C :
      sig
        type notnull
        type 'a p
        type ('a, 'b) r

        val withPtr : (notnull p -> 'b) -> 'a class -> 'b
        val withOptPtr : (unit p -> 'b) -> 'a class option -> 'b

        val withRefPtr : (('a, 'b) r -> 'c) -> 'd class -> ('b p, 'c) pair
        val withRefOptPtr : ((unit, 'a) r -> 'b) -> 'c class option -> ('a p, 'b) pair

        val fromPtr : bool -> notnull p -> 'a class
        val fromOptPtr : bool -> unit p -> 'a class option
      end
  end
