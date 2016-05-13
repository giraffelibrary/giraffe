structure GioBufferedInputStream :>
  GIO_BUFFERED_INPUT_STREAM
    where type 'a class = 'a GioBufferedInputStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_buffered_input_stream_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_buffered_input_stream_new") (GioInputStreamClass.PolyML.cPtr --> GioInputStreamClass.PolyML.cPtr)
      val newSized_ = call (load_sym libgio "g_buffered_input_stream_new_sized") (GioInputStreamClass.PolyML.cPtr &&> FFI.UInt64.PolyML.cVal --> GioInputStreamClass.PolyML.cPtr)
      val fill_ =
        call (load_sym libgio "g_buffered_input_stream_fill")
          (
            GioBufferedInputStreamClass.PolyML.cPtr
             &&> FFI.Int64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int64.PolyML.cVal
          )
      val fillFinish_ =
        call (load_sym libgio "g_buffered_input_stream_fill_finish")
          (
            GioBufferedInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int64.PolyML.cVal
          )
      val getAvailable_ = call (load_sym libgio "g_buffered_input_stream_get_available") (GioBufferedInputStreamClass.PolyML.cPtr --> FFI.UInt64.PolyML.cVal)
      val getBufferSize_ = call (load_sym libgio "g_buffered_input_stream_get_buffer_size") (GioBufferedInputStreamClass.PolyML.cPtr --> FFI.UInt64.PolyML.cVal)
      val readByte_ =
        call (load_sym libgio "g_buffered_input_stream_read_byte")
          (
            GioBufferedInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int32.PolyML.cVal
          )
      val setBufferSize_ = call (load_sym libgio "g_buffered_input_stream_set_buffer_size") (GioBufferedInputStreamClass.PolyML.cPtr &&> FFI.UInt64.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioBufferedInputStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GioInputStreamClass.C.withPtr ---> GioBufferedInputStreamClass.C.fromPtr true) new_ baseStream
    fun newSized baseStream size = (GioInputStreamClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> GioBufferedInputStreamClass.C.fromPtr true) newSized_ (baseStream & size)
    fun fill self count cancellable =
      (
        GioBufferedInputStreamClass.C.withPtr
         &&&> FFI.Int64.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int64.C.fromVal
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
        GioBufferedInputStreamClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int64.C.fromVal
      )
        fillFinish_
        (
          self
           & result
           & []
        )
    fun getAvailable self = (GioBufferedInputStreamClass.C.withPtr ---> FFI.UInt64.C.fromVal) getAvailable_ self
    fun getBufferSize self = (GioBufferedInputStreamClass.C.withPtr ---> FFI.UInt64.C.fromVal) getBufferSize_ self
    fun readByte self cancellable =
      (
        GioBufferedInputStreamClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int32.C.fromVal
      )
        readByte_
        (
          self
           & cancellable
           & []
        )
    fun setBufferSize self size = (GioBufferedInputStreamClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> I) setBufferSize_ (self & size)
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
