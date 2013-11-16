signature PANGO_LAYOUT_LINE =
  sig
    type record_t
    type rectanglerecord_t
    val getType : unit -> GObject.Type.t
    val getExtents : record_t -> rectanglerecord_t * rectanglerecord_t
    val getPixelExtents : record_t -> rectanglerecord_t * rectanglerecord_t
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
