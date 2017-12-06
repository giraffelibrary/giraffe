structure GObjectParamSpecValueArray :>
  G_OBJECT_PARAM_SPEC_VALUE_ARRAY
    where type 'a class = 'a GObjectParamSpecValueArrayClass.class =
  struct
    type 'a class = 'a GObjectParamSpecValueArrayClass.class
    type t = base class
  end
