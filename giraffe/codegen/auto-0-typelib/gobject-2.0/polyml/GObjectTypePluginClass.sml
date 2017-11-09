structure GObjectTypePluginClass :>
  G_OBJECT_TYPE_PLUGIN_CLASS
    where type 'a object_class = 'a GObjectObjectClass.class
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a object_class = 'a GObjectObjectClass.class
    open GObjectObjectClass
    type 'a type_plugin = unit
    type 'a class = 'a type_plugin class
  end
