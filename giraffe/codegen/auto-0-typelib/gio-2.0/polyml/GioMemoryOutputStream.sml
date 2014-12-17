structure GioMemoryOutputStream :>
  GIO_MEMORY_OUTPUT_STREAM
    where type 'a class_t = 'a GioMemoryOutputStreamClass.t
    where type 'a seekableclass_t = 'a GioSeekableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_memory_output_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getDataSize_ = call (load_sym libgio "g_memory_output_stream_get_data_size") (GObjectObjectClass.PolyML.PTR --> FFI.UInt64.PolyML.VAL)
      val getSize_ = call (load_sym libgio "g_memory_output_stream_get_size") (GObjectObjectClass.PolyML.PTR --> FFI.UInt64.PolyML.VAL)
    end
    type 'a class_t = 'a GioMemoryOutputStreamClass.t
    type 'a seekableclass_t = 'a GioSeekableClass.t
    type t = base class_t
    fun asSeekable self = (GObjectObjectClass.C.withPtr ---> GioSeekableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDataSize self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.C.fromVal) getDataSize_ self
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.C.fromVal) getSize_ self
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
