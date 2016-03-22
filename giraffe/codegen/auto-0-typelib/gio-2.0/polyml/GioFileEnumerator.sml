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
      val getType_ = call (load_sym libgio "g_file_enumerator_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val close_ =
        call (load_sym libgio "g_file_enumerator_close")
          (
            GioFileEnumeratorClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val closeFinish_ =
        call (load_sym libgio "g_file_enumerator_close_finish")
          (
            GioFileEnumeratorClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val getContainer_ = call (load_sym libgio "g_file_enumerator_get_container") (GioFileEnumeratorClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val hasPending_ = call (load_sym libgio "g_file_enumerator_has_pending") (GioFileEnumeratorClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isClosed_ = call (load_sym libgio "g_file_enumerator_is_closed") (GioFileEnumeratorClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val nextFile_ =
        call (load_sym libgio "g_file_enumerator_next_file")
          (
            GioFileEnumeratorClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cPtr
          )
      val setPending_ = call (load_sym libgio "g_file_enumerator_set_pending") (GioFileEnumeratorClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioFileEnumeratorClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a file_info_class = 'a GioFileInfoClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun close self cancellable =
      (
        GioFileEnumeratorClass.C.withPtr
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
        GioFileEnumeratorClass.C.withPtr
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
    fun getContainer self = (GioFileEnumeratorClass.C.withPtr ---> GioFileClass.C.fromPtr false) getContainer_ self
    fun hasPending self = (GioFileEnumeratorClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GioFileEnumeratorClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun nextFile self cancellable =
      (
        GioFileEnumeratorClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.C.fromPtr true
      )
        nextFile_
        (
          self
           & cancellable
           & []
        )
    fun setPending self pending = (GioFileEnumeratorClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPending_ (self & pending)
    local
      open Property
    in
      val containerProp = {set = fn x => set "container" GioFileClass.tOpt x}
    end
  end
