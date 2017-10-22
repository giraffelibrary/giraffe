signature GDK_EVENT_SEQUENCE =
  sig
    type t
    val getType : unit -> GObject.Type.t
  end
