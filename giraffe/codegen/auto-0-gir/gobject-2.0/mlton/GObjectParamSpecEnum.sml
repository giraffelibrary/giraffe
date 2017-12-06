structure GObjectParamSpecEnum :>
  G_OBJECT_PARAM_SPEC_ENUM
    where type 'a class = 'a GObjectParamSpecEnumClass.class =
  struct
    type 'a class = 'a GObjectParamSpecEnumClass.class
    type t = base class
  end
