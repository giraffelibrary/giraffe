signature G_OBJECT_TYPE_PLUGIN_CLASS =
  sig
    type 'a type_plugin
    type 'a object_class
    include
      CLASS
        where type 'a class = 'a type_plugin object_class
    type ('a, 'b) value_accessor_t
    val t : (base class, 'a class) value_accessor_t
    val tOpt : (base class option, 'a class option) value_accessor_t
  end
