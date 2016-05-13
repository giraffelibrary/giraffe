structure GObjectParamSpec :>
  G_OBJECT_PARAM_SPEC
    where type 'a class = 'a GObjectParamSpecClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "intern") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getBlurb_ = call (load_sym libgobject "g_param_spec_get_blurb") (GObjectParamSpecClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (load_sym libgobject "g_param_spec_get_name") (GObjectParamSpecClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNick_ = call (load_sym libgobject "g_param_spec_get_nick") (GObjectParamSpecClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getRedirectTarget_ = call (load_sym libgobject "g_param_spec_get_redirect_target") (GObjectParamSpecClass.PolyML.cPtr --> GObjectParamSpecClass.PolyML.cPtr)
    end
    type 'a class = 'a GObjectParamSpecClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getBlurb self = (GObjectParamSpecClass.C.withPtr ---> Utf8.C.fromPtr false) getBlurb_ self
    fun getName self = (GObjectParamSpecClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getNick self = (GObjectParamSpecClass.C.withPtr ---> Utf8.C.fromPtr false) getNick_ self
    fun getRedirectTarget self = (GObjectParamSpecClass.C.withPtr ---> GObjectParamSpecClass.C.fromPtr false) getRedirectTarget_ self
  end
