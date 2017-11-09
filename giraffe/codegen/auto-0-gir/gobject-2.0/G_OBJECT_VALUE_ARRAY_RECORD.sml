signature G_OBJECT_VALUE_ARRAY_RECORD =
  sig
    include RECORD
    type ('a, 'b) value_accessor_t
    val t : (t, t) value_accessor_t
    val tOpt : (t option, t option) value_accessor_t
  end
