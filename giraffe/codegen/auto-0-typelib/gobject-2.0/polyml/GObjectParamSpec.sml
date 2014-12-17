structure GObjectParamSpec :>
  G_OBJECT_PARAM_SPEC
    where type 'a class_t = 'a GObjectParamSpecClass.t
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "intern") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getBlurb_ = call (load_sym libgobject "g_param_spec_get_blurb") (GObjectParamSpecClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getName_ = call (load_sym libgobject "g_param_spec_get_name") (GObjectParamSpecClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getNick_ = call (load_sym libgobject "g_param_spec_get_nick") (GObjectParamSpecClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getRedirectTarget_ = call (load_sym libgobject "g_param_spec_get_redirect_target") (GObjectParamSpecClass.PolyML.PTR --> GObjectParamSpecClass.PolyML.PTR)
    end
    type 'a class_t = 'a GObjectParamSpecClass.t
    type type_t = GObjectType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getBlurb self = (GObjectParamSpecClass.C.withPtr ---> FFI.String.C.fromPtr false) getBlurb_ self
    fun getName self = (GObjectParamSpecClass.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getNick self = (GObjectParamSpecClass.C.withPtr ---> FFI.String.C.fromPtr false) getNick_ self
    fun getRedirectTarget self = (GObjectParamSpecClass.C.withPtr ---> GObjectParamSpecClass.C.fromPtr false) getRedirectTarget_ self
  end
