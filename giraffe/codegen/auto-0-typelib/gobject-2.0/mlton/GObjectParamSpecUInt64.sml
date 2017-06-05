structure GObjectParamSpecUInt64 :>
  G_OBJECT_PARAM_SPEC_U_INT_64
    where type 'a class = 'a GObjectParamSpecUInt64Class.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GObjectParamSpecUInt64Class.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
