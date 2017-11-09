structure GObjectParamSpecIntClass :>
  G_OBJECT_PARAM_SPEC_INT_CLASS
    where type 'a param_spec_class = 'a GObjectParamSpecClass.class
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    where type C.notnull = GObjectParamSpecClass.C.notnull
    where type 'a C.p = 'a GObjectParamSpecClass.C.p =
  struct
    type 'a param_spec_class = 'a GObjectParamSpecClass.class
    open GObjectParamSpecClass
    type 'a param_spec_int = unit
    type 'a class = 'a param_spec_int class
  end
