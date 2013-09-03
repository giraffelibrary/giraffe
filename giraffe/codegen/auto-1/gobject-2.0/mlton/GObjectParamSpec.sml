structure GObjectParamSpec :>
  G_OBJECT_PARAM_SPEC
    where type 'a class_t = 'a GObjectParamSpecClass.t
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.C.val_;
    val getBlurb_ = _import "g_param_spec_get_blurb" : GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getName_ = _import "g_param_spec_get_name" : GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getNick_ = _import "g_param_spec_get_nick" : GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getQdata_ = fn x1 & x2 => (_import "g_param_spec_get_qdata" : GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p * FFI.UInt32.val_ -> unit;) (x1, x2)
    val getRedirectTarget_ = _import "g_param_spec_get_redirect_target" : GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p -> GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p;
    val setQdata_ = fn x1 & x2 => (_import "g_param_spec_set_qdata" : GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p * FFI.UInt32.val_ -> unit;) (x1, x2)
    val stealQdata_ = fn x1 & x2 => (_import "g_param_spec_steal_qdata" : GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p * FFI.UInt32.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GObjectParamSpecClass.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getBlurb self = (GObjectParamSpecClass.C.withPtr ---> FFI.String.fromPtr false) getBlurb_ self
    fun getName self = (GObjectParamSpecClass.C.withPtr ---> FFI.String.fromPtr false) getName_ self
    fun getNick self = (GObjectParamSpecClass.C.withPtr ---> FFI.String.fromPtr false) getNick_ self
    fun getQdata self quark = (GObjectParamSpecClass.C.withPtr &&&> FFI.UInt32.withVal ---> I) getQdata_ (self & quark)
    fun getRedirectTarget self = (GObjectParamSpecClass.C.withPtr ---> GObjectParamSpecClass.C.fromPtr false) getRedirectTarget_ self
    fun setQdata self quark = (GObjectParamSpecClass.C.withPtr &&&> FFI.UInt32.withVal ---> I) setQdata_ (self & quark)
    fun stealQdata self quark = (GObjectParamSpecClass.C.withPtr &&&> FFI.UInt32.withVal ---> I) stealQdata_ (self & quark)
  end
