structure GioMemoryOutputStream :>
  GIO_MEMORY_OUTPUT_STREAM
    where type 'a class = 'a GioMemoryOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    val getType_ = _import "g_memory_output_stream_get_type" : unit -> GObjectType.C.val_;
    val getDataSize_ = _import "g_memory_output_stream_get_data_size" : GioMemoryOutputStreamClass.C.notnull GioMemoryOutputStreamClass.C.p -> FFI.UInt64.C.val_;
    val getSize_ = _import "g_memory_output_stream_get_size" : GioMemoryOutputStreamClass.C.notnull GioMemoryOutputStreamClass.C.p -> FFI.UInt64.C.val_;
    type 'a class = 'a GioMemoryOutputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.C.withPtr ---> GioSeekableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDataSize self = (GioMemoryOutputStreamClass.C.withPtr ---> FFI.UInt64.C.fromVal) getDataSize_ self
    fun getSize self = (GioMemoryOutputStreamClass.C.withPtr ---> FFI.UInt64.C.fromVal) getSize_ self
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
