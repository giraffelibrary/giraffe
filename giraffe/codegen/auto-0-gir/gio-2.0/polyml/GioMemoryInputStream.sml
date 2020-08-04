structure GioMemoryInputStream :>
  GIO_MEMORY_INPUT_STREAM
    where type 'a class = 'a GioMemoryInputStreamClass.class
    where type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_memory_input_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_memory_input_stream_new") (cVoid --> GioInputStreamClass.PolyML.cPtr)
      val newFromBytes_ = call (getSymbol "g_memory_input_stream_new_from_bytes") (GLibBytesRecord.PolyML.cPtr --> GioInputStreamClass.PolyML.cPtr)
      val addBytes_ = call (getSymbol "g_memory_input_stream_add_bytes") (GioMemoryInputStreamClass.PolyML.cPtr &&> GLibBytesRecord.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GioMemoryInputStreamClass.class
    type 'a pollable_input_stream_class = 'a GioPollableInputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type t = base class
    fun asPollableInputStream self = (GObjectObjectClass.FFI.withPtr false ---> GioPollableInputStreamClass.FFI.fromPtr false) I self
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr false ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioMemoryInputStreamClass.FFI.fromPtr true) new_ ()
    fun newFromBytes bytes = (GLibBytesRecord.FFI.withPtr false ---> GioMemoryInputStreamClass.FFI.fromPtr true) newFromBytes_ bytes
    fun addBytes self bytes = (GioMemoryInputStreamClass.FFI.withPtr false &&&> GLibBytesRecord.FFI.withPtr false ---> I) addBytes_ (self & bytes)
  end
