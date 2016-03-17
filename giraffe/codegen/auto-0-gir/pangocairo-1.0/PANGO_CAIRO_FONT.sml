signature PANGO_CAIRO_FONT =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getScaledFont : 'a class -> Cairo.ScaledFontRecord.t
  end
