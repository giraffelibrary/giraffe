structure GObjectParamSpecGType :>
  G_OBJECT_PARAM_SPEC_G_TYPE
    where type 'a class = 'a GObjectParamSpecGTypeClass.class =
  struct
    type 'a class = 'a GObjectParamSpecGTypeClass.class
    type t = base class
  end
