structure GioAsyncResult :>
  GIO_ASYNC_RESULT
    where type 'a class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_async_result_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getSourceObject_ = call (load_sym libgio "g_async_result_get_source_object") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getSourceObject self = (GObjectObjectClass.C.withPtr ---> GObjectObjectClass.C.fromPtr true) getSourceObject_ self
  end
