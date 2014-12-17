structure GObjectParamSpecUInt64 :>
  G_OBJECT_PARAM_SPEC_U_INT_64
    where type 'a class_t = 'a GObjectParamSpecUInt64Class.t
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "intern") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type 'a class_t = 'a GObjectParamSpecUInt64Class.t
    type type_t = GObjectType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
