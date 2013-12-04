signature PANGO_COLOR =
  sig
    type record_t
    val getType : unit -> GObject.Type.t
    val copy : record_t -> record_t
    val parse :
      record_t
       -> string
       -> bool
    val toString : record_t -> string
  end
