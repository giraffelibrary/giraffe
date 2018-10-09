signature GIO_TCP_WRAPPER_CONNECTION =
  sig
    type 'a class
    type 'a socket_class
    type 'a i_o_stream_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a i_o_stream_class * 'b socket_class -> base class
    val getBaseIoStream : 'a class -> base i_o_stream_class
    val baseIoStreamProp :
      {
        get : 'a class -> base i_o_stream_class option,
        new : 'b i_o_stream_class option -> 'a class Property.t
      }
  end
