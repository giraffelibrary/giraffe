structure GioOutputStream :>
  GIO_OUTPUT_STREAM
    where type 'a class_t = 'a GioOutputStreamClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type outputstreamspliceflags_t = GioOutputStreamSpliceFlags.t
    where type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_output_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val clearPending_ = call (load_sym libgio "g_output_stream_clear_pending") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val close_ =
        call (load_sym libgio "g_output_stream_close")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val closeFinish_ =
        call (load_sym libgio "g_output_stream_close_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val flush_ =
        call (load_sym libgio "g_output_stream_flush")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val flushFinish_ =
        call (load_sym libgio "g_output_stream_flush_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val hasPending_ = call (load_sym libgio "g_output_stream_has_pending") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isClosed_ = call (load_sym libgio "g_output_stream_is_closed") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isClosing_ = call (load_sym libgio "g_output_stream_is_closing") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setPending_ = call (load_sym libgio "g_output_stream_set_pending") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.Bool.PolyML.VAL)
      val splice_ =
        call (load_sym libgio "g_output_stream_splice")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GioOutputStreamSpliceFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.SSize.PolyML.VAL
          )
      val spliceFinish_ =
        call (load_sym libgio "g_output_stream_splice_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.SSize.PolyML.VAL
          )
      val writeFinish_ =
        call (load_sym libgio "g_output_stream_write_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.SSize.PolyML.VAL
          )
    end
    type 'a class_t = 'a GioOutputStreamClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type outputstreamspliceflags_t = GioOutputStreamSpliceFlags.t
    type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun clearPending self = (GObjectObjectClass.C.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun flush self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        flush_
        (
          self
           & cancellable
           & []
        )
    fun flushFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        flushFinish_
        (
          self
           & result
           & []
        )
    fun hasPending self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun isClosing self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosing_ self
    fun setPending self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) setPending_ (self & [])
    fun splice self source flags cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GioOutputStreamSpliceFlags.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.SSize.C.fromVal
      )
        splice_
        (
          self
           & source
           & flags
           & cancellable
           & []
        )
    fun spliceFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.SSize.C.fromVal
      )
        spliceFinish_
        (
          self
           & result
           & []
        )
    fun writeFinish self result =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.SSize.C.fromVal
      )
        writeFinish_
        (
          self
           & result
           & []
        )
  end
