signature GIO_OUTPUT_STREAM =
  sig
    type 'a class_t
    type 'a cancellable_class_t
    type output_stream_splice_flags_t
    type 'a input_stream_class_t
    type 'a async_result_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val clearPending : 'a class_t -> unit
    val close :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val closeFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val flush :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val flushFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val hasPending : 'a class_t -> bool
    val isClosed : 'a class_t -> bool
    val isClosing : 'a class_t -> bool
    val setPending : 'a class_t -> bool
    val splice :
      'a class_t
       -> 'b input_stream_class_t
       -> output_stream_splice_flags_t
       -> 'c cancellable_class_t option
       -> LargeInt.int
    val spliceFinish :
      'a class_t
       -> 'b async_result_class_t
       -> LargeInt.int
    val writeFinish :
      'a class_t
       -> 'b async_result_class_t
       -> LargeInt.int
  end
