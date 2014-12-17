signature GIO_TLS_SERVER_CONNECTION =
  sig
    type 'a class_t
    type 'a tlscertificateclass_t
    type 'a iostreamclass_t
    type tlsauthenticationmode_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a iostreamclass_t
       -> 'b tlscertificateclass_t option
       -> base iostreamclass_t
    val authenticationModeProp : ('a class_t, tlsauthenticationmode_t, tlsauthenticationmode_t) Property.readwrite
  end
