structure GioMemoryInputStream :>
  GIO_MEMORY_INPUT_STREAM
    where type 'a class_t = 'a GioMemoryInputStreamClass.t
    where type 'a seekableclass_t = 'a GioSeekableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_memory_input_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_memory_input_stream_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GioMemoryInputStreamClass.t
    type 'a seekableclass_t = 'a GioSeekableClass.t
    fun asSeekable self = (GObjectObjectClass.C.withPtr ---> GioSeekableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioMemoryInputStreamClass.C.fromPtr true) new_ ()
  end
