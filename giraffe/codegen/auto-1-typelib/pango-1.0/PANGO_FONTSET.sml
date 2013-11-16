signature PANGO_FONTSET =
  sig
    type 'a class_t
    type fontmetricsrecord_t
    type 'a fontclass_t
    val getType : unit -> GObject.Type.t
    val getFont :
      'a class_t
       -> LargeInt.int
       -> base fontclass_t
    val getMetrics : 'a class_t -> fontmetricsrecord_t
  end
