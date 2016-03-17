signature PANGO_FONT_FAMILY =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getName : 'a class -> string
    val isMonospace : 'a class -> bool
  end
