structure GObjectParamSpecPointer :>
  G_OBJECT_PARAM_SPEC_POINTER
    where type 'a class = 'a GObjectParamSpecPointerClass.class =
  struct
    type 'a class = 'a GObjectParamSpecPointerClass.class
    type t = base class
  end
