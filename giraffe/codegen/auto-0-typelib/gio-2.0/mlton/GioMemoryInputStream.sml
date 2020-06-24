structure GioMemoryInputStream :>
  GIO_MEMORY_INPUT_STREAM
    where type 'a class = 'a GioMemoryInputStreamClass.class
    where type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    val getType_ = _import "g_memory_input_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_memory_input_stream_new" : unit -> GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p;
    val newFromBytes_ = _import "g_memory_input_stream_new_from_bytes" : GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p -> GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p;
    val addBytes_ = fn x1 & x2 => (_import "g_memory_input_stream_add_bytes" : GioMemoryInputStreamClass.FFI.non_opt GioMemoryInputStreamClass.FFI.p * GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GioMemoryInputStreamClass.class
    type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asPollableInputStream self = (GObjectObjectClass.FFI.withPtr ---> GioPollableInputStreamClass.FFI.fromPtr false) I self
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioMemoryInputStreamClass.FFI.fromPtr true) new_ ()
    fun newFromBytes bytes = (GLibBytesRecord.FFI.withPtr ---> GioMemoryInputStreamClass.FFI.fromPtr true) newFromBytes_ bytes
    fun addBytes self bytes = (GioMemoryInputStreamClass.FFI.withPtr &&&> GLibBytesRecord.FFI.withPtr ---> I) addBytes_ (self & bytes)
  end
