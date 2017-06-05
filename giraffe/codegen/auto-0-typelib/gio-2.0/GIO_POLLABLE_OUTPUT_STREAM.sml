signature GIO_POLLABLE_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a cancellable_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val canPoll : 'a class -> bool
    val isWritable : 'a class -> bool
    val writeNonblocking :
      'a class
       -> Word8Vector.vector
       -> 'b cancellable_class option
       -> LargeInt.int
  end
