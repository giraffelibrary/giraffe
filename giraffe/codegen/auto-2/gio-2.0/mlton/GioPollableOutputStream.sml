structure GioPollableOutputStream :>
  GIO_POLLABLE_OUTPUT_STREAM
    where type 'a class_t = 'a GioPollableOutputStreamClass.t =
  struct
    val getType_ = _import "g_pollable_output_stream_get_type" : unit -> GObjectType.C.val_;
    val canPoll_ = _import "g_pollable_output_stream_can_poll" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val isWritable_ = _import "g_pollable_output_stream_is_writable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    type 'a class_t = 'a GioPollableOutputStreamClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun canPoll self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canPoll_ self
    fun isWritable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isWritable_ self
  end
