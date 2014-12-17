signature GIO_UNIX_CREDENTIALS_MESSAGE =
  sig
    type 'a class_t
    type 'a credentialsclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithCredentials : 'a credentialsclass_t -> base class_t
    val isSupported : unit -> bool
    val getCredentials : 'a class_t -> base credentialsclass_t
    val credentialsProp : ('a class_t, base credentialsclass_t option, 'b credentialsclass_t option) Property.readwrite
  end
