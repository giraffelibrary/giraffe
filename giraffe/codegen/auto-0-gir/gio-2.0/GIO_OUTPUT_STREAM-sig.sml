signature GIO_OUTPUT_STREAM =
  sig
    type 'a class
    type output_stream_splice_flags_t
    type 'a input_stream_class
    type 'a cancellable_class
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val clearPending : 'a class -> unit
    val close :
      'a class
       -> 'b cancellable_class option
       -> unit
    val closeFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val flush :
      'a class
       -> 'b cancellable_class option
       -> unit
    val flushFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val hasPending : 'a class -> bool
    val isClosed : 'a class -> bool
    val isClosing : 'a class -> bool
    val setPending : 'a class -> unit
    val splice :
      'a class
       -> 'b input_stream_class
           * output_stream_splice_flags_t
           * 'c cancellable_class option
       -> int
    val spliceFinish :
      'a class
       -> 'b async_result_class
       -> int
    val write :
      'a class
       -> GUInt8CArrayN.t * 'b cancellable_class option
       -> int
    val writeAll :
      'a class
       -> GUInt8CArrayN.t * 'b cancellable_class option
       -> int
    val writeAllFinish :
      'a class
       -> 'b async_result_class
       -> int
    val writeBytes :
      'a class
       -> GLib.BytesRecord.t * 'b cancellable_class option
       -> int
    val writeBytesFinish :
      'a class
       -> 'b async_result_class
       -> int
    val writeFinish :
      'a class
       -> 'b async_result_class
       -> int
  end
