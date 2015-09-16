structure GioBufferedOutputStream :>
  GIO_BUFFERED_OUTPUT_STREAM
    where type 'a class_t = 'a GioBufferedOutputStreamClass.t
    where type 'a output_stream_class_t = 'a GioOutputStreamClass.t =
  struct
    val getType_ = _import "g_buffered_output_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_buffered_output_stream_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newSized_ = fn x1 & x2 => (_import "g_buffered_output_stream_new_sized" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Size.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getAutoGrow_ = _import "g_buffered_output_stream_get_auto_grow" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getBufferSize_ = _import "g_buffered_output_stream_get_buffer_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Size.C.val_;
    val setAutoGrow_ = fn x1 & x2 => (_import "g_buffered_output_stream_set_auto_grow" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setBufferSize_ = fn x1 & x2 => (_import "g_buffered_output_stream_set_buffer_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Size.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GioBufferedOutputStreamClass.t
    type 'a output_stream_class_t = 'a GioOutputStreamClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GObjectObjectClass.C.withPtr ---> GioBufferedOutputStreamClass.C.fromPtr true) new_ baseStream
    fun newSized baseStream size = (GObjectObjectClass.C.withPtr &&&> FFI.Size.C.withVal ---> GioBufferedOutputStreamClass.C.fromPtr true) newSized_ (baseStream & size)
    fun getAutoGrow self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAutoGrow_ self
    fun getBufferSize self = (GObjectObjectClass.C.withPtr ---> FFI.Size.C.fromVal) getBufferSize_ self
    fun setAutoGrow self autoGrow = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAutoGrow_ (self & autoGrow)
    fun setBufferSize self size = (GObjectObjectClass.C.withPtr &&&> FFI.Size.C.withVal ---> I) setBufferSize_ (self & size)
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
