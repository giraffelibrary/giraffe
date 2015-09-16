signature PANGO_FONTSET =
  sig
    type 'a class_t
    type 'a font_class_t
    type font_metrics_record_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getFont :
      'a class_t
       -> LargeInt.int
       -> base font_class_t
    val getMetrics : 'a class_t -> font_metrics_record_t
  end
