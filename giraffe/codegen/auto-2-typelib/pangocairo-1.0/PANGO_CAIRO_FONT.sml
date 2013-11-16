signature PANGO_CAIRO_FONT =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val getScaledFont : 'a class_t -> Cairo.ScaledFontRecord.t
  end
