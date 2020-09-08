signature GIO_CONVERTER_INPUT_STREAM =
  sig
    type 'a class
    type 'a pollable_input_stream_class
    type 'a input_stream_class
    type 'a converter_class
    type t = base class
    val asPollableInputStream : 'a class -> base pollable_input_stream_class
    val getType : unit -> GObject.Type.t
    val new : 'a input_stream_class * 'b converter_class -> base class
    val getConverter : 'a class -> base converter_class
    val converterProp : ('a class, unit -> base converter_class option, unit, 'b converter_class option -> unit) Property.t
  end
