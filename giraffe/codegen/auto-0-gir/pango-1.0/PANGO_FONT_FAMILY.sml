signature PANGO_FONT_FAMILY =
  sig
    type 'a class
    type 'a font_face_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getName : 'a class -> string
    val isMonospace : 'a class -> bool
    val listFaces : 'a class -> base font_face_class vector
  end
