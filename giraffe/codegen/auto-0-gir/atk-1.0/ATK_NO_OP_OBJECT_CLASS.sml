signature ATK_NO_OP_OBJECT_CLASS =
  sig
    type 'a no_op_object
    type 'a object_class
    include
      CLASS
        where type 'a class = 'a no_op_object object_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
