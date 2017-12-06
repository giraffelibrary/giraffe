structure GObjectParamSpecBoxed :>
  G_OBJECT_PARAM_SPEC_BOXED
    where type 'a class = 'a GObjectParamSpecBoxedClass.class =
  struct
    type 'a class = 'a GObjectParamSpecBoxedClass.class
    type t = base class
  end
