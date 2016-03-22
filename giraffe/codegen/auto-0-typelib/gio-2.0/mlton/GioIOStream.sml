structure GioIOStream :>
  GIO_I_O_STREAM
    where type 'a class = 'a GioIOStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    val getType_ = _import "g_io_stream_get_type" : unit -> GObjectType.C.val_;
    val spliceFinish_ = fn x1 & x2 => (_import "g_io_stream_splice_finish" : GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    val clearPending_ = _import "g_io_stream_clear_pending" : GioIOStreamClass.C.notnull GioIOStreamClass.C.p -> unit;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_stream_close" :
              GioIOStreamClass.C.notnull GioIOStreamClass.C.p
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
            _import "g_io_stream_close_finish" :
              GioIOStreamClass.C.notnull GioIOStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getInputStream_ = _import "g_io_stream_get_input_stream" : GioIOStreamClass.C.notnull GioIOStreamClass.C.p -> GioInputStreamClass.C.notnull GioInputStreamClass.C.p;
    val getOutputStream_ = _import "g_io_stream_get_output_stream" : GioIOStreamClass.C.notnull GioIOStreamClass.C.p -> GioOutputStreamClass.C.notnull GioOutputStreamClass.C.p;
    val hasPending_ = _import "g_io_stream_has_pending" : GioIOStreamClass.C.notnull GioIOStreamClass.C.p -> FFI.Bool.C.val_;
    val isClosed_ = _import "g_io_stream_is_closed" : GioIOStreamClass.C.notnull GioIOStreamClass.C.p -> FFI.Bool.C.val_;
    val setPending_ = fn x1 & x2 => (_import "g_io_stream_set_pending" : GioIOStreamClass.C.notnull GioIOStreamClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    type 'a class = 'a GioIOStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun spliceFinish result = (GioAsyncResultClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) spliceFinish_ (result & [])
    fun clearPending self = (GioIOStreamClass.C.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioIOStreamClass.C.withPtr
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
        GioIOStreamClass.C.withPtr
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
    fun getInputStream self = (GioIOStreamClass.C.withPtr ---> GioInputStreamClass.C.fromPtr false) getInputStream_ self
    fun getOutputStream self = (GioIOStreamClass.C.withPtr ---> GioOutputStreamClass.C.fromPtr false) getOutputStream_ self
    fun hasPending self = (GioIOStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GioIOStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun setPending self = (GioIOStreamClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) setPending_ (self & [])
    local
      open Property
    in
      val closedProp =
        {
          get = fn x => get "closed" boolean x,
          set = fn x => set "closed" boolean x
        }
      val inputStreamProp = {get = fn x => get "input-stream" GioInputStreamClass.tOpt x}
      val outputStreamProp = {get = fn x => get "output-stream" GioOutputStreamClass.tOpt x}
    end
  end
