structure GObjectClosure :>
  G_OBJECT_CLOSURE
    where type record_t = GObjectClosureRecord.t
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_closure_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val invalidate_ = call (load_sym libgobject "g_closure_invalidate") (GObjectClosureRecord.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type record_t = GObjectClosureRecord.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun invalidate self = (GObjectClosureRecord.C.withPtr ---> I) invalidate_ self
  end
