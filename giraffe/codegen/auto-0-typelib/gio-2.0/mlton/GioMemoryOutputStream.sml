structure GioMemoryOutputStream :>
  GIO_MEMORY_OUTPUT_STREAM
    where type 'a class = 'a GioMemoryOutputStreamClass.class
    where type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    val getType_ = _import "g_memory_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val newResizable_ = _import "g_memory_output_stream_new_resizable" : unit -> GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p;
    val getDataSize_ = _import "g_memory_output_stream_get_data_size" : GioMemoryOutputStreamClass.FFI.non_opt GioMemoryOutputStreamClass.FFI.p -> GUInt64.FFI.val_;
    val getSize_ = _import "g_memory_output_stream_get_size" : GioMemoryOutputStreamClass.FFI.non_opt GioMemoryOutputStreamClass.FFI.p -> GUInt64.FFI.val_;
    val stealAsBytes_ = _import "g_memory_output_stream_steal_as_bytes" : GioMemoryOutputStreamClass.FFI.non_opt GioMemoryOutputStreamClass.FFI.p -> GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p;
    type 'a class = 'a GioMemoryOutputStreamClass.class
    type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asPollableOutputStream self = (GObjectObjectClass.FFI.withPtr false ---> GioPollableOutputStreamClass.FFI.fromPtr false) I self
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr false ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newResizable () = (I ---> GioMemoryOutputStreamClass.FFI.fromPtr true) newResizable_ ()
    fun getDataSize self = (GioMemoryOutputStreamClass.FFI.withPtr false ---> GUInt64.FFI.fromVal) getDataSize_ self
    fun getSize self = (GioMemoryOutputStreamClass.FFI.withPtr false ---> GUInt64.FFI.fromVal) getSize_ self
    fun stealAsBytes self = (GioMemoryOutputStreamClass.FFI.withPtr false ---> GLibBytesRecord.FFI.fromPtr true) stealAsBytes_ self
    local
      open ValueAccessor
    in
      val dataSizeProp =
        {
          name = "data-size",
          gtype = fn () => C.gtype ulong (),
          get = fn x => fn () => C.get ulong x,
          set = ignore,
          init = ignore
        }
      val sizeProp =
        {
          name = "size",
          gtype = fn () => C.gtype ulong (),
          get = fn x => fn () => C.get ulong x,
          set = ignore,
          init = fn x => C.set ulong x
        }
    end
  end
