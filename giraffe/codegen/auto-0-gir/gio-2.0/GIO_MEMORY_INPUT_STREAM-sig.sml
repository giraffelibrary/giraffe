signature GIO_MEMORY_INPUT_STREAM =
  sig
    type 'a class
    type 'a pollable_input_stream_class
    type 'a seekable_class
    type t = base class
    val asPollableInputStream : 'a class -> base pollable_input_stream_class
    val asSeekable : 'a class -> base seekable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromBytes : GLib.BytesRecord.t -> base class
    val addBytes :
      'a class
       -> GLib.BytesRecord.t
       -> unit
  end
