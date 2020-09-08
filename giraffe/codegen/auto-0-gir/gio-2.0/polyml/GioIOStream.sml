structure GioIOStream :>
  GIO_I_O_STREAM
    where type 'a class = 'a GioIOStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_io_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val spliceFinish_ = call (getSymbol "g_io_stream_splice_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val clearPending_ = call (getSymbol "g_io_stream_clear_pending") (GioIOStreamClass.PolyML.cPtr --> cVoid)
      val close_ =
        call (getSymbol "g_io_stream_close")
          (
            GioIOStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val closeFinish_ =
        call (getSymbol "g_io_stream_close_finish")
          (
            GioIOStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getInputStream_ = call (getSymbol "g_io_stream_get_input_stream") (GioIOStreamClass.PolyML.cPtr --> GioInputStreamClass.PolyML.cPtr)
      val getOutputStream_ = call (getSymbol "g_io_stream_get_output_stream") (GioIOStreamClass.PolyML.cPtr --> GioOutputStreamClass.PolyML.cPtr)
      val hasPending_ = call (getSymbol "g_io_stream_has_pending") (GioIOStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isClosed_ = call (getSymbol "g_io_stream_is_closed") (GioIOStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setPending_ = call (getSymbol "g_io_stream_set_pending") (GioIOStreamClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioIOStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun spliceFinish result = (GioAsyncResultClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) spliceFinish_ (result & [])
    fun clearPending self = (GioIOStreamClass.FFI.withPtr false ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioIOStreamClass.FFI.withPtr false
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
        GioIOStreamClass.FFI.withPtr false
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
    fun getInputStream self = (GioIOStreamClass.FFI.withPtr false ---> GioInputStreamClass.FFI.fromPtr false) getInputStream_ self
    fun getOutputStream self = (GioIOStreamClass.FFI.withPtr false ---> GioOutputStreamClass.FFI.fromPtr false) getOutputStream_ self
    fun hasPending self = (GioIOStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GioIOStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) isClosed_ self
    fun setPending self = (GioIOStreamClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) setPending_ (self & [])
    local
      open ValueAccessor
    in
      val closedProp =
        {
          name = "closed",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val inputStreamProp =
        {
          name = "input-stream",
          gtype = fn () => C.gtype GioInputStreamClass.tOpt (),
          get = fn x => fn () => C.get GioInputStreamClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val outputStreamProp =
        {
          name = "output-stream",
          gtype = fn () => C.gtype GioOutputStreamClass.tOpt (),
          get = fn x => fn () => C.get GioOutputStreamClass.tOpt x,
          set = ignore,
          init = ignore
        }
    end
  end
