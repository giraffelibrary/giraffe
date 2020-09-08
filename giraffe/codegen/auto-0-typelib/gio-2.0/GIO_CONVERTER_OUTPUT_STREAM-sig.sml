signature GIO_CONVERTER_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a pollable_output_stream_class
    type 'a output_stream_class
    type 'a converter_class
    type t = base class
    val asPollableOutputStream : 'a class -> base pollable_output_stream_class
    val getType : unit -> GObject.Type.t
    val new : 'a output_stream_class * 'b converter_class -> base class
    val getConverter : 'a class -> base converter_class
    val converterProp : ('a class, unit -> base converter_class option, unit, 'b converter_class option -> unit) Property.t
  end
