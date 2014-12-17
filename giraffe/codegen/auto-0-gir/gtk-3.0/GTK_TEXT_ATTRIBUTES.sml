signature GTK_TEXT_ATTRIBUTES =
  sig
    type record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val copy : record_t -> record_t
    val copyValues :
      record_t
       -> record_t
       -> unit
  end
