structure GObjectParamSpecUInt :>
  G_OBJECT_PARAM_SPEC_U_INT
    where type 'a class = 'a GObjectParamSpecUIntClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.C.val_;
    type 'a class = 'a GObjectParamSpecUIntClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
