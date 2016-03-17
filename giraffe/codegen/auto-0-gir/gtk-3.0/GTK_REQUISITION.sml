signature GTK_REQUISITION =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val copy : t -> t
  end
