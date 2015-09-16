signature PANGO_RENDERER =
  sig
    type 'a class_t
    type glyph_t
    type glyph_item_record_t
    type glyph_string_record_t
    type 'a font_class_t
    type 'a layout_class_t
    type layout_line_record_t
    type color_record_t
    type render_part_t
    type matrix_record_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val activate : 'a class_t -> unit
    val deactivate : 'a class_t -> unit
    val drawErrorUnderline :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawGlyph :
      'a class_t
       -> 'b font_class_t
       -> glyph_t
       -> real
       -> real
       -> unit
    val drawGlyphItem :
      'a class_t
       -> string option
       -> glyph_item_record_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawGlyphs :
      'a class_t
       -> 'b font_class_t
       -> glyph_string_record_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawLayout :
      'a class_t
       -> 'b layout_class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawLayoutLine :
      'a class_t
       -> layout_line_record_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawRectangle :
      'a class_t
       -> render_part_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawTrapezoid :
      'a class_t
       -> render_part_t
       -> real
       -> real
       -> real
       -> real
       -> real
       -> real
       -> unit
    val getColor :
      'a class_t
       -> render_part_t
       -> color_record_t
    val getLayout : 'a class_t -> base layout_class_t
    val getLayoutLine : 'a class_t -> layout_line_record_t
    val getMatrix : 'a class_t -> matrix_record_t
    val partChanged :
      'a class_t
       -> render_part_t
       -> unit
    val setColor :
      'a class_t
       -> render_part_t
       -> color_record_t option
       -> unit
    val setMatrix :
      'a class_t
       -> matrix_record_t option
       -> unit
  end
