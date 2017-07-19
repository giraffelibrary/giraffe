signature GIO_CONVERTER_OUTPUT_STREAM =
  sig
    type 'a class
    type 'a output_stream_class
    type 'a converter_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a output_stream_class * 'b converter_class -> base class
    val getConverter : 'a class -> base converter_class
    val converterProp : ('a class, base converter_class option, 'b converter_class option) Property.readwrite
  end
