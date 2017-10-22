structure GioIOStream :>
  GIO_I_O_STREAM
    where type 'a class = 'a GioIOStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    val getType_ = _import "g_io_stream_get_type" : unit -> GObjectType.FFI.val_;
    val spliceFinish_ = fn x1 & x2 => (_import "g_io_stream_splice_finish" : GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val clearPending_ = _import "g_io_stream_clear_pending" : GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p -> unit;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_stream_close" :
              GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
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
            _import "g_io_stream_close_finish" :
              GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getInputStream_ = _import "g_io_stream_get_input_stream" : GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p -> GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p;
    val getOutputStream_ = _import "g_io_stream_get_output_stream" : GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p -> GioOutputStreamClass.FFI.notnull GioOutputStreamClass.FFI.p;
    val hasPending_ = _import "g_io_stream_has_pending" : GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p -> GBool.FFI.val_;
    val isClosed_ = _import "g_io_stream_is_closed" : GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p -> GBool.FFI.val_;
    val setPending_ = fn x1 & x2 => (_import "g_io_stream_set_pending" : GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    type 'a class = 'a GioIOStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun spliceFinish result = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) spliceFinish_ (result & [])
    fun clearPending self = (GioIOStreamClass.FFI.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioIOStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioIOStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun getInputStream self = (GioIOStreamClass.FFI.withPtr ---> GioInputStreamClass.FFI.fromPtr false) getInputStream_ self
    fun getOutputStream self = (GioIOStreamClass.FFI.withPtr ---> GioOutputStreamClass.FFI.fromPtr false) getOutputStream_ self
    fun hasPending self = (GioIOStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GioIOStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) isClosed_ self
    fun setPending self = (GioIOStreamClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) setPending_ (self & [])
    local
      open Property
    in
      val closedProp = {get = fn x => get "closed" boolean x}
      val inputStreamProp = {get = fn x => get "input-stream" GioInputStreamClass.tOpt x}
      val outputStreamProp = {get = fn x => get "output-stream" GioOutputStreamClass.tOpt x}
    end
  end
