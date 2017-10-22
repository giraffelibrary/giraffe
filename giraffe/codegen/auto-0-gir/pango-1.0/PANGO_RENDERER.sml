signature PANGO_RENDERER =
  sig
    type 'a class
    type glyph_t
    type glyph_item_t
    type glyph_string_t
    type 'a font_class
    type 'a layout_class
    type layout_line_t
    type color_t
    type render_part_t
    type matrix_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val activate : 'a class -> unit
    val deactivate : 'a class -> unit
    val drawErrorUnderline :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val drawGlyph :
      'a class
       -> 'b font_class
           * glyph_t
           * real
           * real
       -> unit
    val drawGlyphItem :
      'a class
       -> string option
           * glyph_item_t
           * LargeInt.int
           * LargeInt.int
       -> unit
    val drawGlyphs :
      'a class
       -> 'b font_class
           * glyph_string_t
           * LargeInt.int
           * LargeInt.int
       -> unit
    val drawLayout :
      'a class
       -> 'b layout_class
           * LargeInt.int
           * LargeInt.int
       -> unit
    val drawLayoutLine :
      'a class
       -> layout_line_t
           * LargeInt.int
           * LargeInt.int
       -> unit
    val drawRectangle :
      'a class
       -> render_part_t
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val drawTrapezoid :
      'a class
       -> render_part_t
           * real
           * real
           * real
           * real
           * real
           * real
       -> unit
    val getAlpha :
      'a class
       -> render_part_t
       -> LargeInt.int
    val getColor :
      'a class
       -> render_part_t
       -> color_t
    val getLayout : 'a class -> base layout_class
    val getLayoutLine : 'a class -> layout_line_t
    val getMatrix : 'a class -> matrix_t
    val partChanged :
      'a class
       -> render_part_t
       -> unit
    val setAlpha :
      'a class
       -> render_part_t * LargeInt.int
       -> unit
    val setColor :
      'a class
       -> render_part_t * color_t option
       -> unit
    val setMatrix :
      'a class
       -> matrix_t option
       -> unit
  end
