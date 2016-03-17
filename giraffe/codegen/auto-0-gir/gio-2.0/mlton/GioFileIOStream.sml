structure GioFileIOStream :>
  GIO_FILE_I_O_STREAM
    where type 'a class = 'a GioFileIOStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_file_io_stream_get_type" : unit -> GObjectType.C.val_;
    val getEtag_ = _import "g_file_io_stream_get_etag" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val queryInfo_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_file_io_stream_query_info" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
            _import "g_file_io_stream_query_info_finish" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioFileIOStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.C.withPtr ---> GioSeekableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getEtag self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getEtag_ self
    fun queryInfo self attributes cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
