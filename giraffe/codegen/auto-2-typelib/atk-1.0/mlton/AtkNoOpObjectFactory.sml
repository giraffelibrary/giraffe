structure AtkNoOpObjectFactory :>
  ATK_NO_OP_OBJECT_FACTORY
    where type 'a class_t = 'a AtkNoOpObjectFactoryClass.t =
  struct
    val getType_ = _import "atk_no_op_object_factory_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "atk_no_op_object_factory_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a AtkNoOpObjectFactoryClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkNoOpObjectFactoryClass.C.fromPtr true) new_ ()
  end
