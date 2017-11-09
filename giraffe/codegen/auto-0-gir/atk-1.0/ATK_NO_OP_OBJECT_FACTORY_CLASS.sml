signature ATK_NO_OP_OBJECT_FACTORY_CLASS =
  sig
    type 'a no_op_object_factory
    type 'a object_factory_class
    include
      CLASS
        where type 'a class = 'a no_op_object_factory object_factory_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
