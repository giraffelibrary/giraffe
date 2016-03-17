signature GTK_RC_STYLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
  end
