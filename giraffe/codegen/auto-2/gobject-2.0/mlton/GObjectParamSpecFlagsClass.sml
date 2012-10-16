structure GObjectParamSpecFlagsClass :>
  G_OBJECT_PARAM_SPEC_FLAGS_CLASS
    where type 'a paramspecclass_t = 'a GObjectParamSpecClass.t
    where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    where type C.notnull = GObjectParamSpecClass.C.notnull
    where type 'a C.p = 'a GObjectParamSpecClass.C.p =
  struct
    type 'a paramspecflags = unit
    type 'a paramspecclass_t = 'a GObjectParamSpecClass.t
    type 'a t = 'a paramspecflags paramspecclass_t
    fun toBase obj = obj
    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    val t = GObjectParamSpecClass.t
    val tOpt = GObjectParamSpecClass.tOpt
    structure C = GObjectParamSpecClass.C
  end
