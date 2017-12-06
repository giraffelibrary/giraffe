structure GObjectParamSpecVariant :>
  G_OBJECT_PARAM_SPEC_VARIANT
    where type 'a class = 'a GObjectParamSpecVariantClass.class =
  struct
    type 'a class = 'a GObjectParamSpecVariantClass.class
    type t = base class
  end
