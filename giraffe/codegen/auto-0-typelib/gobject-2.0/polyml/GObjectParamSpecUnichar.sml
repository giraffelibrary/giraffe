structure GObjectParamSpecUnichar :>
  G_OBJECT_PARAM_SPEC_UNICHAR
    where type 'a class_t = 'a GObjectParamSpecUnicharClass.t
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "intern") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class_t = 'a GObjectParamSpecUnicharClass.t
    type type_t = GObjectType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
