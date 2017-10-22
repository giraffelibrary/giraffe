structure GObjectParamSpec :>
  G_OBJECT_PARAM_SPEC
    where type 'a class = 'a GObjectParamSpecClass.class
    where type value_t = GObjectValueRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getBlurb_ = call (getSymbol "g_param_spec_get_blurb") (GObjectParamSpecClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDefaultValue_ = call (getSymbol "g_param_spec_get_default_value") (GObjectParamSpecClass.PolyML.cPtr --> GObjectValueRecord.PolyML.cPtr)
      val getName_ = call (getSymbol "g_param_spec_get_name") (GObjectParamSpecClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNameQuark_ = call (getSymbol "g_param_spec_get_name_quark") (GObjectParamSpecClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getNick_ = call (getSymbol "g_param_spec_get_nick") (GObjectParamSpecClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getRedirectTarget_ = call (getSymbol "g_param_spec_get_redirect_target") (GObjectParamSpecClass.PolyML.cPtr --> GObjectParamSpecClass.PolyML.cPtr)
    end
    type 'a class = 'a GObjectParamSpecClass.class
    type value_t = GObjectValueRecord.t
    type t = base class
    fun getBlurb self = (GObjectParamSpecClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getBlurb_ self
    fun getDefaultValue self = (GObjectParamSpecClass.FFI.withPtr ---> GObjectValueRecord.FFI.fromPtr false) getDefaultValue_ self
    fun getName self = (GObjectParamSpecClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getNameQuark self = (GObjectParamSpecClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getNameQuark_ self
    fun getNick self = (GObjectParamSpecClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getNick_ self
    fun getRedirectTarget self = (GObjectParamSpecClass.FFI.withPtr ---> GObjectParamSpecClass.FFI.fromPtr false) getRedirectTarget_ self
  end
