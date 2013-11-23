signature ATK_UTIL =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
  end
