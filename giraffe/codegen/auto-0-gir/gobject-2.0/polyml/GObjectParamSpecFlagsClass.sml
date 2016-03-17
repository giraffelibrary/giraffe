structure GObjectParamSpecFlagsClass :>
  G_OBJECT_PARAM_SPEC_FLAGS_CLASS
    where type 'a param_spec_class = 'a GObjectParamSpecClass.class
    where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    where type C.notnull = GObjectParamSpecClass.C.notnull
    where type 'a C.p = 'a GObjectParamSpecClass.C.p =
  struct
    type 'a param_spec_flags = unit
    type 'a param_spec_class = 'a GObjectParamSpecClass.class
    type 'a class = 'a param_spec_flags param_spec_class
    type t = base class
    fun toBase obj = obj
    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    val t = GObjectParamSpecClass.t
    val tOpt = GObjectParamSpecClass.tOpt
    structure C = GObjectParamSpecClass.C
  end
