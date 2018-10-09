signature GTK_TOPLEVEL_ACCESSIBLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
  end
