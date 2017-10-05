signature GIO_I_O_STREAM =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a async_result_class
    type 'a input_stream_class
    type 'a output_stream_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val spliceFinish : 'a async_result_class -> unit
    val clearPending : 'a class -> unit
    val close :
      'a class
       -> 'b cancellable_class option
       -> unit
    val closeFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val getInputStream : 'a class -> base input_stream_class
    val getOutputStream : 'a class -> base output_stream_class
    val hasPending : 'a class -> bool
    val isClosed : 'a class -> bool
    val setPending : 'a class -> unit
    val closedProp : ('a class, bool, bool) Property.readwrite
    val inputStreamProp : ('a class, base input_stream_class option) Property.readonly
    val outputStreamProp : ('a class, base output_stream_class option) Property.readonly
  end
