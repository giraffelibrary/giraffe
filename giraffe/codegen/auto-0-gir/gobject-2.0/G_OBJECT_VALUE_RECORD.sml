signature G_OBJECT_VALUE_RECORD =
  sig
    include VALUE_RECORD
    type ('a, 'b) value_accessor_t
    val t : (t, t) value_accessor_t
    val tOpt : (t option, t option) value_accessor_t
  end
