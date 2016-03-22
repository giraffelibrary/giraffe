structure GioFileOutputStream :>
  GIO_FILE_OUTPUT_STREAM
    where type 'a class = 'a GioFileOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_file_output_stream_get_type" : unit -> GObjectType.C.val_;
    val getEtag_ = _import "g_file_output_stream_get_etag" : GioFileOutputStreamClass.C.notnull GioFileOutputStreamClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val queryInfo_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_file_output_stream_query_info" :
              GioFileOutputStreamClass.C.notnull GioFileOutputStreamClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileInfoClass.C.notnull GioFileInfoClass.C.p;
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
              GioFileOutputStreamClass.C.notnull GioFileOutputStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioFileInfoClass.C.notnull GioFileInfoClass.C.p;
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
    fun asSeekable self = (GObjectObjectClass.C.withPtr ---> GioSeekableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getEtag self = (GioFileOutputStreamClass.C.withPtr ---> Utf8.C.fromPtr true) getEtag_ self
    fun queryInfo self attributes cancellable =
      (
        GioFileOutputStreamClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.C.fromPtr true
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
        GioFileOutputStreamClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.C.fromPtr true
      )
        queryInfoFinish_
        (
          self
           & result
           & []
        )
  end
