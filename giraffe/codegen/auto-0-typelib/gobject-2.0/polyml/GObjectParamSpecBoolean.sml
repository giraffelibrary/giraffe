structure GObjectParamSpecBoolean :>
  G_OBJECT_PARAM_SPEC_BOOLEAN
    where type 'a class = 'a GObjectParamSpecBooleanClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "intern") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GObjectParamSpecBooleanClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
