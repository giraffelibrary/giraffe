signature GIO_POLLABLE_OUTPUT_STREAM =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val canPoll : 'a class -> bool
    val isWritable : 'a class -> bool
  end
