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
    type 'a class = 'a GioBufferedInputStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GObjectObjectClass.C.withPtr ---> GioBufferedInputStreamClass.C.fromPtr true) new_ baseStream
    fun newSized baseStream size = (GObjectObjectClass.C.withPtr &&&> FFI.Size.C.withVal ---> GioBufferedInputStreamClass.C.fromPtr true) newSized_ (baseStream & size)
    fun fill self count cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.SSize.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
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
         &&&> GLibErrorRecord.handleError
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
         &&&> GLibErrorRecord.handleError
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
