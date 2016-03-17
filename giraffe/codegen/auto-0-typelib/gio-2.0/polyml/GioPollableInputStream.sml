structure GioPollableInputStream :>
  GIO_POLLABLE_INPUT_STREAM
    where type 'a class = 'a GioPollableInputStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_pollable_input_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val canPoll_ = call (load_sym libgio "g_pollable_input_stream_can_poll") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isReadable_ = call (load_sym libgio "g_pollable_input_stream_is_readable") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a GioPollableInputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canPoll self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canPoll_ self
    fun isReadable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isReadable_ self
  end
