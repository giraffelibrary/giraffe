signature GIO_POLLABLE_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a cancellable_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val canPoll : 'a class -> bool
    val createSource :
      'a class
       -> 'b cancellable_class option
       -> GLib.SourceRecord.t
    val isWritable : 'a class -> bool
    val writeNonblocking :
      'a class
       -> GUInt8CArrayN.t * 'b cancellable_class option
       -> LargeInt.int
  end
