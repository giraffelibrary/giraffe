structure AtkNoOpObjectFactory :>
  ATK_NO_OP_OBJECT_FACTORY
    where type 'a class = 'a AtkNoOpObjectFactoryClass.class =
  struct
    val getType_ = _import "atk_no_op_object_factory_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "atk_no_op_object_factory_new" : unit -> AtkObjectFactoryClass.FFI.notnull AtkObjectFactoryClass.FFI.p;
    type 'a class = 'a AtkNoOpObjectFactoryClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> AtkNoOpObjectFactoryClass.FFI.fromPtr true) new_ ()
  end
