structure GioBufferedInputStream :>
  GIO_BUFFERED_INPUT_STREAM
    where type 'a class = 'a GioBufferedInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_buffered_input_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_buffered_input_stream_new") (GioInputStreamClass.PolyML.cPtr --> GioInputStreamClass.PolyML.cPtr)
      val newSized_ = call (getSymbol "g_buffered_input_stream_new_sized") (GioInputStreamClass.PolyML.cPtr &&> GUInt64.PolyML.cVal --> GioInputStreamClass.PolyML.cPtr)
      val fill_ =
        call (getSymbol "g_buffered_input_stream_fill")
          (
            GioBufferedInputStreamClass.PolyML.cPtr
             &&> GInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val fillFinish_ =
        call (getSymbol "g_buffered_input_stream_fill_finish")
          (
            GioBufferedInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val getAvailable_ = call (getSymbol "g_buffered_input_stream_get_available") (GioBufferedInputStreamClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val getBufferSize_ = call (getSymbol "g_buffered_input_stream_get_buffer_size") (GioBufferedInputStreamClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val peek_ =
        call (getSymbol "g_buffered_input_stream_peek")
          (
            GioBufferedInputStreamClass.PolyML.cPtr
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GUInt64.PolyML.cVal
             --> GUInt64.PolyML.cVal
          )
      val peekBuffer_ = call (getSymbol "g_buffered_input_stream_peek_buffer") (GioBufferedInputStreamClass.PolyML.cPtr &&> GUInt64.PolyML.cRef --> GUInt8CVectorN.PolyML.cOutPtr)
      val readByte_ =
        call (getSymbol "g_buffered_input_stream_read_byte")
          (
            GioBufferedInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt32.PolyML.cVal
          )
      val setBufferSize_ = call (getSymbol "g_buffered_input_stream_set_buffer_size") (GioBufferedInputStreamClass.PolyML.cPtr &&> GUInt64.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioBufferedInputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseStream = (GioInputStreamClass.FFI.withPtr ---> GioBufferedInputStreamClass.FFI.fromPtr true) new_ baseStream
    fun newSized (baseStream, size) = (GioInputStreamClass.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GioBufferedInputStreamClass.FFI.fromPtr true) newSized_ (baseStream & size)
    fun fill self (count, cancellable) =
      (
        GioBufferedInputStreamClass.FFI.withPtr
         &&&> GInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
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
        GioBufferedInputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        fillFinish_
        (
          self
           & result
           & []
        )
    fun getAvailable self = (GioBufferedInputStreamClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getAvailable_ self
    fun getBufferSize self = (GioBufferedInputStreamClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getBufferSize_ self
    fun peek self (buffer, offset) =
      let
        val count = LargeInt.fromInt (GUInt8CVectorN.length buffer)
        val retVal =
          (
            GioBufferedInputStreamClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GUInt64.FFI.withVal
             ---> GUInt64.FFI.fromVal
          )
            peek_
            (
              self
               & buffer
               & offset
               & count
            )
      in
        retVal
      end
    fun peekBuffer self =
      let
        val count & retVal = (GioBufferedInputStreamClass.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && GUInt8CVectorN.FFI.fromPtr 0) peekBuffer_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt count)
      end
    fun readByte self cancellable =
      (
        GioBufferedInputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt32.FFI.fromVal
      )
        readByte_
        (
          self
           & cancellable
           & []
        )
    fun setBufferSize self size = (GioBufferedInputStreamClass.FFI.withPtr &&&> GUInt64.FFI.withVal ---> I) setBufferSize_ (self & size)
    local
      open Property
    in
      val bufferSizeProp =
        {
          get = fn x => get "buffer-size" uint x,
          set = fn x => set "buffer-size" uint x,
          new = fn x => new "buffer-size" uint x
        }
    end
  end
