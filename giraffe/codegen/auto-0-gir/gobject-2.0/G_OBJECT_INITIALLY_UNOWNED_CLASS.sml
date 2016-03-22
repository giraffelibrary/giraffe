signature G_OBJECT_INITIALLY_UNOWNED_CLASS =
  sig
    type 'a initially_unowned
    type 'a object_class
    include
      CLASS
        where type 'a class = 'a initially_unowned object_class
    type ('a, 'b) value_accessor
    val t : (base class, 'a class) value_accessor
    val tOpt : (base class option, 'a class option) value_accessor
  end
