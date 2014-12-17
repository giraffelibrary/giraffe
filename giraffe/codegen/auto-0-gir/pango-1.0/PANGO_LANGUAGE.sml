signature PANGO_LANGUAGE =
  sig
    type record_t
    type script_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val getSampleString : record_t -> string
    val includesScript :
      record_t
       -> script_t
       -> bool
    val matches :
      record_t
       -> string
       -> bool
    val toString : record_t -> string
    val fromString : string option -> record_t
    val getDefault : unit -> record_t
  end
