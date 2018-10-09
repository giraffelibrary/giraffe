signature PANGO_LAYOUT_ITER =
  sig
    type t
    type 'a layout_class
    type layout_line_t
    type rectangle_t
    type glyph_item_t
    val getType : unit -> GObject.Type.t
    val atLastLine : t -> bool
    val copy : t -> t option
    val getBaseline : t -> LargeInt.int
    val getCharExtents : t -> rectangle_t
    val getClusterExtents : t -> rectangle_t * rectangle_t
    val getIndex : t -> LargeInt.int
    val getLayout : t -> base layout_class
    val getLayoutExtents : t -> rectangle_t * rectangle_t
    val getLine : t -> layout_line_t
    val getLineExtents : t -> rectangle_t * rectangle_t
    val getLineReadonly : t -> layout_line_t
    val getLineYrange : t -> LargeInt.int * LargeInt.int
    val getRun : t -> glyph_item_t option
    val getRunExtents : t -> rectangle_t * rectangle_t
    val getRunReadonly : t -> glyph_item_t option
    val nextChar : t -> bool
    val nextCluster : t -> bool
    val nextLine : t -> bool
    val nextRun : t -> bool
  end
