structure GioMemoryInputStream :>
  GIO_MEMORY_INPUT_STREAM
    where type 'a class = 'a GioMemoryInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    val getType_ = _import "g_memory_input_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_memory_input_stream_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class = 'a GioMemoryInputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.C.withPtr ---> GioSeekableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioMemoryInputStreamClass.C.fromPtr true) new_ ()
  end
