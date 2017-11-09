signature G_OBJECT_PARAM_SPEC_CLASS =
  sig
    include CLASS
    type ('a, 'b) value_accessor_t
    val t : (base class, 'a class) value_accessor_t
    val tOpt : (base class option, 'a class option) value_accessor_t
  end
