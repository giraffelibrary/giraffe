signature GIO_TCP_WRAPPER_CONNECTION =
  sig
    type 'a class_t
    type 'a socket_class_t
    type 'a i_o_stream_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a i_o_stream_class_t
       -> 'b socket_class_t
       -> base class_t
    val getBaseIoStream : 'a class_t -> base i_o_stream_class_t
    val baseIoStreamProp : ('a class_t, base i_o_stream_class_t option, 'b i_o_stream_class_t option) Property.readwrite
  end
