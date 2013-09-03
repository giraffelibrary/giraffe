structure GioPollableInputStream :>
  GIO_POLLABLE_INPUT_STREAM
    where type 'a class_t = 'a GioPollableInputStreamClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_pollable_input_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val canPoll_ = call (load_sym libgio "g_pollable_input_stream_can_poll") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val isReadable_ = call (load_sym libgio "g_pollable_input_stream_is_readable") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val readNonblocking_ =
        call (load_sym libgio "g_pollable_input_stream_read_nonblocking")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt64.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Int64.VAL
          )
    end
    type 'a class_t = 'a GioPollableInputStreamClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canPoll self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canPoll_ self
    fun isReadable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isReadable_ self
    fun readNonblocking self size cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt64.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Int64.fromVal
      )
        readNonblocking_
        (
          self
           & size
           & cancellable
           & []
        )
  end
