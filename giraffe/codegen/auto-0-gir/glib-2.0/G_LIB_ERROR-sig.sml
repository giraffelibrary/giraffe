signature G_LIB_ERROR =
  sig
    type t
    val getType : unit -> GObject.Type.t
  end