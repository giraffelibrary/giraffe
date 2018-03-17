structure AtkNoOpObjectFactoryClass :>
  ATK_NO_OP_OBJECT_FACTORY_CLASS
    where type 'a object_factory_class = 'a AtkObjectFactoryClass.class
    where type C.notnull = AtkObjectFactoryClass.C.notnull
    where type 'a C.p = 'a AtkObjectFactoryClass.C.p =
  struct
    type 'a object_factory_class = 'a AtkObjectFactoryClass.class
    open AtkObjectFactoryClass
    type 'a no_op_object_factory = unit
    type 'a class = 'a no_op_object_factory class
    val getType_ = _import "atk_no_op_object_factory_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.notnull FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.notnull FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit FFI.p -> unit;) (x1, x2)
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
