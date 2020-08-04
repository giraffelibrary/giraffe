structure GioInputStream :>
  GIO_INPUT_STREAM
    where type 'a class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_input_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val clearPending_ = call (getSymbol "g_input_stream_clear_pending") (GioInputStreamClass.PolyML.cPtr --> cVoid)
      val close_ =
        call (getSymbol "g_input_stream_close")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val closeFinish_ =
        call (getSymbol "g_input_stream_close_finish")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val hasPending_ = call (getSymbol "g_input_stream_has_pending") (GioInputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isClosed_ = call (getSymbol "g_input_stream_is_closed") (GioInputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val read_ =
        call (getSymbol "g_input_stream_read")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val readAll_ =
        call (getSymbol "g_input_stream_read_all")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GUInt64.PolyML.cRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val readAllFinish_ =
        call (getSymbol "g_input_stream_read_all_finish")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val readBytes_ =
        call (getSymbol "g_input_stream_read_bytes")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibBytesRecord.PolyML.cPtr
          )
      val readBytesFinish_ =
        call (getSymbol "g_input_stream_read_bytes_finish")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibBytesRecord.PolyML.cPtr
          )
      val readFinish_ =
        call (getSymbol "g_input_stream_read_finish")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val setPending_ = call (getSymbol "g_input_stream_set_pending") (GioInputStreamClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val skip_ =
        call (getSymbol "g_input_stream_skip")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val skipFinish_ =
        call (getSymbol "g_input_stream_skip_finish")
          (
            GioInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
    end
    type 'a class = 'a GioInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun clearPending self = (GioInputStreamClass.FFI.withPtr false ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioInputStreamClass.FFI.withPtr false
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
        GioInputStreamClass.FFI.withPtr false
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
    fun hasPending self = (GioInputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GioInputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) isClosed_ self
    fun read self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val retVal =
          (
            GioInputStreamClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GInt64.FFI.fromVal
          )
            read_
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
    fun readAll self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val bytesRead & () =
          (
            GioInputStreamClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && ignore
          )
            readAll_
            (
              self
               & buffer
               & count
               & GUInt64.null
               & cancellable
               & []
            )
      in
        bytesRead
      end
    fun readAllFinish self result =
      let
        val bytesRead & () =
          (
            GioInputStreamClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && ignore
          )
            readAllFinish_
            (
              self
               & result
               & GUInt64.null
               & []
            )
      in
        bytesRead
      end
    fun readBytes self (count, cancellable) =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GUInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GLibBytesRecord.FFI.fromPtr true
      )
        readBytes_
        (
          self
           & count
           & cancellable
           & []
        )
    fun readBytesFinish self result =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GLibBytesRecord.FFI.fromPtr true
      )
        readBytesFinish_
        (
          self
           & result
           & []
        )
    fun readFinish self result =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        readFinish_
        (
          self
           & result
           & []
        )
    fun setPending self = (GioInputStreamClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) setPending_ (self & [])
    fun skip self (count, cancellable) =
      (
        GioInputStreamClass.FFI.withPtr false
         &&&> GUInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
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
        GioInputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        skipFinish_
        (
          self
           & result
           & []
        )
  end
