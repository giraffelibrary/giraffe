structure GioBufferedInputStream :>
  GIO_BUFFERED_INPUT_STREAM
    where type 'a class = 'a GioBufferedInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_buffered_input_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_buffered_input_stream_new") (GioInputStreamClass.PolyML.cPtr --> GioInputStreamClass.PolyML.cPtr)
      val newSized_ = call (getSymbol "g_buffered_input_stream_new_sized") (GioInputStreamClass.PolyML.cPtr &&> GSize.PolyML.cVal --> GioInputStreamClass.PolyML.cPtr)
      val fill_ =
        call (getSymbol "g_buffered_input_stream_fill")
          (
            GioBufferedInputStreamClass.PolyML.cPtr
             &&> GSSize.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GSSize.PolyML.cVal
          )
      val fillFinish_ =
        call (getSymbol "g_buffered_input_stream_fill_finish")
          (
            GioBufferedInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GSSize.PolyML.cVal
          )
      val getAvailable_ = call (getSymbol "g_buffered_input_stream_get_available") (GioBufferedInputStreamClass.PolyML.cPtr --> GSize.PolyML.cVal)
      val getBufferSize_ = call (getSymbol "g_buffered_input_stream_get_buffer_size") (GioBufferedInputStreamClass.PolyML.cPtr --> GSize.PolyML.cVal)
      val peek_ =
        call (getSymbol "g_buffered_input_stream_peek")
          (
            GioBufferedInputStreamClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> GSize.PolyML.cVal
             --> GSize.PolyML.cVal
          )
      val peekBuffer_ = call (getSymbol "g_buffered_input_stream_peek_buffer") (GioBufferedInputStreamClass.PolyML.cPtr &&> GSize.PolyML.cRef --> GUInt8CArrayN.PolyML.cOutPtr)
      val readByte_ =
        call (getSymbol "g_buffered_input_stream_read_byte")
          (
            GioBufferedInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt.PolyML.cVal
          )
      val setBufferSize_ = call (getSymbol "g_buffered_input_stream_set_buffer_size") (GioBufferedInputStreamClass.PolyML.cPtr &&> GSize.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioBufferedInputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr false ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseStream = (GioInputStreamClass.FFI.withPtr false ---> GioBufferedInputStreamClass.FFI.fromPtr true) new_ baseStream
    fun newSized (baseStream, size) = (GioInputStreamClass.FFI.withPtr false &&&> GSize.FFI.withVal ---> GioBufferedInputStreamClass.FFI.fromPtr true) newSized_ (baseStream & size)
    fun fill self (count, cancellable) =
      (
        GioBufferedInputStreamClass.FFI.withPtr false
         &&&> GSSize.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GSSize.FFI.fromVal
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
        GioBufferedInputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GSSize.FFI.fromVal
      )
        fillFinish_
        (
          self
           & result
           & []
        )
    fun getAvailable self = (GioBufferedInputStreamClass.FFI.withPtr false ---> GSize.FFI.fromVal) getAvailable_ self
    fun getBufferSize self = (GioBufferedInputStreamClass.FFI.withPtr false ---> GSize.FFI.fromVal) getBufferSize_ self
    fun peek self (buffer, offset) =
      let
        val count = GUInt8CArrayN.length buffer
        val retVal =
          (
            GioBufferedInputStreamClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GSize.FFI.withVal
             &&&> GSize.FFI.withVal
             ---> GSize.FFI.fromVal
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
        val count & retVal = (GioBufferedInputStreamClass.FFI.withPtr false &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr 0) peekBuffer_ (self & GSize.null)
      in
        retVal count before GioBufferedInputStreamClass.FFI.touchPtr self
      end
    fun readByte self cancellable =
      (
        GioBufferedInputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt.FFI.fromVal
      )
        readByte_
        (
          self
           & cancellable
           & []
        )
    fun setBufferSize self size = (GioBufferedInputStreamClass.FFI.withPtr false &&&> GSize.FFI.withVal ---> I) setBufferSize_ (self & size)
    local
      open ValueAccessor
    in
      val bufferSizeProp =
        {
          name = "buffer-size",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
    end
  end
