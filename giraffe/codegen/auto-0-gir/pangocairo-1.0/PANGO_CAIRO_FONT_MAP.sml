signature PANGO_CAIRO_FONT_MAP =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base Pango.FontMapClass.t
    val new : unit -> base Pango.FontMapClass.t
    val getResolution : 'a class_t -> real
    val setDefault : 'a class_t -> unit
    val setResolution :
      'a class_t
       -> real
       -> unit
  end
