structure GioInputStream :>
  GIO_INPUT_STREAM
    where type 'a class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_input_stream_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val clearPending_ = call (load_sym libgio "g_input_stream_clear_pending") (GioInputStreamClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val close_ =
        call (load_sym libgio "g_input_stream_close")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val closeFinish_ =
        call (load_sym libgio "g_input_stream_close_finish")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val hasPending_ = call (load_sym libgio "g_input_stream_has_pending") (GioInputStreamClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isClosed_ = call (load_sym libgio "g_input_stream_is_closed") (GioInputStreamClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val readFinish_ =
        call (load_sym libgio "g_input_stream_read_finish")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int64.PolyML.cVal
          )
      val setPending_ = call (load_sym libgio "g_input_stream_set_pending") (GioInputStreamClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val skip_ =
        call (load_sym libgio "g_input_stream_skip")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> FFI.UInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int64.PolyML.cVal
          )
      val skipFinish_ =
        call (load_sym libgio "g_input_stream_skip_finish")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int64.PolyML.cVal
          )
    end
    type 'a class = 'a GioInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun clearPending self = (GioInputStreamClass.C.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioInputStreamClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        close_
        (
          self
           & cancellable
           & []
        )
    fun closeFinish self result =
      (
        GioInputStreamClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun hasPending self = (GioInputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GioInputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun readFinish self result =
      (
        GioInputStreamClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int64.C.fromVal
      )
        readFinish_
        (
          self
           & result
           & []
        )
    fun setPending self = (GioInputStreamClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) setPending_ (self & [])
    fun skip self count cancellable =
      (
        GioInputStreamClass.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int64.C.fromVal
      )
        skip_
        (
          self
           & count
           & cancellable
           & []
        )
    fun skipFinish self result =
      (
        GioInputStreamClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int64.C.fromVal
      )
        skipFinish_
        (
          self
           & result
           & []
        )
  end
