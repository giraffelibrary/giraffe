structure GObjectParamSpecParam :>
  G_OBJECT_PARAM_SPEC_PARAM
    where type 'a class_t = 'a GObjectParamSpecParamClass.t
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GObjectParamSpecParamClass.t
    type type_t = GObjectType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
