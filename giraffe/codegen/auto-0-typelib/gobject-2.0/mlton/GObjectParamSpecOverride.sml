structure GObjectParamSpecOverride :>
  G_OBJECT_PARAM_SPEC_OVERRIDE
    where type 'a class_t = 'a GObjectParamSpecOverrideClass.t
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GObjectParamSpecOverrideClass.t
    type type_t = GObjectType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
