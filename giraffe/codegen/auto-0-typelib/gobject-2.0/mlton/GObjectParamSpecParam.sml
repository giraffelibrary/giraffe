structure GObjectParamSpecParam :>
  G_OBJECT_PARAM_SPEC_PARAM
    where type 'a class = 'a GObjectParamSpecParamClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.C.val_;
    type 'a class = 'a GObjectParamSpecParamClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
