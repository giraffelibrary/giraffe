signature PANGO_GLYPH_STRING =
  sig
    type t
    type rectangle_t
    type 'a font_class
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val copy : t -> t
    val extents :
      t
       -> 'a font_class
       -> rectangle_t * rectangle_t
    val extentsRange :
      t
       -> LargeInt.int
           * LargeInt.int
           * 'a font_class
           * rectangle_t
           * rectangle_t
       -> unit
    val getWidth : t -> LargeInt.int
    val setSize :
      t
       -> LargeInt.int
       -> unit
  end
