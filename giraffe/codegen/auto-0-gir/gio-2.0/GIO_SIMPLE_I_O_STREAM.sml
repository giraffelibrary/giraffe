signature GIO_SIMPLE_I_O_STREAM =
  sig
    type 'a class
    type 'a input_stream_class
    type 'a output_stream_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a input_stream_class * 'b output_stream_class -> base class
    val inputStreamProp : ('a class, base input_stream_class option, 'b input_stream_class option) Property.readwrite
    val outputStreamProp : ('a class, base output_stream_class option, 'b output_stream_class option) Property.readwrite
  end
