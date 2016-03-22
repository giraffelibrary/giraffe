structure GioPollableInputStream :>
  GIO_POLLABLE_INPUT_STREAM
    where type 'a class = 'a GioPollableInputStreamClass.class =
  struct
    val getType_ = _import "g_pollable_input_stream_get_type" : unit -> GObjectType.C.val_;
    val canPoll_ = _import "g_pollable_input_stream_can_poll" : GioPollableInputStreamClass.C.notnull GioPollableInputStreamClass.C.p -> FFI.Bool.C.val_;
    val isReadable_ = _import "g_pollable_input_stream_is_readable" : GioPollableInputStreamClass.C.notnull GioPollableInputStreamClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a GioPollableInputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canPoll self = (GioPollableInputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) canPoll_ self
    fun isReadable self = (GioPollableInputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) isReadable_ self
  end
