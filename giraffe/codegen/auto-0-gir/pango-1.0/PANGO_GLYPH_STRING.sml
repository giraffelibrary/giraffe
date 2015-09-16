signature PANGO_GLYPH_STRING =
  sig
    type record_t
    type rectangle_record_t
    type 'a font_class_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val copy : record_t -> record_t
    val extents :
      record_t
       -> 'a font_class_t
       -> rectangle_record_t * rectangle_record_t
    val extentsRange :
      record_t
       -> LargeInt.int
       -> LargeInt.int
       -> 'a font_class_t
       -> rectangle_record_t
       -> rectangle_record_t
       -> unit
    val getWidth : record_t -> LargeInt.int
    val setSize :
      record_t
       -> LargeInt.int
       -> unit
  end
