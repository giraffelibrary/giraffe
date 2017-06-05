structure GioMemoryInputStream :>
  GIO_MEMORY_INPUT_STREAM
    where type 'a class = 'a GioMemoryInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    val getType_ = _import "g_memory_input_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_memory_input_stream_new" : unit -> GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p;
    type 'a class = 'a GioMemoryInputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioMemoryInputStreamClass.FFI.fromPtr true) new_ ()
  end
