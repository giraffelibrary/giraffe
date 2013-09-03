structure GObjectParamSpec :>
  G_OBJECT_PARAM_SPEC
    where type 'a class_t = 'a GObjectParamSpecClass.t
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "intern") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getBlurb_ = call (load_sym libgobject "g_param_spec_get_blurb") (GObjectParamSpecClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getName_ = call (load_sym libgobject "g_param_spec_get_name") (GObjectParamSpecClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getNick_ = call (load_sym libgobject "g_param_spec_get_nick") (GObjectParamSpecClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getQdata_ = call (load_sym libgobject "g_param_spec_get_qdata") (GObjectParamSpecClass.PolyML.PTR &&> FFI.PolyML.UInt32.VAL --> FFI.PolyML.VOID)
      val getRedirectTarget_ = call (load_sym libgobject "g_param_spec_get_redirect_target") (GObjectParamSpecClass.PolyML.PTR --> GObjectParamSpecClass.PolyML.PTR)
      val setQdata_ = call (load_sym libgobject "g_param_spec_set_qdata") (GObjectParamSpecClass.PolyML.PTR &&> FFI.PolyML.UInt32.VAL --> FFI.PolyML.VOID)
      val stealQdata_ = call (load_sym libgobject "g_param_spec_steal_qdata") (GObjectParamSpecClass.PolyML.PTR &&> FFI.PolyML.UInt32.VAL --> FFI.PolyML.VOID)
    end
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
