structure GioPollableOutputStream :>
  GIO_POLLABLE_OUTPUT_STREAM
    where type 'a class = 'a GioPollableOutputStreamClass.class =
  struct
    val getType_ = _import "g_pollable_output_stream_get_type" : unit -> GObjectType.C.val_;
    val canPoll_ = _import "g_pollable_output_stream_can_poll" : GioPollableOutputStreamClass.C.notnull GioPollableOutputStreamClass.C.p -> FFI.Bool.C.val_;
    val isWritable_ = _import "g_pollable_output_stream_is_writable" : GioPollableOutputStreamClass.C.notnull GioPollableOutputStreamClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a GioPollableOutputStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canPoll self = (GioPollableOutputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) canPoll_ self
    fun isWritable self = (GioPollableOutputStreamClass.C.withPtr ---> FFI.Bool.C.fromVal) isWritable_ self
  end
