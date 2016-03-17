signature GIO_POLLABLE_INPUT_STREAM =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val canPoll : 'a class -> bool
    val isReadable : 'a class -> bool
  end
