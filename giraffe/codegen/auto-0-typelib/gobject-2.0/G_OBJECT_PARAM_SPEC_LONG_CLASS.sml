signature G_OBJECT_PARAM_SPEC_LONG_CLASS =
  sig
    type 'a param_spec_long
    type 'a param_spec_class_t
    type 'a t = 'a param_spec_long param_spec_class_t
    val toBase : 'a t -> base t
    type ('a, 'b) value_accessor
    val t : (base t, 'a t) value_accessor
    val tOpt : (base t option, 'a t option) value_accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a t
        val fromOptPtr :
          bool
           -> unit p
           -> 'a t option
      end
  end
