structure GioPollableInputStream :>
  GIO_POLLABLE_INPUT_STREAM
    where type 'a class = 'a GioPollableInputStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_pollable_input_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val canPoll_ = call (getSymbol "g_pollable_input_stream_can_poll") (GioPollableInputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isReadable_ = call (getSymbol "g_pollable_input_stream_is_readable") (GioPollableInputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioPollableInputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canPoll self = (GioPollableInputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) canPoll_ self
    fun isReadable self = (GioPollableInputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) isReadable_ self
  end
