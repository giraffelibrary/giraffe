signature GIO_TLS_PASSWORD =
  sig
    type 'a class
    type tls_password_flags_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : tls_password_flags_t * string -> base class
    val getDescription : 'a class -> string
    val getFlags : 'a class -> tls_password_flags_t
    val getWarning : 'a class -> string
    val setDescription :
      'a class
       -> string
       -> unit
    val setFlags :
      'a class
       -> tls_password_flags_t
       -> unit
    val setWarning :
      'a class
       -> string
       -> unit
    val descriptionProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val flagsProp : ('a class, unit -> tls_password_flags_t, tls_password_flags_t -> unit, tls_password_flags_t -> unit) Property.t
    val warningProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
