structure GObjectClosure :>
  G_OBJECT_CLOSURE
    where type record_t = GObjectClosureRecord.t
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_closure_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val invalidate_ = call (load_sym libgobject "g_closure_invalidate") (GObjectClosureRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type record_t = GObjectClosureRecord.t
    type type_t = GObjectType.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun invalidate self = (GObjectClosureRecord.C.withPtr ---> I) invalidate_ self
  end
