structure GioPollableOutputStream :>
  GIO_POLLABLE_OUTPUT_STREAM
    where type 'a class_t = 'a GioPollableOutputStreamClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_pollable_output_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val canPoll_ = call (load_sym libgio "g_pollable_output_stream_can_poll") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isWritable_ = call (load_sym libgio "g_pollable_output_stream_is_writable") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a GioPollableOutputStreamClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canPoll self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canPoll_ self
    fun isWritable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isWritable_ self
  end
