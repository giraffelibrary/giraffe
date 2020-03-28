structure GioBufferedInputStream :>
  GIO_BUFFERED_INPUT_STREAM
    where type 'a class = 'a GioBufferedInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_buffered_input_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_buffered_input_stream_new" : GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p -> GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p;
    val newSized_ = fn x1 & x2 => (_import "g_buffered_input_stream_new_sized" : GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p * GSize.FFI.val_ -> GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p;) (x1, x2)
    val fill_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_buffered_input_stream_fill" :
              GioBufferedInputStreamClass.FFI.notnull GioBufferedInputStreamClass.FFI.p
               * GSSize.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
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
              GioBufferedInputStreamClass.FFI.notnull GioBufferedInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAvailable_ = _import "g_buffered_input_stream_get_available" : GioBufferedInputStreamClass.FFI.notnull GioBufferedInputStreamClass.FFI.p -> GSize.FFI.val_;
    val getBufferSize_ = _import "g_buffered_input_stream_get_buffer_size" : GioBufferedInputStreamClass.FFI.notnull GioBufferedInputStreamClass.FFI.p -> GSize.FFI.val_;
    val peek_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_buffered_input_stream_peek" :
              GioBufferedInputStreamClass.FFI.notnull GioBufferedInputStreamClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.notnull GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               * GSize.FFI.val_
               -> GSize.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val peekBuffer_ = fn x1 & x2 => (_import "g_buffered_input_stream_peek_buffer" : GioBufferedInputStreamClass.FFI.notnull GioBufferedInputStreamClass.FFI.p * GSize.FFI.ref_ -> GUInt8CArrayN.FFI.notnull GUInt8CArrayN.FFI.out_p;) (x1, x2)
    val readByte_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_buffered_input_stream_read_byte" :
              GioBufferedInputStreamClass.FFI.notnull GioBufferedInputStreamClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setBufferSize_ = fn x1 & x2 => (_import "g_buffered_input_stream_set_buffer_size" : GioBufferedInputStreamClass.FFI.notnull GioBufferedInputStreamClass.FFI.p * GSize.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioBufferedInputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseStream = (GioInputStreamClass.FFI.withPtr ---> GioBufferedInputStreamClass.FFI.fromPtr true) new_ baseStream
    fun newSized (baseStream, size) = (GioInputStreamClass.FFI.withPtr &&&> GSize.FFI.withVal ---> GioBufferedInputStreamClass.FFI.fromPtr true) newSized_ (baseStream & size)
    fun fill self (count, cancellable) =
      (
        GioBufferedInputStreamClass.FFI.withPtr
         &&&> GSSize.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioBufferedInputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GSSize.FFI.fromVal
      )
        fillFinish_
        (
          self
           & result
           & []
        )
    fun getAvailable self = (GioBufferedInputStreamClass.FFI.withPtr ---> GSize.FFI.fromVal) getAvailable_ self
    fun getBufferSize self = (GioBufferedInputStreamClass.FFI.withPtr ---> GSize.FFI.fromVal) getBufferSize_ self
    fun peek self (buffer, offset) =
      let
        val count = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val retVal =
          (
            GioBufferedInputStreamClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
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
        val count & retVal = (GioBufferedInputStreamClass.FFI.withPtr &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr 0) peekBuffer_ (self & GSize.null)
      in
        retVal (LargeInt.toInt count)
      end
    fun readByte self cancellable =
      (
        GioBufferedInputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt.FFI.fromVal
      )
        readByte_
        (
          self
           & cancellable
           & []
        )
    fun setBufferSize self size = (GioBufferedInputStreamClass.FFI.withPtr &&&> GSize.FFI.withVal ---> I) setBufferSize_ (self & size)
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
