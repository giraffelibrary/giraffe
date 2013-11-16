structure GioBufferedInputStream :>
  GIO_BUFFERED_INPUT_STREAM
    where type 'a class_t = 'a GioBufferedInputStreamClass.t
    where type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t =
  struct
    val getType_ = _import "g_buffered_input_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_buffered_input_stream_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newSized_ = fn x1 & x2 => (_import "g_buffered_input_stream_new_sized" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt64.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val fill_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_buffered_input_stream_fill" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int64.C.val_
               * unit GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int64.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAvailable_ = _import "g_buffered_input_stream_get_available" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt64.C.val_;
    val getBufferSize_ = _import "g_buffered_input_stream_get_buffer_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt64.C.val_;
    val peek_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_buffered_input_stream_peek" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt64.C.val_
               * FFI.UInt64.C.val_
               -> FFI.UInt64.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readByte_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_buffered_input_stream_read_byte" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int32.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setBufferSize_ = fn x1 & x2 => (_import "g_buffered_input_stream_set_buffer_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt64.C.val_ -> unit;) (x1, x2)
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
