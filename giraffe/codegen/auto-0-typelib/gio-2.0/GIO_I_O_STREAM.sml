signature GIO_I_O_STREAM =
  sig
    type 'a class_t
    type 'a cancellable_class_t
    type 'a async_result_class_t
    type 'a input_stream_class_t
    type 'a output_stream_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val spliceFinish : 'a async_result_class_t -> bool
    val clearPending : 'a class_t -> unit
    val close :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val closeFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val getInputStream : 'a class_t -> base input_stream_class_t
    val getOutputStream : 'a class_t -> base output_stream_class_t
    val hasPending : 'a class_t -> bool
    val isClosed : 'a class_t -> bool
    val setPending : 'a class_t -> bool
    val closedProp : ('a class_t, bool, bool) Property.readwrite
    val inputStreamProp : ('a class_t, base input_stream_class_t option) Property.readonly
    val outputStreamProp : ('a class_t, base output_stream_class_t option) Property.readonly
  end
