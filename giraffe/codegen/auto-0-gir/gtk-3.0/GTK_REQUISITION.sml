signature GTK_REQUISITION =
  sig
    type record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val copy : record_t -> record_t
  end
