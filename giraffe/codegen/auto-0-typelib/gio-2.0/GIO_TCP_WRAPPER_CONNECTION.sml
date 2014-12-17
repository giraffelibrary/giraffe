signature GIO_TCP_WRAPPER_CONNECTION =
  sig
    type 'a class_t
    type 'a socketclass_t
    type 'a iostreamclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a iostreamclass_t
       -> 'b socketclass_t
       -> base class_t
    val getBaseIoStream : 'a class_t -> base iostreamclass_t
    val baseIoStreamProp : ('a class_t, base iostreamclass_t option, 'b iostreamclass_t option) Property.readwrite
  end
