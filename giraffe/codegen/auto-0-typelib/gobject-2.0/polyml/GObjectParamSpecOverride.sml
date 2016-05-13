structure GObjectParamSpecOverride :>
  G_OBJECT_PARAM_SPEC_OVERRIDE
    where type 'a class = 'a GObjectParamSpecOverrideClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "intern") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GObjectParamSpecOverrideClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
