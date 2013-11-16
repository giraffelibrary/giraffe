structure GioBufferedInputStream :>
  GIO_BUFFERED_INPUT_STREAM
    where type 'a class_t = 'a GioBufferedInputStreamClass.t
    where type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_buffered_input_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_buffered_input_stream_new") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val newSized_ = call (load_sym libgio "g_buffered_input_stream_new_sized") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt64.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val fill_ =
        call (load_sym libgio "g_buffered_input_stream_fill")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int64.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Int64.PolyML.VAL
          )
      val fillFinish_ =
        call (load_sym libgio "g_buffered_input_stream_fill_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Int64.PolyML.VAL
          )
      val getAvailable_ = call (load_sym libgio "g_buffered_input_stream_get_available") (GObjectObjectClass.PolyML.PTR --> FFI.UInt64.PolyML.VAL)
      val getBufferSize_ = call (load_sym libgio "g_buffered_input_stream_get_buffer_size") (GObjectObjectClass.PolyML.PTR --> FFI.UInt64.PolyML.VAL)
      val peek_ =
        call (load_sym libgio "g_buffered_input_stream_peek")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt64.PolyML.VAL
             &&> FFI.UInt64.PolyML.VAL
             --> FFI.UInt64.PolyML.VAL
          )
      val readByte_ =
        call (load_sym libgio "g_buffered_input_stream_read_byte")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Int32.PolyML.VAL
          )
      val setBufferSize_ = call (load_sym libgio "g_buffered_input_stream_set_buffer_size") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt64.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioBufferedInputStreamClass.t
    type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GObjectObjectClass.C.withPtr ---> GioBufferedInputStreamClass.C.fromPtr true) new_ baseStream
    fun newSized baseStream size = (GObjectObjectClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> GioBufferedInputStreamClass.C.fromPtr true) newSized_ (baseStream & size)
    fun fill self count cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int64.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Int64.C.fromVal
      )
        fillFinish_
        (
          self
           & result
           & []
        )
    fun getAvailable self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.C.fromVal) getAvailable_ self
    fun getBufferSize self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.C.fromVal) getBufferSize_ self
    fun peek self offset count =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> FFI.UInt64.C.withVal
         ---> FFI.UInt64.C.fromVal
      )
        peek_
        (
          self
           & offset
           & count
        )
    fun readByte self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Int32.C.fromVal
      )
        readByte_
        (
          self
           & cancellable
           & []
        )
    fun setBufferSize self size = (GObjectObjectClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> I) setBufferSize_ (self & size)
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
