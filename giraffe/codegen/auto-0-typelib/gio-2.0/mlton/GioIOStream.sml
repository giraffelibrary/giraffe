structure GioIOStream :>
  GIO_I_O_STREAM
    where type 'a class = 'a GioIOStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    val getType_ = _import "g_io_stream_get_type" : unit -> GObjectType.FFI.val_;
    val spliceFinish_ = fn x1 & x2 => (_import "g_io_stream_splice_finish" : GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val clearPending_ = _import "g_io_stream_clear_pending" : GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p -> unit;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_stream_close" :
              GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p
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
            _import "g_io_stream_close_finish" :
              GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getInputStream_ = _import "g_io_stream_get_input_stream" : GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p -> GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p;
    val getOutputStream_ = _import "g_io_stream_get_output_stream" : GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p -> GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p;
    val hasPending_ = _import "g_io_stream_has_pending" : GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p -> GBool.FFI.val_;
    val isClosed_ = _import "g_io_stream_is_closed" : GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p -> GBool.FFI.val_;
    val setPending_ = fn x1 & x2 => (_import "g_io_stream_set_pending" : GioIOStreamClass.FFI.non_opt GioIOStreamClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    type 'a class = 'a GioIOStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun spliceFinish result = (GioAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) spliceFinish_ (result & [])
    fun clearPending self = (GioIOStreamClass.FFI.withPtr false ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioIOStreamClass.FFI.withPtr false
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
        GioIOStreamClass.FFI.withPtr false
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
    fun getInputStream self = (GioIOStreamClass.FFI.withPtr false ---> GioInputStreamClass.FFI.fromPtr false) getInputStream_ self
    fun getOutputStream self = (GioIOStreamClass.FFI.withPtr false ---> GioOutputStreamClass.FFI.fromPtr false) getOutputStream_ self
    fun hasPending self = (GioIOStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GioIOStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) isClosed_ self
    fun setPending self = (GioIOStreamClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) setPending_ (self & [])
    local
      open Property
    in
      val closedProp = {get = fn x => get "closed" boolean x}
      val inputStreamProp = {get = fn x => get "input-stream" GioInputStreamClass.tOpt x}
      val outputStreamProp = {get = fn x => get "output-stream" GioOutputStreamClass.tOpt x}
    end
  end
