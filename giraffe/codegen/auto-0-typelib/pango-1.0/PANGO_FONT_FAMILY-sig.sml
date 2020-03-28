signature PANGO_FONT_FAMILY =
  sig
    type 'a class
    type font_face_class_c_array_n_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getName : 'a class -> string
    val isMonospace : 'a class -> bool
    val listFaces : 'a class -> font_face_class_c_array_n_t
  end
