structure GObjectParamSpecGType :>
  G_OBJECT_PARAM_SPEC_G_TYPE
    where type 'a class_t = 'a GObjectParamSpecGTypeClass.t
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GObjectParamSpecGTypeClass.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
