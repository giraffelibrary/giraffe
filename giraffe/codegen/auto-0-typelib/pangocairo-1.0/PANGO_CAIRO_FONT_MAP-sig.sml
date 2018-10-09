signature PANGO_CAIRO_FONT_MAP =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base Pango.FontMapClass.class
    val new : unit -> base Pango.FontMapClass.class
    val getResolution : 'a class -> real
    val setDefault : 'a class -> unit
    val setResolution :
      'a class
       -> real
       -> unit
  end
