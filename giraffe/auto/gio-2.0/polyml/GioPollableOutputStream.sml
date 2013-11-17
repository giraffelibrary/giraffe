structure GioPollableOutputStream :>
  GIO_POLLABLE_OUTPUT_STREAM
    where type 'a class_t = 'a GioPollableOutputStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_pollable_output_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val canPoll_ = call (load_sym libgio "g_pollable_output_stream_can_poll") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isWritable_ = call (load_sym libgio "g_pollable_output_stream_is_writable") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GioPollableOutputStreamClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canPoll self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canPoll_ self
    fun isWritable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isWritable_ self
  end
