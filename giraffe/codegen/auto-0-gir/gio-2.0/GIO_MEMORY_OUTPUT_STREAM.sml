signature GIO_MEMORY_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a pollable_output_stream_class
    type 'a seekable_class
    type t = base class
    val asPollableOutputStream : 'a class -> base pollable_output_stream_class
    val asSeekable : 'a class -> base seekable_class
    val getType : unit -> GObject.Type.t
    val newResizable : unit -> base class
    val getDataSize : 'a class -> LargeInt.int
    val getSize : 'a class -> LargeInt.int
    val stealAsBytes : 'a class -> GLib.BytesRecord.t
    val dataSizeProp : ('a class, LargeInt.int) Property.readonly
    val sizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
