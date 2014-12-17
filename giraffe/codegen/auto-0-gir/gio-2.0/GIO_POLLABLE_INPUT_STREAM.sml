signature GIO_POLLABLE_INPUT_STREAM =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val canPoll : 'a class_t -> bool
    val isReadable : 'a class_t -> bool
  end
