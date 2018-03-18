signature GIO_SIMPLE_I_O_STREAM =
  sig
    type 'a class
    type 'a input_stream_class
    type 'a output_stream_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a input_stream_class * 'b output_stream_class -> base class
    val inputStreamProp :
      {
        get : 'a class -> base input_stream_class option,
        new : 'b input_stream_class option -> 'a class Property.t
      }
    val outputStreamProp :
      {
        get : 'a class -> base output_stream_class option,
        new : 'b output_stream_class option -> 'a class Property.t
      }
  end
