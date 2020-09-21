signature PANGO_GLYPH_ITEM_ITER =
  sig
    type t
    type glyph_item_t
    val getType : unit -> GObject.Type.t
    val copy : t -> t option
    val initEnd :
      t
       -> glyph_item_t * string
       -> bool
    val initStart :
      t
       -> glyph_item_t * string
       -> bool
    val nextCluster : t -> bool
    val prevCluster : t -> bool
  end
