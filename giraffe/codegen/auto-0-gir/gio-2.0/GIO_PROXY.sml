signature GIO_PROXY =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a proxy_address_class
    type 'a i_o_stream_class
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefaultForProtocol : string -> base class
    val connect :
      'a class
       -> 'b i_o_stream_class
       -> 'c proxy_address_class
       -> 'd cancellable_class option
       -> base i_o_stream_class
    val connectFinish :
      'a class
       -> 'b async_result_class
       -> base i_o_stream_class
    val supportsHostname : 'a class -> bool
  end
