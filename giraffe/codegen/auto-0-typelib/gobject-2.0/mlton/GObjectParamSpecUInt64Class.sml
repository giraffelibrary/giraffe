structure GObjectParamSpecUInt64Class :>
  G_OBJECT_PARAM_SPEC_U_INT_64_CLASS
    where type 'a param_spec_class = 'a GObjectParamSpecClass.class
    where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    where type C.notnull = GObjectParamSpecClass.C.notnull
    where type 'a C.p = 'a GObjectParamSpecClass.C.p =
  struct
    type 'a param_spec_class = 'a GObjectParamSpecClass.class
    open GObjectParamSpecClass
    type 'a param_spec_u_int_64 = unit
    type 'a class = 'a param_spec_u_int_64 class
  end
