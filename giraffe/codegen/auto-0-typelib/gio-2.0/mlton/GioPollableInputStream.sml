structure GioPollableInputStream :>
  GIO_POLLABLE_INPUT_STREAM
    where type 'a class = 'a GioPollableInputStreamClass.class =
  struct
    val getType_ = _import "g_pollable_input_stream_get_type" : unit -> GObjectType.FFI.val_;
    val canPoll_ = _import "g_pollable_input_stream_can_poll" : GioPollableInputStreamClass.FFI.notnull GioPollableInputStreamClass.FFI.p -> GBool.FFI.val_;
    val isReadable_ = _import "g_pollable_input_stream_is_readable" : GioPollableInputStreamClass.FFI.notnull GioPollableInputStreamClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GioPollableInputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canPoll self = (GioPollableInputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) canPoll_ self
    fun isReadable self = (GioPollableInputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) isReadable_ self
  end
