structure GioMemoryOutputStream :>
  GIO_MEMORY_OUTPUT_STREAM
    where type 'a class = 'a GioMemoryOutputStreamClass.class
    where type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    val getType_ = _import "g_memory_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val newResizable_ = _import "g_memory_output_stream_new_resizable" : unit -> GioOutputStreamClass.FFI.notnull GioOutputStreamClass.FFI.p;
    val getDataSize_ = _import "g_memory_output_stream_get_data_size" : GioMemoryOutputStreamClass.FFI.notnull GioMemoryOutputStreamClass.FFI.p -> GUInt64.FFI.val_;
    val getSize_ = _import "g_memory_output_stream_get_size" : GioMemoryOutputStreamClass.FFI.notnull GioMemoryOutputStreamClass.FFI.p -> GUInt64.FFI.val_;
    val stealAsBytes_ = _import "g_memory_output_stream_steal_as_bytes" : GioMemoryOutputStreamClass.FFI.notnull GioMemoryOutputStreamClass.FFI.p -> GLibBytesRecord.FFI.notnull GLibBytesRecord.FFI.p;
    type 'a class = 'a GioMemoryOutputStreamClass.class
    type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asPollableOutputStream self = (GObjectObjectClass.FFI.withPtr ---> GioPollableOutputStreamClass.FFI.fromPtr false) I self
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newResizable () = (I ---> GioMemoryOutputStreamClass.FFI.fromPtr true) newResizable_ ()
    fun getDataSize self = (GioMemoryOutputStreamClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getDataSize_ self
    fun getSize self = (GioMemoryOutputStreamClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getSize_ self
    fun stealAsBytes self = (GioMemoryOutputStreamClass.FFI.withPtr ---> GLibBytesRecord.FFI.fromPtr true) stealAsBytes_ self
    local
      open Property
    in
      val dataSizeProp = {get = fn x => get "data-size" ulong x}
      val sizeProp =
        {
          get = fn x => get "size" ulong x,
          new = fn x => new "size" ulong x
        }
    end
  end
