signature G_LIB_ERROR =
  sig
    type record_t
    val getType : unit -> GObject.Type.t
  end
