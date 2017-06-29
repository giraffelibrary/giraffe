signature G_OBJECT_CLOSURE_RECORD =
  sig
    include RECORD
    type ('a, 'b) value_accessor
    val t : (t, t) value_accessor
    val tOpt : (t option, t option) value_accessor
  end
