signature PANGO_FONTSET =
  sig
    type 'a class
    type 'a font_class
    type font_metrics_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getFont :
      'a class
       -> LargeInt.int
       -> base font_class
    val getMetrics : 'a class -> font_metrics_t
  end
