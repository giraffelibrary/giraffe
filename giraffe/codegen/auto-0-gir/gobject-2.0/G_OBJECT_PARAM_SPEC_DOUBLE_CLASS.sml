signature G_OBJECT_PARAM_SPEC_DOUBLE_CLASS =
  sig
    type 'a param_spec_double
    type 'a param_spec_class
    include
      CLASS
        where type 'a class = 'a param_spec_double param_spec_class
    type ('a, 'b) value_accessor
    val t : (base class, 'a class) value_accessor
    val tOpt : (base class option, 'a class option) value_accessor
  end
