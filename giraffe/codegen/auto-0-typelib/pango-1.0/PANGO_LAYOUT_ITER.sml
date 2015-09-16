signature PANGO_LAYOUT_ITER =
  sig
    type record_t
    type 'a layout_class_t
    type layout_line_record_t
    type rectangle_record_t
    type glyph_item_record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val atLastLine : record_t -> bool
    val copy : record_t -> record_t
    val getBaseline : record_t -> LargeInt.int
    val getCharExtents :
      record_t
       -> rectangle_record_t
       -> unit
    val getClusterExtents : record_t -> rectangle_record_t * rectangle_record_t
    val getIndex : record_t -> LargeInt.int
    val getLayout : record_t -> base layout_class_t
    val getLayoutExtents : record_t -> rectangle_record_t * rectangle_record_t
    val getLine : record_t -> layout_line_record_t
    val getLineExtents : record_t -> rectangle_record_t * rectangle_record_t
    val getLineReadonly : record_t -> layout_line_record_t
    val getLineYrange : record_t -> LargeInt.int * LargeInt.int
    val getRun : record_t -> glyph_item_record_t
    val getRunExtents : record_t -> rectangle_record_t * rectangle_record_t
    val getRunReadonly : record_t -> glyph_item_record_t
    val nextChar : record_t -> bool
    val nextCluster : record_t -> bool
    val nextLine : record_t -> bool
    val nextRun : record_t -> bool
  end
