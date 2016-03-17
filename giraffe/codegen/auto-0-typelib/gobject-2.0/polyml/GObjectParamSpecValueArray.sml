structure GObjectParamSpecValueArray :>
  G_OBJECT_PARAM_SPEC_VALUE_ARRAY
    where type 'a class = 'a GObjectParamSpecValueArrayClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "intern") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GObjectParamSpecValueArrayClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
