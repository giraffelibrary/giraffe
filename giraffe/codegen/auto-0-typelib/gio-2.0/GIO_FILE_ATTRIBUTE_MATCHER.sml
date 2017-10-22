signature GIO_FILE_ATTRIBUTE_MATCHER =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val new : string -> t
    val enumerateNamespace :
      t
       -> string
       -> bool
    val enumerateNext : t -> string
    val matches :
      t
       -> string
       -> bool
    val matchesOnly :
      t
       -> string
       -> bool
    val subtract :
      t
       -> t
       -> t
    val toString : t -> string
  end
