signature GIO_D_BUS_AUTH_OBSERVER =
  sig
    type 'a class_t
    type 'a iostreamclass_t
    type 'a credentialsclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val authorizeAuthenticatedPeer :
      'a class_t
       -> 'b iostreamclass_t
       -> 'c credentialsclass_t
       -> bool
    val authorizeAuthenticatedPeerSig :
      (base iostreamclass_t
        -> base credentialsclass_t
        -> bool)
       -> 'a class_t Signal.signal
  end
