structure GObjectParamSpecOverride :>
  G_OBJECT_PARAM_SPEC_OVERRIDE
    where type 'a class = 'a GObjectParamSpecOverrideClass.class =
  struct
    type 'a class = 'a GObjectParamSpecOverrideClass.class
    type t = base class
  end
