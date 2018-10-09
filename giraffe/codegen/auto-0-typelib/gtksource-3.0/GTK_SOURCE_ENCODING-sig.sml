signature GTK_SOURCE_ENCODING =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val copy : t -> t
    val getCharset : t -> string
    val getName : t -> string
    val toString : t -> string
    val getCurrent : unit -> t
    val getFromCharset : string -> t option
    val getUtf8 : unit -> t
  end
