signature G_OBJECT_PARAM_SPEC_U_LONG_CLASS =
  sig
    type 'a param_spec_u_long
    type 'a param_spec_class
    type 'a class = 'a param_spec_u_long param_spec_class
    type t = base class
    val toBase : 'a class -> base class
    type ('a, 'b) value_accessor
    val t : (base class, 'a class) value_accessor
    val tOpt : (base class option, 'a class option) value_accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a class
        val fromOptPtr :
          bool
           -> unit p
           -> 'a class option
      end
  end
