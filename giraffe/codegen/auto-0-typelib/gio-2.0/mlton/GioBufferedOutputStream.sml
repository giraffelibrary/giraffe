structure GioBufferedOutputStream :>
  GIO_BUFFERED_OUTPUT_STREAM
    where type 'a class = 'a GioBufferedOutputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    val getType_ = _import "g_buffered_output_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_buffered_output_stream_new" : GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p -> GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p;
    val newSized_ = fn x1 & x2 => (_import "g_buffered_output_stream_new_sized" : GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p * FFI.UInt64.C.val_ -> GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p;) (x1, x2)
    val getAutoGrow_ = _import "g_buffered_output_stream_get_auto_grow" : GioBufferedOutputStreamClass.C.notnull GioBufferedOutputStreamClass.C.p -> FFI.Bool.C.val_;
    val getBufferSize_ = _import "g_buffered_output_stream_get_buffer_size" : GioBufferedOutputStreamClass.C.notnull GioBufferedOutputStreamClass.C.p -> FFI.UInt64.C.val_;
    val setAutoGrow_ = fn x1 & x2 => (_import "g_buffered_output_stream_set_auto_grow" : GioBufferedOutputStreamClass.C.notnull GioBufferedOutputStreamClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setBufferSize_ = fn x1 & x2 => (_import "g_buffered_output_stream_set_buffer_size" : GioBufferedOutputStreamClass.C.notnull GioBufferedOutputStreamClass.C.p * FFI.UInt64.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioBufferedOutputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GioOutputStreamClass.C.withPtr ---> GioBufferedOutputStreamClass.C.fromPtr true) new_ baseStream
    fun newSized baseStream size = (GioOutputStreamClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> GioBufferedOutputStreamClass.C.fromPtr true) newSized_ (baseStream & size)
    fun getAutoGrow self = (GioBufferedOutputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) getAutoGrow_ self
    fun getBufferSize self = (GioBufferedOutputStreamClass.C.withPtr ---> FFI.UInt64.C.fromVal) getBufferSize_ self
    fun setAutoGrow self autoGrow = (GioBufferedOutputStreamClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAutoGrow_ (self & autoGrow)
    fun setBufferSize self size = (GioBufferedOutputStreamClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> I) setBufferSize_ (self & size)
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
