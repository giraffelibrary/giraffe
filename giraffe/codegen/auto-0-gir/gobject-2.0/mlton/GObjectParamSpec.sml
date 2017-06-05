structure GObjectParamSpec :>
  G_OBJECT_PARAM_SPEC
    where type 'a class = 'a GObjectParamSpecClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "intern" : unit -> GObjectType.FFI.val_;
    val getBlurb_ = _import "g_param_spec_get_blurb" : GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getName_ = _import "g_param_spec_get_name" : GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getNick_ = _import "g_param_spec_get_nick" : GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getRedirectTarget_ = _import "g_param_spec_get_redirect_target" : GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p -> GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p;
    type 'a class = 'a GObjectParamSpecClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getBlurb self = (GObjectParamSpecClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getBlurb_ self
    fun getName self = (GObjectParamSpecClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getNick self = (GObjectParamSpecClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getNick_ self
    fun getRedirectTarget self = (GObjectParamSpecClass.FFI.withPtr ---> GObjectParamSpecClass.FFI.fromPtr false) getRedirectTarget_ self
  end
