signature GTK_BORDER =
  sig
    type record_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val copy : record_t -> record_t
  end
