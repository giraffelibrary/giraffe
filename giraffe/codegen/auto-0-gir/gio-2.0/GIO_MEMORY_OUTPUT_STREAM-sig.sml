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
    val getDataSize : 'a class -> int
    val getSize : 'a class -> int
    val stealAsBytes : 'a class -> GLib.BytesRecord.t
    val dataSizeProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val sizeProp : ('a class, unit -> LargeInt.int, unit, LargeInt.int -> unit) Property.t
  end
