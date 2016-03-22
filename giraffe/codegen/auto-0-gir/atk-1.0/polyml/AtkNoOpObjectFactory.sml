structure AtkNoOpObjectFactory :>
  ATK_NO_OP_OBJECT_FACTORY
    where type 'a class = 'a AtkNoOpObjectFactoryClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_no_op_object_factory_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libatk "atk_no_op_object_factory_new") (FFI.PolyML.cVoid --> AtkObjectFactoryClass.PolyML.cPtr)
    end
    type 'a class = 'a AtkNoOpObjectFactoryClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkNoOpObjectFactoryClass.C.fromPtr true) new_ ()
  end
