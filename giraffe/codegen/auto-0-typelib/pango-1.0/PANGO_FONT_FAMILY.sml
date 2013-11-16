signature PANGO_FONT_FAMILY =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val getName : 'a class_t -> string
    val isMonospace : 'a class_t -> bool
  end
