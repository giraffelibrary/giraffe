structure GObjectParamSpec :>
  G_OBJECT_PARAM_SPEC
    where type 'a class = 'a GObjectParamSpecClass.class
    where type value_t = GObjectValueRecord.t =
  struct
    val getBlurb_ = _import "g_param_spec_get_blurb" : GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getDefaultValue_ = _import "g_param_spec_get_default_value" : GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p -> GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p;
    val getName_ = _import "g_param_spec_get_name" : GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getNameQuark_ = _import "g_param_spec_get_name_quark" : GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p -> GUInt32.FFI.val_;
    val getNick_ = _import "g_param_spec_get_nick" : GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getRedirectTarget_ = _import "g_param_spec_get_redirect_target" : GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p -> GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p;
    type 'a class = 'a GObjectParamSpecClass.class
    type value_t = GObjectValueRecord.t
    type t = base class
    fun getBlurb self = (GObjectParamSpecClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getBlurb_ self
    fun getDefaultValue self = (GObjectParamSpecClass.FFI.withPtr false ---> GObjectValueRecord.FFI.fromPtr false) getDefaultValue_ self
    fun getName self = (GObjectParamSpecClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getNameQuark self = (GObjectParamSpecClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getNameQuark_ self
    fun getNick self = (GObjectParamSpecClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getNick_ self
    fun getRedirectTarget self = (GObjectParamSpecClass.FFI.withPtr false ---> GObjectParamSpecClass.FFI.fromPtr false) getRedirectTarget_ self
  end
