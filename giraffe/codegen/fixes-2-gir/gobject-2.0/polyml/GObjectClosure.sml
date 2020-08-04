structure GObjectClosure :>
  G_OBJECT_CLOSURE
    where type t = GObjectClosureRecord.t
    where type type_t = GObjectType.t
    where type 'a marshaller = 'a ClosureMarshal.marshaller =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_closure_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call
          (getSymbol "giraffe_g_closure_new")
          (ClosureMarshal.PolyML.CALLBACK --> GObjectClosureRecord.PolyML.cPtr)
      val invalidate_ = call (getSymbol "g_closure_invalidate") (GObjectClosureRecord.PolyML.cPtr --> cVoid)
    end
    type t = GObjectClosureRecord.t
    type type_t = GObjectType.t
    type 'a marshaller = 'a ClosureMarshal.marshaller
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new marshaller callback =
      (ClosureMarshal.FFI.withCallback ---> GObjectClosureRecord.FFI.fromPtr false)
        new_
        (marshaller, callback)
    fun invalidate self = (GObjectClosureRecord.FFI.withPtr false ---> I) invalidate_ self
  end
