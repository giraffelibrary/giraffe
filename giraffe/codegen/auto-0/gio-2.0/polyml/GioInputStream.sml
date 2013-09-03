structure GioInputStream :>
  GIO_INPUT_STREAM
    where type 'a class_t = 'a GioInputStreamClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_input_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val clearPending_ = call (load_sym libgio "g_input_stream_clear_pending") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val close_ =
        call (load_sym libgio "g_input_stream_close")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val closeFinish_ =
        call (load_sym libgio "g_input_stream_close_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val hasPending_ = call (load_sym libgio "g_input_stream_has_pending") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val isClosed_ = call (load_sym libgio "g_input_stream_is_closed") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val read_ =
        call (load_sym libgio "g_input_stream_read")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt64.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Int64.VAL
          )
      val readAll_ =
        call (load_sym libgio "g_input_stream_read_all")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt64.VAL
             &&> FFI.PolyML.UInt64.REF
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val readFinish_ =
        call (load_sym libgio "g_input_stream_read_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Int64.VAL
          )
      val setPending_ = call (load_sym libgio "g_input_stream_set_pending") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.PolyML.Bool.VAL)
      val skip_ =
        call (load_sym libgio "g_input_stream_skip")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt64.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Int64.VAL
          )
      val skipFinish_ =
        call (load_sym libgio "g_input_stream_skip_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Int64.VAL
          )
    end
    type 'a class_t = 'a GioInputStreamClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun clearPending self = (GObjectObjectClass.C.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        close_
        (
          self
           & cancellable
           & []
        )
    fun closeFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun hasPending self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) hasPending_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isClosed_ self
    fun read self count cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt64.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Int64.fromVal
      )
        read_
        (
          self
           & count
           & cancellable
           & []
        )
    fun readAll self count cancellable =
      let
        val bytesRead & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt64.withVal
             &&&> FFI.UInt64.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.UInt64.fromVal && FFI.Bool.fromVal
          )
            readAll_
            (
              self
               & count
               & 0
               & cancellable
               & []
            )
      in
        if retVal then SOME bytesRead else NONE
      end
    fun readFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Int64.fromVal
      )
        readFinish_
        (
          self
           & result
           & []
        )
    fun setPending self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.fromVal) setPending_ (self & [])
    fun skip self count cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt64.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Int64.fromVal
      )
        skip_
        (
          self
           & count
           & cancellable
           & []
        )
    fun skipFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Int64.fromVal
      )
        skipFinish_
        (
          self
           & result
           & []
        )
  end
