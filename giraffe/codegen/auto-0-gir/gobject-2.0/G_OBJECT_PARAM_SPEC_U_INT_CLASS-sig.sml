signature G_OBJECT_PARAM_SPEC_U_INT_CLASS =
  sig
    type 'a param_spec_u_int
    type 'a param_spec_class
    include
      CLASS
        where type 'a class = 'a param_spec_u_int param_spec_class
    type ('a, 'b) value_accessor_t
    val t : (base class, 'a class) value_accessor_t
    val tOpt : (base class option, 'a class option) value_accessor_t
    val toDerived :
      ('a class, 'b) value_accessor_t
       -> base class
       -> 'a class
  end
