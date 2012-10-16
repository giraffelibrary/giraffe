structure GioMemoryOutputStream :>
  GIO_MEMORY_OUTPUT_STREAM
    where type 'a class_t = 'a GioMemoryOutputStreamClass.t
    where type 'a seekableclass_t = 'a GioSeekableClass.t =
  struct
    val getType_ = _import "g_memory_output_stream_get_type" : unit -> GObjectType.C.val_;
    val getData_ = _import "g_memory_output_stream_get_data" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getDataSize_ = _import "g_memory_output_stream_get_data_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Word64.val_;
    val getSize_ = _import "g_memory_output_stream_get_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Word64.val_;
    val stealData_ = _import "g_memory_output_stream_steal_data" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GioMemoryOutputStreamClass.t
    type 'a seekableclass_t = 'a GioSeekableClass.t
    fun asSeekable self = (GObjectObjectClass.C.withPtr ---> GioSeekableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getData self = (GObjectObjectClass.C.withPtr ---> I) getData_ self
    fun getDataSize self = (GObjectObjectClass.C.withPtr ---> FFI.Word64.fromVal) getDataSize_ self
    fun getSize self = (GObjectObjectClass.C.withPtr ---> FFI.Word64.fromVal) getSize_ self
    fun stealData self = (GObjectObjectClass.C.withPtr ---> I) stealData_ self
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
