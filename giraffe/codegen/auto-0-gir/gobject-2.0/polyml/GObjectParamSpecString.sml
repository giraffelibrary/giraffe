structure GObjectParamSpecString :>
  G_OBJECT_PARAM_SPEC_STRING
    where type 'a class = 'a GObjectParamSpecStringClass.class =
  struct
    type 'a class = 'a GObjectParamSpecStringClass.class
    type t = base class
  end
