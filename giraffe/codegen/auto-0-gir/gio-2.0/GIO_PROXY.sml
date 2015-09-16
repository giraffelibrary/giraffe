signature GIO_PROXY =
  sig
    type 'a class_t
    type 'a cancellable_class_t
    type 'a proxy_address_class_t
    type 'a i_o_stream_class_t
    type 'a async_result_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getDefaultForProtocol : string -> base class_t
    val connect :
      'a class_t
       -> 'b i_o_stream_class_t
       -> 'c proxy_address_class_t
       -> 'd cancellable_class_t option
       -> base i_o_stream_class_t
    val connectFinish :
      'a class_t
       -> 'b async_result_class_t
       -> base i_o_stream_class_t
    val supportsHostname : 'a class_t -> bool
  end
