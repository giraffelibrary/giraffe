signature GIO_TLS_PASSWORD =
  sig
    type 'a class_t
    type tls_password_flags_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      tls_password_flags_t
       -> string
       -> base class_t
    val getDescription : 'a class_t -> string
    val getFlags : 'a class_t -> tls_password_flags_t
    val getWarning : 'a class_t -> string
    val setDescription :
      'a class_t
       -> string
       -> unit
    val setFlags :
      'a class_t
       -> tls_password_flags_t
       -> unit
    val setWarning :
      'a class_t
       -> string
       -> unit
    val descriptionProp : ('a class_t, string option, string option) Property.readwrite
    val flagsProp : ('a class_t, tls_password_flags_t, tls_password_flags_t) Property.readwrite
    val warningProp : ('a class_t, string option, string option) Property.readwrite
  end
