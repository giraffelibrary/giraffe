signature PANGO_LANGUAGE =
  sig
    type t
    type script_c_array_n_t
    type script_t
    val getType : unit -> GObject.Type.t
    val getSampleString : t -> string
    val getScripts : t -> script_c_array_n_t option
    val includesScript :
      t
       -> script_t
       -> bool
    val matches :
      t
       -> string
       -> bool
    val toString : t -> string
    val fromString : string option -> t option
    val getDefault : unit -> t
  end
