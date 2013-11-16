structure GioIOStream :>
  GIO_I_O_STREAM
    where type 'a class_t = 'a GioIOStreamClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    where type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    where type 'a outputstreamclass_t = 'a GioOutputStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_io_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val spliceFinish_ = call (load_sym libgio "g_io_stream_splice_finish") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.Bool.PolyML.VAL)
      val clearPending_ = call (load_sym libgio "g_io_stream_clear_pending") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val close_ =
        call (load_sym libgio "g_io_stream_close")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val closeFinish_ =
        call (load_sym libgio "g_io_stream_close_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val getInputStream_ = call (load_sym libgio "g_io_stream_get_input_stream") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getOutputStream_ = call (load_sym libgio "g_io_stream_get_output_stream") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val hasPending_ = call (load_sym libgio "g_io_stream_has_pending") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isClosed_ = call (load_sym libgio "g_io_stream_is_closed") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setPending_ = call (load_sym libgio "g_io_stream_set_pending") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GioIOStreamClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    type 'a outputstreamclass_t = 'a GioOutputStreamClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun spliceFinish result = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) spliceFinish_ (result & [])
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
    fun getInputStream self = (GObjectObjectClass.C.withPtr ---> GioInputStreamClass.C.fromPtr false) getInputStream_ self
    fun getOutputStream self = (GObjectObjectClass.C.withPtr ---> GioOutputStreamClass.C.fromPtr false) getOutputStream_ self
    fun hasPending self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun setPending self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) setPending_ (self & [])
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
