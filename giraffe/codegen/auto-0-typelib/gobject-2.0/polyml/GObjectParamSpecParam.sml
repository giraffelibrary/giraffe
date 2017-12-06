structure GObjectParamSpecParam :>
  G_OBJECT_PARAM_SPEC_PARAM
    where type 'a class = 'a GObjectParamSpecParamClass.class =
  struct
    type 'a class = 'a GObjectParamSpecParamClass.class
    type t = base class
  end
