structure GioBufferedInputStream :>
  GIO_BUFFERED_INPUT_STREAM
    where type 'a class_t = 'a GioBufferedInputStreamClass.t
    where type 'a input_stream_class_t = 'a GioInputStreamClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_buffered_input_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_buffered_input_stream_new") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val newSized_ = call (load_sym libgio "g_buffered_input_stream_new_sized") (GObjectObjectClass.PolyML.cPtr &&> FFI.Size.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val fill_ =
        call (load_sym libgio "g_buffered_input_stream_fill")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.SSize.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.SSize.PolyML.cVal
          )
      val fillFinish_ =
        call (load_sym libgio "g_buffered_input_stream_fill_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.SSize.PolyML.cVal
          )
      val getAvailable_ = call (load_sym libgio "g_buffered_input_stream_get_available") (GObjectObjectClass.PolyML.cPtr --> FFI.Size.PolyML.cVal)
      val getBufferSize_ = call (load_sym libgio "g_buffered_input_stream_get_buffer_size") (GObjectObjectClass.PolyML.cPtr --> FFI.Size.PolyML.cVal)
      val readByte_ =
        call (load_sym libgio "g_buffered_input_stream_read_byte")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int.PolyML.cVal
          )
      val setBufferSize_ = call (load_sym libgio "g_buffered_input_stream_set_buffer_size") (GObjectObjectClass.PolyML.cPtr &&> FFI.Size.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GioBufferedInputStreamClass.t
    type 'a input_stream_class_t = 'a GioInputStreamClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GObjectObjectClass.C.withPtr ---> GioBufferedInputStreamClass.C.fromPtr true) new_ baseStream
    fun newSized baseStream size = (GObjectObjectClass.C.withPtr &&&> FFI.Size.C.withVal ---> GioBufferedInputStreamClass.C.fromPtr true) newSized_ (baseStream & size)
    fun fill self count cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.SSize.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.SSize.C.fromVal
      )
        fill_
        (
          self
           & count
           & cancellable
           & []
        )
    fun fillFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.SSize.C.fromVal
      )
        fillFinish_
        (
          self
           & result
           & []
        )
    fun getAvailable self = (GObjectObjectClass.C.withPtr ---> FFI.Size.C.fromVal) getAvailable_ self
    fun getBufferSize self = (GObjectObjectClass.C.withPtr ---> FFI.Size.C.fromVal) getBufferSize_ self
    fun readByte self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Int.C.fromVal
      )
        readByte_
        (
          self
           & cancellable
           & []
        )
    fun setBufferSize self size = (GObjectObjectClass.C.withPtr &&&> FFI.Size.C.withVal ---> I) setBufferSize_ (self & size)
    local
      open Property
    in
      val bufferSizeProp =
        {
          get = fn x => get "buffer-size" uint x,
          set = fn x => set "buffer-size" uint x
        }
    end
  end
