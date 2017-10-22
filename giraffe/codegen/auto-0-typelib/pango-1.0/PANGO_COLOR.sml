signature PANGO_COLOR =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val copy : t -> t option
    val parse :
      t
       -> string
       -> bool
    val toString : t -> string
  end
