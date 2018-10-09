signature GTK_TEXT_ATTRIBUTES =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val copy : t -> t
    val copyValues :
      t
       -> t
       -> unit
  end
