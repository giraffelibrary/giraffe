signature PANGO_FONT_FACE_CLASS =
  sig
    type 'a font_face
    include
      CLASS
        where type 'a class = 'a font_face GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
