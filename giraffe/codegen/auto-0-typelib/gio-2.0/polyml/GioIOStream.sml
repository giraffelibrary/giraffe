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
      val getType_ = call (load_sym libgio "g_io_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val spliceFinish_ = call (load_sym libgio "g_io_stream_splice_finish") (GioAsyncResultClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val clearPending_ = call (load_sym libgio "g_io_stream_clear_pending") (GioIOStreamClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val close_ =
        call (load_sym libgio "g_io_stream_close")
          (
            GioIOStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val closeFinish_ =
        call (load_sym libgio "g_io_stream_close_finish")
          (
            GioIOStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val getInputStream_ = call (load_sym libgio "g_io_stream_get_input_stream") (GioIOStreamClass.PolyML.cPtr --> GioInputStreamClass.PolyML.cPtr)
      val getOutputStream_ = call (load_sym libgio "g_io_stream_get_output_stream") (GioIOStreamClass.PolyML.cPtr --> GioOutputStreamClass.PolyML.cPtr)
      val hasPending_ = call (load_sym libgio "g_io_stream_has_pending") (GioIOStreamClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isClosed_ = call (load_sym libgio "g_io_stream_is_closed") (GioIOStreamClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setPending_ = call (load_sym libgio "g_io_stream_set_pending") (GioIOStreamClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a GioIOStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun spliceFinish result = (GioAsyncResultClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) spliceFinish_ (result & [])
    fun clearPending self = (GioIOStreamClass.C.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioIOStreamClass.C.withPtr
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
        GioIOStreamClass.C.withPtr
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
    fun getInputStream self = (GioIOStreamClass.C.withPtr ---> GioInputStreamClass.C.fromPtr false) getInputStream_ self
    fun getOutputStream self = (GioIOStreamClass.C.withPtr ---> GioOutputStreamClass.C.fromPtr false) getOutputStream_ self
    fun hasPending self = (GioIOStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GioIOStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun setPending self = (GioIOStreamClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) setPending_ (self & [])
    local
      open Property
    in
      val closedProp =
        {
          get = fn x => get "closed" boolean x,
          set = fn x => set "closed" boolean x
        }
      val inputStreamProp = {get = fn x => get "input-stream" GioInputStreamClass.tOpt x}
      val outputStreamProp = {get = fn x => get "output-stream" GioOutputStreamClass.tOpt x}
    end
  end
