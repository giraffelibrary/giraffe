structure GioBufferedOutputStream :>
  GIO_BUFFERED_OUTPUT_STREAM
    where type 'a class = 'a GioBufferedOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    val getType_ = _import "g_buffered_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_buffered_output_stream_new" : GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p -> GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p;
    val newSized_ = fn x1 & x2 => (_import "g_buffered_output_stream_new_sized" : GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p * GUInt64.FFI.val_ -> GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p;) (x1, x2)
    val getAutoGrow_ = _import "g_buffered_output_stream_get_auto_grow" : GioBufferedOutputStreamClass.FFI.non_opt GioBufferedOutputStreamClass.FFI.p -> GBool.FFI.val_;
    val getBufferSize_ = _import "g_buffered_output_stream_get_buffer_size" : GioBufferedOutputStreamClass.FFI.non_opt GioBufferedOutputStreamClass.FFI.p -> GUInt64.FFI.val_;
    val setAutoGrow_ = fn x1 & x2 => (_import "g_buffered_output_stream_set_auto_grow" : GioBufferedOutputStreamClass.FFI.non_opt GioBufferedOutputStreamClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setBufferSize_ = fn x1 & x2 => (_import "g_buffered_output_stream_set_buffer_size" : GioBufferedOutputStreamClass.FFI.non_opt GioBufferedOutputStreamClass.FFI.p * GUInt64.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioBufferedOutputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseStream = (GioOutputStreamClass.FFI.withPtr ---> GioBufferedOutputStreamClass.FFI.fromPtr true) new_ baseStream
    fun newSized (baseStream, size) = (GioOutputStreamClass.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GioBufferedOutputStreamClass.FFI.fromPtr true) newSized_ (baseStream & size)
    fun getAutoGrow self = (GioBufferedOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) getAutoGrow_ self
    fun getBufferSize self = (GioBufferedOutputStreamClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getBufferSize_ self
    fun setAutoGrow self autoGrow = (GioBufferedOutputStreamClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAutoGrow_ (self & autoGrow)
    fun setBufferSize self size = (GioBufferedOutputStreamClass.FFI.withPtr &&&> GUInt64.FFI.withVal ---> I) setBufferSize_ (self & size)
    local
      open Property
    in
      val autoGrowProp =
        {
          get = fn x => get "auto-grow" boolean x,
          set = fn x => set "auto-grow" boolean x,
          new = fn x => new "auto-grow" boolean x
        }
      val bufferSizeProp =
        {
          get = fn x => get "buffer-size" uint x,
          set = fn x => set "buffer-size" uint x,
          new = fn x => new "buffer-size" uint x
        }
    end
  end
