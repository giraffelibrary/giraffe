signature GIO_UNIX_CREDENTIALS_MESSAGE =
  sig
    type 'a class
    type 'a credentials_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithCredentials : 'a credentials_class -> base class
    val isSupported : unit -> bool
    val getCredentials : 'a class -> base credentials_class
    val credentialsProp : ('a class, base credentials_class option, 'b credentials_class option) Property.readwrite
  end
