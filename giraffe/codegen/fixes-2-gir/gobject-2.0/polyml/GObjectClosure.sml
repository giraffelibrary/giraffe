structure GObjectClosure :>
  G_OBJECT_CLOSURE
    where type t = GObjectClosureRecord.t
    where type type_t = GObjectType.t
    where type 'a marshaller = 'a ClosureMarshal.marshaller =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_closure_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call
          (load_sym libgiraffegobject "giraffe_g_closure_new")
          (ClosureMarshal.PolyML.CALLBACK --> GObjectClosureRecord.PolyML.cPtr)
      val invalidate_ = call (load_sym libgobject "g_closure_invalidate") (GObjectClosureRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type t = GObjectClosureRecord.t
    type type_t = GObjectType.t
    type 'a marshaller = 'a ClosureMarshal.marshaller
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new marshaller callback =
      (ClosureMarshal.C.withCallback ---> GObjectClosureRecord.C.fromPtr false)
        new_
        (marshaller, callback)
    fun invalidate self = (GObjectClosureRecord.C.withPtr ---> I) invalidate_ self
  end
