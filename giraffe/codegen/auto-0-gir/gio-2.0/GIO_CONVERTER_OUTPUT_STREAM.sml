signature GIO_CONVERTER_OUTPUT_STREAM =
  sig
    type 'a class_t
    type 'a output_stream_class_t
    type 'a converter_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a output_stream_class_t
       -> 'b converter_class_t
       -> base class_t
    val getConverter : 'a class_t -> base converter_class_t
    val converterProp : ('a class_t, base converter_class_t option, 'b converter_class_t option) Property.readwrite
  end
