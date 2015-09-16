signature GIO_D_BUS_AUTH_OBSERVER =
  sig
    type 'a class_t
    type 'a credentials_class_t
    type 'a i_o_stream_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val authorizeAuthenticatedPeer :
      'a class_t
       -> 'b i_o_stream_class_t
       -> 'c credentials_class_t
       -> bool
    val authorizeAuthenticatedPeerSig :
      (base i_o_stream_class_t
        -> base credentials_class_t
        -> bool)
       -> 'a class_t Signal.signal
  end
