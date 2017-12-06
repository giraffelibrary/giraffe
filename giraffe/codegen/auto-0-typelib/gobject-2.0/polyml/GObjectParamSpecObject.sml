structure GObjectParamSpecObject :>
  G_OBJECT_PARAM_SPEC_OBJECT
    where type 'a class = 'a GObjectParamSpecObjectClass.class =
  struct
    type 'a class = 'a GObjectParamSpecObjectClass.class
    type t = base class
  end
