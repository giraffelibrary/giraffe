structure GioBufferedOutputStream :>
  GIO_BUFFERED_OUTPUT_STREAM
    where type 'a class = 'a GioBufferedOutputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_buffered_output_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_buffered_output_stream_new") (GioOutputStreamClass.PolyML.cPtr --> GioOutputStreamClass.PolyML.cPtr)
      val newSized_ = call (load_sym libgio "g_buffered_output_stream_new_sized") (GioOutputStreamClass.PolyML.cPtr &&> FFI.Size.PolyML.cVal --> GioOutputStreamClass.PolyML.cPtr)
      val getAutoGrow_ = call (load_sym libgio "g_buffered_output_stream_get_auto_grow") (GioBufferedOutputStreamClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getBufferSize_ = call (load_sym libgio "g_buffered_output_stream_get_buffer_size") (GioBufferedOutputStreamClass.PolyML.cPtr --> FFI.Size.PolyML.cVal)
      val setAutoGrow_ = call (load_sym libgio "g_buffered_output_stream_set_auto_grow") (GioBufferedOutputStreamClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBufferSize_ = call (load_sym libgio "g_buffered_output_stream_set_buffer_size") (GioBufferedOutputStreamClass.PolyML.cPtr &&> FFI.Size.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioBufferedOutputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GioOutputStreamClass.C.withPtr ---> GioBufferedOutputStreamClass.C.fromPtr true) new_ baseStream
    fun newSized baseStream size = (GioOutputStreamClass.C.withPtr &&&> FFI.Size.C.withVal ---> GioBufferedOutputStreamClass.C.fromPtr true) newSized_ (baseStream & size)
    fun getAutoGrow self = (GioBufferedOutputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) getAutoGrow_ self
    fun getBufferSize self = (GioBufferedOutputStreamClass.C.withPtr ---> FFI.Size.C.fromVal) getBufferSize_ self
    fun setAutoGrow self autoGrow = (GioBufferedOutputStreamClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAutoGrow_ (self & autoGrow)
    fun setBufferSize self size = (GioBufferedOutputStreamClass.C.withPtr &&&> FFI.Size.C.withVal ---> I) setBufferSize_ (self & size)
    local
      open Property
    in
      val autoGrowProp =
        {
          get = fn x => get "auto-grow" boolean x,
          set = fn x => set "auto-grow" boolean x
        }
      val bufferSizeProp =
        {
          get = fn x => get "buffer-size" uint x,
          set = fn x => set "buffer-size" uint x
        }
    end
  end
