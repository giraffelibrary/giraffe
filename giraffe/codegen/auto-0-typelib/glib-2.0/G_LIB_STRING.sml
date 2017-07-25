signature G_LIB_STRING =
  sig
    type t
    val getType : unit -> GObject.Type.t
  end
