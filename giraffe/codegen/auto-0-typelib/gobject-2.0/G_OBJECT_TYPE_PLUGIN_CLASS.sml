signature G_OBJECT_TYPE_PLUGIN_CLASS =
  sig
    type 'a type_plugin
    type 'a object_class
    type 'a class = 'a type_plugin object_class
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
