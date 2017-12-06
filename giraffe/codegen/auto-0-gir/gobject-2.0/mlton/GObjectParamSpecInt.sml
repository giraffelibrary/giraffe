structure GObjectParamSpecInt :>
  G_OBJECT_PARAM_SPEC_INT
    where type 'a class = 'a GObjectParamSpecIntClass.class =
  struct
    type 'a class = 'a GObjectParamSpecIntClass.class
    type t = base class
  end
