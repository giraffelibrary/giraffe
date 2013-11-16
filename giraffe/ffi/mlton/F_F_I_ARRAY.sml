signature F_F_I_ARRAY =
  sig
    type t
    structure C :
      sig
        type notnull
        type 'a in_p
        type 'a out_p
        type ('a, 'b) r
        val withNullRef : (('a, 'b) r -> 'r) -> unit -> 'r
        val withConstPtr : ('a in_p -> 'b) -> t -> 'b
        val withConstOptPtr : (unit in_p -> 'a) -> t option -> 'a
        val withRefConstPtr : (('a, 'b) r -> 'c) -> t -> ('b out_p, 'c) pair
        val withRefConstOptPtr : ((unit, 'a) r -> 'b) -> t option -> ('a out_p, 'b) pair
        val withRefDupPtr : (('a, 'b) r -> 'c) -> t -> ('b out_p, 'c) pair
        val withRefDupOptPtr : ((unit, 'a) r -> 'b) -> t option -> ('a out_p, 'b) pair
        val fromPtr : bool -> 'a out_p -> t
        val fromOptPtr : bool -> 'a out_p -> t option
      end
  end
