structure GObjectParamSpecPointer :>
  G_OBJECT_PARAM_SPEC_POINTER
    where type 'a class_t = 'a GObjectParamSpecPointerClass.t
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GObjectParamSpecPointerClass.t
    type type_t = GObjectType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
