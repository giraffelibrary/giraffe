structure GioBufferedInputStream :>
  GIO_BUFFERED_INPUT_STREAM
    where type 'a class = 'a GioBufferedInputStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_buffered_input_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_buffered_input_stream_new" : GioInputStreamClass.C.notnull GioInputStreamClass.C.p -> GioInputStreamClass.C.notnull GioInputStreamClass.C.p;
    val newSized_ = fn x1 & x2 => (_import "g_buffered_input_stream_new_sized" : GioInputStreamClass.C.notnull GioInputStreamClass.C.p * FFI.UInt64.C.val_ -> GioInputStreamClass.C.notnull GioInputStreamClass.C.p;) (x1, x2)
    val fill_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_buffered_input_stream_fill" :
              GioBufferedInputStreamClass.C.notnull GioBufferedInputStreamClass.C.p
               * FFI.Int64.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int64.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val fillFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_buffered_input_stream_fill_finish" :
              GioBufferedInputStreamClass.C.notnull GioBufferedInputStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int64.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAvailable_ = _import "g_buffered_input_stream_get_available" : GioBufferedInputStreamClass.C.notnull GioBufferedInputStreamClass.C.p -> FFI.UInt64.C.val_;
    val getBufferSize_ = _import "g_buffered_input_stream_get_buffer_size" : GioBufferedInputStreamClass.C.notnull GioBufferedInputStreamClass.C.p -> FFI.UInt64.C.val_;
    val readByte_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_buffered_input_stream_read_byte" :
              GioBufferedInputStreamClass.C.notnull GioBufferedInputStreamClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int32.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setBufferSize_ = fn x1 & x2 => (_import "g_buffered_input_stream_set_buffer_size" : GioBufferedInputStreamClass.C.notnull GioBufferedInputStreamClass.C.p * FFI.UInt64.C.val_ -> unit;) (x1, x2)
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
