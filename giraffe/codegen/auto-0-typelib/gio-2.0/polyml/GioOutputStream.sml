structure GioOutputStream :>
  GIO_OUTPUT_STREAM
    where type 'a class = 'a GioOutputStreamClass.class
    where type output_stream_splice_flags_t = GioOutputStreamSpliceFlags.t
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
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
             --> GInt64.PolyML.cVal
          )
      val spliceFinish_ =
        call (getSymbol "g_output_stream_splice_finish")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val write_ =
        call (getSymbol "g_output_stream_write")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val writeAll_ =
        call (getSymbol "g_output_stream_write_all")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GUInt64.PolyML.cRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val writeAllFinish_ =
        call (getSymbol "g_output_stream_write_all_finish")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val writeBytes_ =
        call (getSymbol "g_output_stream_write_bytes")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GLibBytesRecord.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val writeBytesFinish_ =
        call (getSymbol "g_output_stream_write_bytes_finish")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val writeFinish_ =
        call (getSymbol "g_output_stream_write_finish")
          (
            GioOutputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
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
        GioOutputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
         ---> ignore
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
         ---> ignore
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
    fun setPending self = (GioOutputStreamClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) setPending_ (self & [])
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
         ---> GInt64.FFI.fromVal
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
         ---> GInt64.FFI.fromVal
      )
        spliceFinish_
        (
          self
           & result
           & []
        )
    fun write self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val retVal =
          (
            GioOutputStreamClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GInt64.FFI.fromVal
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
        val count = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val bytesWritten & () =
          (
            GioOutputStreamClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && ignore
          )
            writeAll_
            (
              self
               & buffer
               & count
               & GUInt64.null
               & cancellable
               & []
            )
      in
        bytesWritten
      end
    fun writeAllFinish self result =
      let
        val bytesWritten & () =
          (
            GioOutputStreamClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && ignore
          )
            writeAllFinish_
            (
              self
               & result
               & GUInt64.null
               & []
            )
      in
        bytesWritten
      end
    fun writeBytes self (bytes, cancellable) =
      (
        GioOutputStreamClass.FFI.withPtr
         &&&> GLibBytesRecord.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        writeBytes_
        (
          self
           & bytes
           & cancellable
           & []
        )
    fun writeBytesFinish self result =
      (
        GioOutputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        writeBytesFinish_
        (
          self
           & result
           & []
        )
    fun writeFinish self result =
      (
        GioOutputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        writeFinish_
        (
          self
           & result
           & []
        )
  end
