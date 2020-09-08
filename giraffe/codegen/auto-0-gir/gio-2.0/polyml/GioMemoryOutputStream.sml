structure GioMemoryOutputStream :>
  GIO_MEMORY_OUTPUT_STREAM
    where type 'a class = 'a GioMemoryOutputStreamClass.class
    where type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_memory_output_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newResizable_ = call (getSymbol "g_memory_output_stream_new_resizable") (cVoid --> GioOutputStreamClass.PolyML.cPtr)
      val getDataSize_ = call (getSymbol "g_memory_output_stream_get_data_size") (GioMemoryOutputStreamClass.PolyML.cPtr --> GSize.PolyML.cVal)
      val getSize_ = call (getSymbol "g_memory_output_stream_get_size") (GioMemoryOutputStreamClass.PolyML.cPtr --> GSize.PolyML.cVal)
      val stealAsBytes_ = call (getSymbol "g_memory_output_stream_steal_as_bytes") (GioMemoryOutputStreamClass.PolyML.cPtr --> GLibBytesRecord.PolyML.cPtr)
    end
    type 'a class = 'a GioMemoryOutputStreamClass.class
    type 'a pollable_output_stream_class = 'a GioPollableOutputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asPollableOutputStream self = (GObjectObjectClass.FFI.withPtr false ---> GioPollableOutputStreamClass.FFI.fromPtr false) I self
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr false ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newResizable () = (I ---> GioMemoryOutputStreamClass.FFI.fromPtr true) newResizable_ ()
    fun getDataSize self = (GioMemoryOutputStreamClass.FFI.withPtr false ---> GSize.FFI.fromVal) getDataSize_ self
    fun getSize self = (GioMemoryOutputStreamClass.FFI.withPtr false ---> GSize.FFI.fromVal) getSize_ self
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
