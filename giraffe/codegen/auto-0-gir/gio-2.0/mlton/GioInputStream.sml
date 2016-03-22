structure GioInputStream :>
  GIO_INPUT_STREAM
    where type 'a class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_input_stream_get_type" : unit -> GObjectType.C.val_;
    val clearPending_ = _import "g_input_stream_clear_pending" : GioInputStreamClass.C.notnull GioInputStreamClass.C.p -> unit;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_close" :
              GioInputStreamClass.C.notnull GioInputStreamClass.C.p
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
            _import "g_input_stream_close_finish" :
              GioInputStreamClass.C.notnull GioInputStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hasPending_ = _import "g_input_stream_has_pending" : GioInputStreamClass.C.notnull GioInputStreamClass.C.p -> FFI.Bool.C.val_;
    val isClosed_ = _import "g_input_stream_is_closed" : GioInputStreamClass.C.notnull GioInputStreamClass.C.p -> FFI.Bool.C.val_;
    val readFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_read_finish" :
              GioInputStreamClass.C.notnull GioInputStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.SSize.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setPending_ = fn x1 & x2 => (_import "g_input_stream_set_pending" : GioInputStreamClass.C.notnull GioInputStreamClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val skip_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_input_stream_skip" :
              GioInputStreamClass.C.notnull GioInputStreamClass.C.p
               * FFI.Size.C.val_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.SSize.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val skipFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_skip_finish" :
              GioInputStreamClass.C.notnull GioInputStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.SSize.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun clearPending self = (GioInputStreamClass.C.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioInputStreamClass.C.withPtr
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
        GioInputStreamClass.C.withPtr
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
    fun hasPending self = (GioInputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GioInputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun readFinish self result =
      (
        GioInputStreamClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.SSize.C.fromVal
      )
        readFinish_
        (
          self
           & result
           & []
        )
    fun setPending self = (GioInputStreamClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) setPending_ (self & [])
    fun skip self count cancellable =
      (
        GioInputStreamClass.C.withPtr
         &&&> FFI.Size.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.SSize.C.fromVal
      )
        skip_
        (
          self
           & count
           & cancellable
           & []
        )
    fun skipFinish self result =
      (
        GioInputStreamClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.SSize.C.fromVal
      )
        skipFinish_
        (
          self
           & result
           & []
        )
  end
