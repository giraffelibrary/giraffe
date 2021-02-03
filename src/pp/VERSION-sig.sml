signature VERSION =
  sig
    (**
     * The type `version` represents a version that has a total order
     * and a string representation that preserves the order, i.e.
     *
     *   compare (v1, v2) = String.compare (toString v1, toString v2)
     *
     * for all `v1 : version` and `v2 : version`.
     *)
    type version
    val compare : version * version -> order
    val toString : version -> string
  end
