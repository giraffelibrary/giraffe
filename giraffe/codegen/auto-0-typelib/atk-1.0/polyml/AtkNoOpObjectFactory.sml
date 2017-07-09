structure AtkNoOpObjectFactory :>
  ATK_NO_OP_OBJECT_FACTORY
    where type 'a class = 'a AtkNoOpObjectFactoryClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_no_op_object_factory_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "atk_no_op_object_factory_new") (cVoid --> AtkObjectFactoryClass.PolyML.cPtr)
    end
    type 'a class = 'a AtkNoOpObjectFactoryClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> AtkNoOpObjectFactoryClass.FFI.fromPtr true) new_ ()
  end
