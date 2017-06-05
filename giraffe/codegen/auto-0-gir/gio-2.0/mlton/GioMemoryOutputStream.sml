structure GioMemoryOutputStream :>
  GIO_MEMORY_OUTPUT_STREAM
    where type 'a class = 'a GioMemoryOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    val getType_ = _import "g_memory_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val getDataSize_ = _import "g_memory_output_stream_get_data_size" : GioMemoryOutputStreamClass.FFI.notnull GioMemoryOutputStreamClass.FFI.p -> GSize.FFI.val_;
    val getSize_ = _import "g_memory_output_stream_get_size" : GioMemoryOutputStreamClass.FFI.notnull GioMemoryOutputStreamClass.FFI.p -> GSize.FFI.val_;
    type 'a class = 'a GioMemoryOutputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDataSize self = (GioMemoryOutputStreamClass.FFI.withPtr ---> GSize.FFI.fromVal) getDataSize_ self
    fun getSize self = (GioMemoryOutputStreamClass.FFI.withPtr ---> GSize.FFI.fromVal) getSize_ self
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
