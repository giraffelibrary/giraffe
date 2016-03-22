structure GioMemoryInputStream :>
  GIO_MEMORY_INPUT_STREAM
    where type 'a class = 'a GioMemoryInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_memory_input_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_memory_input_stream_new") (FFI.PolyML.cVoid --> GioInputStreamClass.PolyML.cPtr)
    end
    type 'a class = 'a GioMemoryInputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.C.withPtr ---> GioSeekableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioMemoryInputStreamClass.C.fromPtr true) new_ ()
  end
