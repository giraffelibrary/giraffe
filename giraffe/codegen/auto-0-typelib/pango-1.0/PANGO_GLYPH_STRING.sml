signature PANGO_GLYPH_STRING =
  sig
    type record_t
    type rectanglerecord_t
    type 'a fontclass_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val copy : record_t -> record_t
    val extents :
      record_t
       -> 'a fontclass_t
       -> rectanglerecord_t * rectanglerecord_t
    val extentsRange :
      record_t
       -> LargeInt.int
       -> LargeInt.int
       -> 'a fontclass_t
       -> rectanglerecord_t
       -> rectanglerecord_t
       -> unit
    val getWidth : record_t -> LargeInt.int
    val setSize :
      record_t
       -> LargeInt.int
       -> unit
  end
