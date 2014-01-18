structure GObjectParamSpecLong :>
  G_OBJECT_PARAM_SPEC_LONG
    where type 'a class_t = 'a GObjectParamSpecLongClass.t
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "intern") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type 'a class_t = 'a GObjectParamSpecLongClass.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end