structure GObjectParamSpec :>
  G_OBJECT_PARAM_SPEC
    where type 'a class = 'a GObjectParamSpecClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.C.val_;
    val getBlurb_ = _import "g_param_spec_get_blurb" : GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getName_ = _import "g_param_spec_get_name" : GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getNick_ = _import "g_param_spec_get_nick" : GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getRedirectTarget_ = _import "g_param_spec_get_redirect_target" : GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p -> GObjectParamSpecClass.C.notnull GObjectParamSpecClass.C.p;
    type 'a class = 'a GObjectParamSpecClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getBlurb self = (GObjectParamSpecClass.C.withPtr ---> Utf8.C.fromPtr false) getBlurb_ self
    fun getName self = (GObjectParamSpecClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getNick self = (GObjectParamSpecClass.C.withPtr ---> Utf8.C.fromPtr false) getNick_ self
    fun getRedirectTarget self = (GObjectParamSpecClass.C.withPtr ---> GObjectParamSpecClass.C.fromPtr false) getRedirectTarget_ self
  end
