signature G_OBJECT_TYPE_MODULE_CLASS =
  sig
    type 'a type_module
    type 'a object_class
    include
      CLASS
        where type 'a class = 'a type_module object_class
    type ('a, 'b) value_accessor
    val t : (base class, 'a class) value_accessor
    val tOpt : (base class option, 'a class option) value_accessor
  end
