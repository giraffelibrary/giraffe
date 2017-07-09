structure GioMemoryOutputStream :>
  GIO_MEMORY_OUTPUT_STREAM
    where type 'a class = 'a GioMemoryOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_memory_output_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDataSize_ = call (getSymbol "g_memory_output_stream_get_data_size") (GioMemoryOutputStreamClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val getSize_ = call (getSymbol "g_memory_output_stream_get_size") (GioMemoryOutputStreamClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
    end
    type 'a class = 'a GioMemoryOutputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDataSize self = (GioMemoryOutputStreamClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getDataSize_ self
    fun getSize self = (GioMemoryOutputStreamClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getSize_ self
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
