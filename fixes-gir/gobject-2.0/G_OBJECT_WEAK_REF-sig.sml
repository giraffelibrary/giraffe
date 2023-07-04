signature G_OBJECT_WEAK_REF =
  sig
    type t
    type 'a object_class
    val get : t -> base object_class option
    val init : 'a object_class -> t
  end
