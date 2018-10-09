signature PANGO_LAYOUT_LINE =
  sig
    type t
    type rectangle_t
    val getType : unit -> GObject.Type.t
    val getExtents : t -> rectangle_t * rectangle_t
    val getPixelExtents : t -> rectangle_t * rectangle_t
    val getXRanges :
      t
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int vector
    val indexToX :
      t
       -> LargeInt.int * bool
       -> LargeInt.int
    val xToIndex :
      t
       -> LargeInt.int
       -> (LargeInt.int * LargeInt.int) option
  end
