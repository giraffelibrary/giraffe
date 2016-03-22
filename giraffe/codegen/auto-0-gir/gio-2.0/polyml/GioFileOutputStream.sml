structure GioFileOutputStream :>
  GIO_FILE_OUTPUT_STREAM
    where type 'a class = 'a GioFileOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_output_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getEtag_ = call (load_sym libgio "g_file_output_stream_get_etag") (GioFileOutputStreamClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val queryInfo_ =
        call (load_sym libgio "g_file_output_stream_query_info")
          (
            GioFileOutputStreamClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cPtr
          )
      val queryInfoFinish_ =
        call (load_sym libgio "g_file_output_stream_query_info_finish")
          (
            GioFileOutputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cPtr
          )
    end
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
