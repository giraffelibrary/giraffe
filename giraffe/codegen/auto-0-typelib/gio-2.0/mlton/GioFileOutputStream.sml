structure GioFileOutputStream :>
  GIO_FILE_OUTPUT_STREAM
    where type 'a class = 'a GioFileOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_file_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val getEtag_ = _import "g_file_output_stream_get_etag" : GioFileOutputStreamClass.FFI.non_opt GioFileOutputStreamClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val queryInfo_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_file_output_stream_query_info" :
              GioFileOutputStreamClass.FFI.non_opt GioFileOutputStreamClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val queryInfoFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_file_output_stream_query_info_finish" :
              GioFileOutputStreamClass.FFI.non_opt GioFileOutputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioFileInfoClass.FFI.non_opt GioFileInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioFileOutputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr false ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getEtag self = (GioFileOutputStreamClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getEtag_ self
    fun queryInfo self (attributes, cancellable) =
      (
        GioFileOutputStreamClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.FFI.fromPtr true
      )
        queryInfo_
        (
          self
           & attributes
           & cancellable
           & []
        )
    fun queryInfoFinish self result =
      (
        GioFileOutputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.FFI.fromPtr true
      )
        queryInfoFinish_
        (
          self
           & result
           & []
        )
  end
