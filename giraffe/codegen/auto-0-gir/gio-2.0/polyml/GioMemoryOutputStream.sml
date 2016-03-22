structure GioMemoryOutputStream :>
  GIO_MEMORY_OUTPUT_STREAM
    where type 'a class = 'a GioMemoryOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_memory_output_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getDataSize_ = call (load_sym libgio "g_memory_output_stream_get_data_size") (GioMemoryOutputStreamClass.PolyML.cPtr --> FFI.Size.PolyML.cVal)
      val getSize_ = call (load_sym libgio "g_memory_output_stream_get_size") (GioMemoryOutputStreamClass.PolyML.cPtr --> FFI.Size.PolyML.cVal)
    end
    type 'a class = 'a GioMemoryOutputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.C.withPtr ---> GioSeekableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDataSize self = (GioMemoryOutputStreamClass.C.withPtr ---> FFI.Size.C.fromVal) getDataSize_ self
    fun getSize self = (GioMemoryOutputStreamClass.C.withPtr ---> FFI.Size.C.fromVal) getSize_ self
    local
      open Property
    in
      val dataSizeProp = {get = fn x => get "data-size" ulong x}
      val sizeProp =
        {
          get = fn x => get "size" ulong x,
          set = fn x => set "size" ulong x
        }
    end
  end
