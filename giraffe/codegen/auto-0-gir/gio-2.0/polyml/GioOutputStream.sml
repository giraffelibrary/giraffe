structure GioOutputStream :>
  GIO_OUTPUT_STREAM
    where type 'a class = 'a GioOutputStreamClass.class
    where type output_stream_splice_flags_t = GioOutputStreamSpliceFlags.t
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_output_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val clearPending_ = call (getSymbol "g_output_stream_clear_pending") (GioOutputStreamClass.PolyML.cPtr --> cVoid)
      val close_ =
        call (getSymbol "g_output_stream_close")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val closeFinish_ =
        call (getSymbol "g_output_stream_close_finish")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val flush_ =
        call (getSymbol "g_output_stream_flush")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val flushFinish_ =
        call (getSymbol "g_output_stream_flush_finish")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val hasPending_ = call (getSymbol "g_output_stream_has_pending") (GioOutputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isClosed_ = call (getSymbol "g_output_stream_is_closed") (GioOutputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isClosing_ = call (getSymbol "g_output_stream_is_closing") (GioOutputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setPending_ = call (getSymbol "g_output_stream_set_pending") (GioOutputStreamClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val splice_ =
        call (getSymbol "g_output_stream_splice")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GioInputStreamClass.PolyML.cPtr
             &&> GioOutputStreamSpliceFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GSSize.PolyML.cVal
          )
      val spliceFinish_ =
        call (getSymbol "g_output_stream_splice_finish")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GSSize.PolyML.cVal
          )
      val write_ =
        call (getSymbol "g_output_stream_write")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GSSize.PolyML.cVal
          )
      val writeAll_ =
        call (getSymbol "g_output_stream_write_all")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> GSize.PolyML.cRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val writeFinish_ =
        call (getSymbol "g_output_stream_write_finish")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GSSize.PolyML.cVal
          )
    end
    type 'a class = 'a GioOutputStreamClass.class
    type output_stream_splice_flags_t = GioOutputStreamSpliceFlags.t
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun clearPending self = (GioOutputStreamClass.FFI.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioOutputStreamClass.FFI.withPtr
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
        GioOutputStreamClass.FFI.withPtr
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
    fun flush self cancellable =
      (
        GioOutputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        flush_
        (
          self
           & cancellable
           & []
        )
    fun flushFinish self result =
      (
        GioOutputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        flushFinish_
        (
          self
           & result
           & []
        )
    fun hasPending self = (GioOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GioOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) isClosed_ self
    fun isClosing self = (GioOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) isClosing_ self
    fun setPending self = (GioOutputStreamClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) setPending_ (self & [])
    fun splice
      self
      (
        source,
        flags,
        cancellable
      ) =
      (
        GioOutputStreamClass.FFI.withPtr
         &&&> GioInputStreamClass.FFI.withPtr
         &&&> GioOutputStreamSpliceFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GSSize.FFI.fromVal
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
        GioOutputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GSSize.FFI.fromVal
      )
        spliceFinish_
        (
          self
           & result
           & []
        )
    fun write self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CVectorN.length buffer)
        val retVal =
          (
            GioOutputStreamClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSSize.FFI.fromVal
          )
            write_
            (
              self
               & buffer
               & count
               & cancellable
               & []
            )
      in
        retVal
      end
    fun writeAll self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CVectorN.length buffer)
        val bytesWritten & retVal =
          (
            GioOutputStreamClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && GBool.FFI.fromVal
          )
            writeAll_
            (
              self
               & buffer
               & count
               & GSize.null
               & cancellable
               & []
            )
      in
        if retVal then SOME bytesWritten else NONE
      end
    fun writeFinish self result =
      (
        GioOutputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GSSize.FFI.fromVal
      )
        writeFinish_
        (
          self
           & result
           & []
        )
  end
