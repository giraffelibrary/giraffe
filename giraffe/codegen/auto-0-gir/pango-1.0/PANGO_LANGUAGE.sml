signature PANGO_LANGUAGE =
  sig
    type t
    type script_t
    val getType : unit -> GObject.Type.t
    val getSampleString : t -> string
    val getScripts : t -> script_t vector
    val includesScript :
      t
       -> script_t
       -> bool
    val matches :
      t
       -> string
       -> bool
    val toString : t -> string
    val fromString : string option -> t
    val getDefault : unit -> t
  end
