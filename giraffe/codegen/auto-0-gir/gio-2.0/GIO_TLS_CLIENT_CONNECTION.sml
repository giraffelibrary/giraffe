signature GIO_TLS_CLIENT_CONNECTION =
  sig
    type 'a class_t
    type 'a iostreamclass_t
    type 'a socketconnectableclass_t
    type tlscertificateflags_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a iostreamclass_t
       -> 'b socketconnectableclass_t option
       -> base iostreamclass_t
    val getServerIdentity : 'a class_t -> base socketconnectableclass_t
    val getUseSsl3 : 'a class_t -> bool
    val getValidationFlags : 'a class_t -> tlscertificateflags_t
    val setServerIdentity :
      'a class_t
       -> 'b socketconnectableclass_t
       -> unit
    val setUseSsl3 :
      'a class_t
       -> bool
       -> unit
    val setValidationFlags :
      'a class_t
       -> tlscertificateflags_t
       -> unit
    val serverIdentityProp : ('a class_t, base socketconnectableclass_t option, 'b socketconnectableclass_t option) Property.readwrite
    val useSsl3Prop : ('a class_t, bool, bool) Property.readwrite
    val validationFlagsProp : ('a class_t, tlscertificateflags_t, tlscertificateflags_t) Property.readwrite
  end
