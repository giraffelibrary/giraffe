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
      val getChild_ = call (getSymbol "g_file_enumerator_get_child") (GioFileEnumeratorClass.PolyML.cPtr &&> GioFileInfoClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getContainer_ = call (getSymbol "g_file_enumerator_get_container") (GioFileEnumeratorClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val hasPending_ = call (getSymbol "g_file_enumerator_has_pending") (GioFileEnumeratorClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isClosed_ = call (getSymbol "g_file_enumerator_is_closed") (GioFileEnumeratorClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val iterate_ =
        call (getSymbol "g_file_enumerator_iterate")
          (
            GioFileEnumeratorClass.PolyML.cPtr
             &&> GioFileInfoClass.PolyML.cOutRef
             &&> GioFileClass.PolyML.cOutRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val nextFile_ =
        call (getSymbol "g_file_enumerator_next_file")
          (
            GioFileEnumeratorClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioFileInfoClass.PolyML.cOptPtr
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
        GioFileEnumeratorClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        close_
        (
          self
           & cancellable
           & []
        )
    fun closeFinish self result =
      (
        GioFileEnumeratorClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun getChild self info = (GioFileEnumeratorClass.FFI.withPtr false &&&> GioFileInfoClass.FFI.withPtr false ---> GioFileClass.FFI.fromPtr true) getChild_ (self & info)
    fun getContainer self = (GioFileEnumeratorClass.FFI.withPtr false ---> GioFileClass.FFI.fromPtr false) getContainer_ self
    fun hasPending self = (GioFileEnumeratorClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GioFileEnumeratorClass.FFI.withPtr false ---> GBool.FFI.fromVal) isClosed_ self
    fun iterate self cancellable =
      let
        val outInfo
         & outChild
         & () =
          (
            GioFileEnumeratorClass.FFI.withPtr false
             &&&> GioFileInfoClass.FFI.withRefOptPtr false
             &&&> GioFileClass.FFI.withRefOptPtr false
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GioFileInfoClass.FFI.fromPtr false
                   && GioFileClass.FFI.fromPtr false
                   && ignore
          )
            iterate_
            (
              self
               & NONE
               & NONE
               & cancellable
               & []
            )
      in
        (outInfo, outChild)
      end
    fun nextFile self cancellable =
      (
        GioFileEnumeratorClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GioFileInfoClass.FFI.fromOptPtr true
      )
        nextFile_
        (
          self
           & cancellable
           & []
        )
    fun setPending self pending = (GioFileEnumeratorClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setPending_ (self & pending)
    local
      open ValueAccessor
    in
      val containerProp =
        {
          name = "container",
          gtype = fn () => C.gtype GioFileClass.tOpt (),
          get = ignore,
          set = ignore,
          init = fn x => C.set GioFileClass.tOpt x
        }
    end
  end
