structure GioInputStream :>
  GIO_INPUT_STREAM
    where type 'a class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_input_stream_get_type" : unit -> GObjectType.FFI.val_;
    val clearPending_ = _import "g_input_stream_clear_pending" : GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p -> unit;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_close" :
              GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hasPending_ = _import "g_input_stream_has_pending" : GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p -> GBool.FFI.val_;
    val isClosed_ = _import "g_input_stream_is_closed" : GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p -> GBool.FFI.val_;
    val read_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_input_stream_read" :
              GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GUInt64.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val readAll_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_input_stream_read_all" :
              GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GUInt64.FFI.val_
               * GUInt64.FFI.ref_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val readAllFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_input_stream_read_all_finish" :
              GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GUInt64.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val readBytes_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_input_stream_read_bytes" :
              GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GUInt64.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val readBytesFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_read_bytes_finish" :
              GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val readFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_read_finish" :
              GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setPending_ = fn x1 & x2 => (_import "g_input_stream_set_pending" : GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val skip_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_input_stream_skip" :
              GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GUInt64.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
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
              GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun clearPending self = (GioInputStreamClass.FFI.withPtr false ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        close_
        (
          self
           & cancellable
           & []
        )
    fun closeFinish self result =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun hasPending self = (GioInputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GioInputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) isClosed_ self
    fun read self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val retVal =
          (
            GioInputStreamClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GInt64.FFI.fromVal
          )
            read_
            (
              self
               & buffer
               & count
               & cancellable
               & []
            )
      in
        retVal
      end
    fun readAll self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val bytesRead & () =
          (
            GioInputStreamClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && ignore
          )
            readAll_
            (
              self
               & buffer
               & count
               & GUInt64.null
               & cancellable
               & []
            )
      in
        bytesRead
      end
    fun readAllFinish self result =
      let
        val bytesRead & () =
          (
            GioInputStreamClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && ignore
          )
            readAllFinish_
            (
              self
               & result
               & GUInt64.null
               & []
            )
      in
        bytesRead
      end
    fun readBytes self (count, cancellable) =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GUInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GLibBytesRecord.FFI.fromPtr true
      )
        readBytes_
        (
          self
           & count
           & cancellable
           & []
        )
    fun readBytesFinish self result =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GLibBytesRecord.FFI.fromPtr true
      )
        readBytesFinish_
        (
          self
           & result
           & []
        )
    fun readFinish self result =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        readFinish_
        (
          self
           & result
           & []
        )
    fun setPending self = (GioInputStreamClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) setPending_ (self & [])
    fun skip self (count, cancellable) =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GUInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
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
        GioInputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        skipFinish_
        (
          self
           & result
           & []
        )
  end
