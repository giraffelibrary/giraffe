signature G_OBJECT_BINDING_CLASS =
  sig
    type 'a binding
    type 'a object_class
    include
      CLASS
        where type 'a class = 'a binding object_class
    type ('a, 'b) value_accessor_t
    val t : (base class, 'a class) value_accessor_t
    val tOpt : (base class option, 'a class option) value_accessor_t
    val toDerived :
      ('a class, 'b) value_accessor_t
       -> base class
       -> 'a class
  end
