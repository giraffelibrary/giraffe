structure AtkNoOpObjectFactoryClass :>
  ATK_NO_OP_OBJECT_FACTORY_CLASS
    where type 'a object_factory_class = 'a AtkObjectFactoryClass.class
    where type C.notnull = AtkObjectFactoryClass.C.notnull
    where type 'a C.p = 'a AtkObjectFactoryClass.C.p =
  struct
    type 'a no_op_object_factory = unit
    type 'a object_factory_class = 'a AtkObjectFactoryClass.class
    type 'a class = 'a no_op_object_factory object_factory_class
    type t = base class
    fun toBase obj = obj
    val t = AtkObjectFactoryClass.t
    val tOpt = AtkObjectFactoryClass.tOpt
    structure C = AtkObjectFactoryClass.C
  end
