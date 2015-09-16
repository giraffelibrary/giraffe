structure GioFileInputStream :>
  GIO_FILE_INPUT_STREAM
    where type 'a class_t = 'a GioFileInputStreamClass.t
    where type 'a seekable_class_t = 'a GioSeekableClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a file_info_class_t = 'a GioFileInfoClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_input_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val queryInfo_ =
        call (load_sym libgio "g_file_input_stream_query_info")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val queryInfoFinish_ =
        call (load_sym libgio "g_file_input_stream_query_info_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
    end
    type 'a class_t = 'a GioFileInputStreamClass.t
    type 'a seekable_class_t = 'a GioSeekableClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a file_info_class_t = 'a GioFileInfoClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    fun asSeekable self = (GObjectObjectClass.C.withPtr ---> GioSeekableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun queryInfo self attributes cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
         ---> GioFileInfoClass.C.fromPtr true
      )
        queryInfoFinish_
        (
          self
           & result
           & []
        )
  end
