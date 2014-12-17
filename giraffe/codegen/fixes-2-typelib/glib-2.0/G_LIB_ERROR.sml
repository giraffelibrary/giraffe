signature G_LIB_ERROR =
  sig
    type record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
  end
