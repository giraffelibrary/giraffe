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
    val descriptionProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val flagsProp :
      {
        get : 'a class -> tls_password_flags_t,
        set :
          tls_password_flags_t
           -> 'a class
           -> unit,
        new : tls_password_flags_t -> 'a class Property.t
      }
    val warningProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
