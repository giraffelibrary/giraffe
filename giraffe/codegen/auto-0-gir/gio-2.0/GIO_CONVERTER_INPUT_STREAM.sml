signature GIO_CONVERTER_INPUT_STREAM =
  sig
    type 'a class_t
    type 'a inputstreamclass_t
    type 'a converterclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a inputstreamclass_t
       -> 'b converterclass_t
       -> base class_t
    val getConverter : 'a class_t -> base converterclass_t
    val converterProp : ('a class_t, base converterclass_t option, 'b converterclass_t option) Property.readwrite
  end
