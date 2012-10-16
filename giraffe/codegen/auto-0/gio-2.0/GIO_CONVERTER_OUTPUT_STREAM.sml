signature GIO_CONVERTER_OUTPUT_STREAM =
  sig
    type 'a class_t
    type 'a converterclass_t
    type 'a outputstreamclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a outputstreamclass_t
       -> 'b converterclass_t
       -> base class_t
    val getConverter : 'a class_t -> base converterclass_t
    val converterProp : ('a class_t, base converterclass_t option, 'b converterclass_t option) Property.readwrite
  end
