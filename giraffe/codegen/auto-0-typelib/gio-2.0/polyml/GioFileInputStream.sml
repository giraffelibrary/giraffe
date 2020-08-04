structure GioFileInputStream :>
  GIO_FILE_INPUT_STREAM
    where type 'a class = 'a GioFileInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_input_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val queryInfo_ =
        call (getSymbol "g_file_input_stream_query_info")
          (
            GioFileInputStreamClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cPtr
          )
      val queryInfoFinish_ =
        call (getSymbol "g_file_input_stream_query_info_finish")
          (
            GioFileInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GioFileInputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr false ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun queryInfo self (attributes, cancellable) =
      (
        GioFileInputStreamClass.FFI.withPtr false
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
        GioFileInputStreamClass.FFI.withPtr false
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
