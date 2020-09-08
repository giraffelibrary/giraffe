structure GioBufferedOutputStream :>
  GIO_BUFFERED_OUTPUT_STREAM
    where type 'a class = 'a GioBufferedOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_buffered_output_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_buffered_output_stream_new") (GioOutputStreamClass.PolyML.cPtr --> GioOutputStreamClass.PolyML.cPtr)
      val newSized_ = call (getSymbol "g_buffered_output_stream_new_sized") (GioOutputStreamClass.PolyML.cPtr &&> GUInt64.PolyML.cVal --> GioOutputStreamClass.PolyML.cPtr)
      val getAutoGrow_ = call (getSymbol "g_buffered_output_stream_get_auto_grow") (GioBufferedOutputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBufferSize_ = call (getSymbol "g_buffered_output_stream_get_buffer_size") (GioBufferedOutputStreamClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val setAutoGrow_ = call (getSymbol "g_buffered_output_stream_set_auto_grow") (GioBufferedOutputStreamClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setBufferSize_ = call (getSymbol "g_buffered_output_stream_set_buffer_size") (GioBufferedOutputStreamClass.PolyML.cPtr &&> GUInt64.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioBufferedOutputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr false ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseStream = (GioOutputStreamClass.FFI.withPtr false ---> GioBufferedOutputStreamClass.FFI.fromPtr true) new_ baseStream
    fun newSized (baseStream, size) = (GioOutputStreamClass.FFI.withPtr false &&&> GUInt64.FFI.withVal ---> GioBufferedOutputStreamClass.FFI.fromPtr true) newSized_ (baseStream & size)
    fun getAutoGrow self = (GioBufferedOutputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAutoGrow_ self
    fun getBufferSize self = (GioBufferedOutputStreamClass.FFI.withPtr false ---> GUInt64.FFI.fromVal) getBufferSize_ self
    fun setAutoGrow self autoGrow = (GioBufferedOutputStreamClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAutoGrow_ (self & autoGrow)
    fun setBufferSize self size = (GioBufferedOutputStreamClass.FFI.withPtr false &&&> GUInt64.FFI.withVal ---> I) setBufferSize_ (self & size)
    local
      open ValueAccessor
    in
      val autoGrowProp =
        {
          name = "auto-grow",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
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
