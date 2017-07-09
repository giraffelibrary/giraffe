structure GioFileIOStream :>
  GIO_FILE_I_O_STREAM
    where type 'a class = 'a GioFileIOStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_io_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getEtag_ = call (getSymbol "g_file_io_stream_get_etag") (GioFileIOStreamClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val queryInfo_ =
        call (getSymbol "g_file_io_stream_query_info")
          (
            GioFileIOStreamClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cPtr
          )
      val queryInfoFinish_ =
        call (getSymbol "g_file_io_stream_query_info_finish")
          (
            GioFileIOStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GioFileIOStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getEtag self = (GioFileIOStreamClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getEtag_ self
    fun queryInfo self attributes cancellable =
      (
        GioFileIOStreamClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
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
        GioFileIOStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
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
