signature GIO_UNIX_CREDENTIALS_MESSAGE =
  sig
    type 'a class_t
    type 'a credentials_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithCredentials : 'a credentials_class_t -> base class_t
    val isSupported : unit -> bool
    val getCredentials : 'a class_t -> base credentials_class_t
    val credentialsProp : ('a class_t, base credentials_class_t option, 'b credentials_class_t option) Property.readwrite
  end
