structure GioMemoryInputStream :>
  GIO_MEMORY_INPUT_STREAM
    where type 'a class_t = 'a GioMemoryInputStreamClass.t
    where type 'a seekable_class_t = 'a GioSeekableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_memory_input_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_memory_input_stream_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class_t = 'a GioMemoryInputStreamClass.t
    type 'a seekable_class_t = 'a GioSeekableClass.t
    type t = base class_t
    fun asSeekable self = (GObjectObjectClass.C.withPtr ---> GioSeekableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioMemoryInputStreamClass.C.fromPtr true) new_ ()
  end
