structure GioPollableInputStream :>
  GIO_POLLABLE_INPUT_STREAM
    where type 'a class_t = 'a GioPollableInputStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_pollable_input_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val canPoll_ = call (load_sym libgio "g_pollable_input_stream_can_poll") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isReadable_ = call (load_sym libgio "g_pollable_input_stream_is_readable") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GioPollableInputStreamClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canPoll self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canPoll_ self
    fun isReadable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isReadable_ self
  end
