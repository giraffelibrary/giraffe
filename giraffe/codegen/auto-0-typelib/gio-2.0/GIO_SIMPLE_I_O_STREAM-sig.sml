signature GIO_SIMPLE_I_O_STREAM =
  sig
    type 'a class
    type 'a input_stream_class
    type 'a output_stream_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a input_stream_class * 'b output_stream_class -> base class
    val inputStreamProp : ('a class, unit -> base input_stream_class option, unit, 'b input_stream_class option -> unit) Property.t
    val outputStreamProp : ('a class, unit -> base output_stream_class option, unit, 'b output_stream_class option -> unit) Property.t
  end
