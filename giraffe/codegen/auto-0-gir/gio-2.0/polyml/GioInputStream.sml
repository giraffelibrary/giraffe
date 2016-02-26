structure GioInputStream :>
  GIO_INPUT_STREAM
    where type 'a class_t = 'a GioInputStreamClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_input_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val clearPending_ = call (load_sym libgio "g_input_stream_clear_pending") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val close_ =
        call (load_sym libgio "g_input_stream_close")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val closeFinish_ =
        call (load_sym libgio "g_input_stream_close_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val hasPending_ = call (load_sym libgio "g_input_stream_has_pending") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isClosed_ = call (load_sym libgio "g_input_stream_is_closed") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val readFinish_ =
        call (load_sym libgio "g_input_stream_read_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.SSize.PolyML.cVal
          )
      val setPending_ = call (load_sym libgio "g_input_stream_set_pending") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val skip_ =
        call (load_sym libgio "g_input_stream_skip")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Size.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.SSize.PolyML.cVal
          )
      val skipFinish_ =
        call (load_sym libgio "g_input_stream_skip_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.SSize.PolyML.cVal
          )
    end
    type 'a class_t = 'a GioInputStreamClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun clearPending self = (GObjectObjectClass.C.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun hasPending self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun readFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.SSize.C.fromVal
      )
        readFinish_
        (
          self
           & result
           & []
        )
    fun setPending self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) setPending_ (self & [])
    fun skip self count cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Size.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.SSize.C.fromVal
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.SSize.C.fromVal
      )
        skipFinish_
        (
          self
           & result
           & []
        )
  end
