structure GioAsyncResult :>
  GIO_ASYNC_RESULT
    where type 'a class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_async_result_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getSourceObject_ = call (getSymbol "g_async_result_get_source_object") (GioAsyncResultClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val legacyPropagateError_ = call (getSymbol "g_async_result_legacy_propagate_error") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getSourceObject self = (GioAsyncResultClass.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr true) getSourceObject_ self
    fun legacyPropagateError self = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) legacyPropagateError_ (self & [])
  end
