signature GIO_TLS_FILE_DATABASE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val anchorsProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
