signature PANGO_LAYOUT_LINE =
  sig
    type record_t
    type rectangle_record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val getExtents : record_t -> rectangle_record_t * rectangle_record_t
    val getPixelExtents : record_t -> rectangle_record_t * rectangle_record_t
    val indexToX :
      record_t
       -> LargeInt.int
       -> bool
       -> LargeInt.int
    val xToIndex :
      record_t
       -> LargeInt.int
       -> (LargeInt.int * LargeInt.int) option
  end
