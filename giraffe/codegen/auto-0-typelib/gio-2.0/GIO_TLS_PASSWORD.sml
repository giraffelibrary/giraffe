signature GIO_TLS_PASSWORD =
  sig
    type 'a class_t
    type tlspasswordflags_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      tlspasswordflags_t
       -> string
       -> base class_t
    val getDescription : 'a class_t -> string
    val getFlags : 'a class_t -> tlspasswordflags_t
    val getWarning : 'a class_t -> string
    val setDescription :
      'a class_t
       -> string
       -> unit
    val setFlags :
      'a class_t
       -> tlspasswordflags_t
       -> unit
    val setWarning :
      'a class_t
       -> string
       -> unit
    val descriptionProp : ('a class_t, string option, string option) Property.readwrite
    val flagsProp : ('a class_t, tlspasswordflags_t, tlspasswordflags_t) Property.readwrite
    val warningProp : ('a class_t, string option, string option) Property.readwrite
  end
