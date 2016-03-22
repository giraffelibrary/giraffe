signature G_OBJECT_PARAM_SPEC_PARAM_CLASS =
  sig
    type 'a param_spec_param
    type 'a param_spec_class
    include
      CLASS
        where type 'a class = 'a param_spec_param param_spec_class
    type ('a, 'b) value_accessor
    val t : (base class, 'a class) value_accessor
    val tOpt : (base class option, 'a class option) value_accessor
  end
