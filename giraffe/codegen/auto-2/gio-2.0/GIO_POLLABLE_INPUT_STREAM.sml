signature GIO_POLLABLE_INPUT_STREAM =
  sig
    type 'a class_t
    type 'a cancellableclass_t
    val getType : unit -> GObject.Type.t
    val canPoll : 'a class_t -> bool
    val isReadable : 'a class_t -> bool
    val readNonblocking :
      'a class_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> LargeInt.int
  end
