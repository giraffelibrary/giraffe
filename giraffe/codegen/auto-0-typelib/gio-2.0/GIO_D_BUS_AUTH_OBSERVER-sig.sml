signature GIO_D_BUS_AUTH_OBSERVER =
  sig
    type 'a class
    type 'a credentials_class
    type 'a i_o_stream_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val allowMechanism :
      'a class
       -> string
       -> bool
    val authorizeAuthenticatedPeer :
      'a class
       -> 'b i_o_stream_class * 'c credentials_class option
       -> bool
    val allowMechanismSig : (string -> bool) -> 'a class Signal.t
    val authorizeAuthenticatedPeerSig : (base i_o_stream_class * base credentials_class option -> bool) -> 'a class Signal.t
  end
