structure GObjectClosure :>
  G_OBJECT_CLOSURE
    where type t = GObjectClosureRecord.t
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_closure_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val invalidate_ = call (load_sym libgobject "g_closure_invalidate") (GObjectClosureRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type t = GObjectClosureRecord.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun invalidate self = (GObjectClosureRecord.FFI.withPtr ---> I) invalidate_ self
  end
