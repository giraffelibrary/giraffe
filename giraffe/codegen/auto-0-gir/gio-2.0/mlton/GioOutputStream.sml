structure GioOutputStream :>
  GIO_OUTPUT_STREAM
    where type 'a class = 'a GioOutputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type output_stream_splice_flags_t = GioOutputStreamSpliceFlags.t
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_output_stream_get_type" : unit -> GObjectType.C.val_;
    val clearPending_ = _import "g_output_stream_clear_pending" : GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p -> unit;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_output_stream_close" :
              GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val closeFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_output_stream_close_finish" :
              GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val flush_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_output_stream_flush" :
              GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val flushFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_output_stream_flush_finish" :
              GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hasPending_ = _import "g_output_stream_has_pending" : GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p -> FFI.Bool.C.val_;
    val isClosed_ = _import "g_output_stream_is_closed" : GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p -> FFI.Bool.C.val_;
    val isClosing_ = _import "g_output_stream_is_closing" : GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p -> FFI.Bool.C.val_;
    val setPending_ = fn x1 & x2 => (_import "g_output_stream_set_pending" : GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val splice_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_output_stream_splice" :
              GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p
               * GioInputStreamClass.C.notnull GioInputStreamClass.C.p
               * GioOutputStreamSpliceFlags.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.SSize.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val spliceFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_output_stream_splice_finish" :
              GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.SSize.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val writeFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_output_stream_write_finish" :
              GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.SSize.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioOutputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type output_stream_splice_flags_t = GioOutputStreamSpliceFlags.t
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun clearPending self = (GioOutputStreamClass.C.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioOutputStreamClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        close_
        (
          self
           & cancellable
           & []
        )
    fun closeFinish self result =
      (
        GioOutputStreamClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun flush self cancellable =
      (
        GioOutputStreamClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        flush_
        (
          self
           & cancellable
           & []
        )
    fun flushFinish self result =
      (
        GioOutputStreamClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        flushFinish_
        (
          self
           & result
           & []
        )
    fun hasPending self = (GioOutputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GioOutputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun isClosing self = (GioOutputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosing_ self
    fun setPending self = (GioOutputStreamClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) setPending_ (self & [])
    fun splice self source flags cancellable =
      (
        GioOutputStreamClass.C.withPtr
         &&&> GioInputStreamClass.C.withPtr
         &&&> GioOutputStreamSpliceFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.SSize.C.fromVal
      )
        splice_
        (
          self
           & source
           & flags
           & cancellable
           & []
        )
    fun spliceFinish self result =
      (
        GioOutputStreamClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.SSize.C.fromVal
      )
        spliceFinish_
        (
          self
           & result
           & []
        )
    fun writeFinish self result =
      (
        GioOutputStreamClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.SSize.C.fromVal
      )
        writeFinish_
        (
          self
           & result
           & []
        )
  end
