signature G_OBJECT_TYPE_PLUGIN_CLASS =
  sig
    type 'a type_plugin
    type 'a object_class_t
    type 'a t = 'a type_plugin object_class_t
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
