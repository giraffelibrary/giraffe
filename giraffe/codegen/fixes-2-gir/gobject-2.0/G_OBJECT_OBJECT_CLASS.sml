signature G_OBJECT_OBJECT_CLASS =
  sig
    include CLASS
    type ('a, 'b) value_accessor
    val t : (base class, 'a class) value_accessor
    val tOpt : (base class option, 'a class option) value_accessor
  end
