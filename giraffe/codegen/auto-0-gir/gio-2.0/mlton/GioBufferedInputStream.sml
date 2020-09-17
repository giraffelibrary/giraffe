structure GioBufferedInputStream :>
  GIO_BUFFERED_INPUT_STREAM
    where type 'a class = 'a GioBufferedInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_buffered_input_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_buffered_input_stream_new" : GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p -> GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p;
    val newSized_ = fn x1 & x2 => (_import "g_buffered_input_stream_new_sized" : GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p * GSize.FFI.val_ -> GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p;) (x1, x2)
    val fill_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_buffered_input_stream_fill" :
              GioBufferedInputStreamClass.FFI.non_opt GioBufferedInputStreamClass.FFI.p
               * GSSize.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioBufferedInputStreamClass.FFI.non_opt GioBufferedInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getAvailable_ = _import "g_buffered_input_stream_get_available" : GioBufferedInputStreamClass.FFI.non_opt GioBufferedInputStreamClass.FFI.p -> GSize.FFI.val_;
    val getBufferSize_ = _import "g_buffered_input_stream_get_buffer_size" : GioBufferedInputStreamClass.FFI.non_opt GioBufferedInputStreamClass.FFI.p -> GSize.FFI.val_;
    val peek_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_buffered_input_stream_peek" :
              GioBufferedInputStreamClass.FFI.non_opt GioBufferedInputStreamClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
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
    val peekBuffer_ = fn x1 & x2 => (_import "g_buffered_input_stream_peek_buffer" : GioBufferedInputStreamClass.FFI.non_opt GioBufferedInputStreamClass.FFI.p * GSize.FFI.ref_ -> GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.FFI.out_p;) (x1, x2)
    val readByte_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_buffered_input_stream_read_byte" :
              GioBufferedInputStreamClass.FFI.non_opt GioBufferedInputStreamClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setBufferSize_ = fn x1 & x2 => (_import "g_buffered_input_stream_set_buffer_size" : GioBufferedInputStreamClass.FFI.non_opt GioBufferedInputStreamClass.FFI.p * GSize.FFI.val_ -> unit;) (x1, x2)
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
