structure GioFileEnumerator :>
  GIO_FILE_ENUMERATOR
    where type 'a class = 'a GioFileEnumeratorClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a file_info_class = 'a GioFileInfoClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a file_class = 'a GioFileClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_enumerator_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val close_ =
        call (getSymbol "g_file_enumerator_close")
          (
            GioFileEnumeratorClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val closeFinish_ =
        call (getSymbol "g_file_enumerator_close_finish")
          (
            GioFileEnumeratorClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getContainer_ = call (getSymbol "g_file_enumerator_get_container") (GioFileEnumeratorClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val hasPending_ = call (getSymbol "g_file_enumerator_has_pending") (GioFileEnumeratorClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isClosed_ = call (getSymbol "g_file_enumerator_is_closed") (GioFileEnumeratorClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val nextFile_ =
        call (getSymbol "g_file_enumerator_next_file")
          (
            GioFileEnumeratorClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cPtr
          )
      val setPending_ = call (getSymbol "g_file_enumerator_set_pending") (GioFileEnumeratorClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioFileEnumeratorClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun close self cancellable =
      (
        GioFileEnumeratorClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        close_
        (
          self
           & cancellable
           & []
        )
    fun closeFinish self result =
      (
        GioFileEnumeratorClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun getContainer self = (GioFileEnumeratorClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr false) getContainer_ self
    fun hasPending self = (GioFileEnumeratorClass.FFI.withPtr ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GioFileEnumeratorClass.FFI.withPtr ---> GBool.FFI.fromVal) isClosed_ self
    fun nextFile self cancellable =
      (
        GioFileEnumeratorClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.FFI.fromPtr true
      )
        nextFile_
        (
          self
           & cancellable
           & []
        )
    fun setPending self pending = (GioFileEnumeratorClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setPending_ (self & pending)
    local
      open Property
    in
      val containerProp = {set = fn x => set "container" GioFileClass.tOpt x}
    end
  end
