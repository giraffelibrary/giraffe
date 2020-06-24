structure AtkNoOpObjectFactoryClass :>
  ATK_NO_OP_OBJECT_FACTORY_CLASS
    where type 'a object_factory_class = 'a AtkObjectFactoryClass.class
    where type C.opt = AtkObjectFactoryClass.C.opt
    where type C.non_opt = AtkObjectFactoryClass.C.non_opt
    where type 'a C.p = 'a AtkObjectFactoryClass.C.p =
  struct
    type 'a object_factory_class = 'a AtkObjectFactoryClass.class
    open AtkObjectFactoryClass
    type 'a no_op_object_factory = unit
    type 'a class = 'a no_op_object_factory class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_no_op_object_factory_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
