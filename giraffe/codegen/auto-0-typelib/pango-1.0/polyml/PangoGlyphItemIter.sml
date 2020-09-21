structure PangoGlyphItemIter :>
  PANGO_GLYPH_ITEM_ITER
    where type t = PangoGlyphItemIterRecord.t
    where type glyph_item_t = PangoGlyphItemRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_glyph_item_iter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (getSymbol "pango_glyph_item_iter_copy") (PangoGlyphItemIterRecord.PolyML.cPtr --> PangoGlyphItemIterRecord.PolyML.cOptPtr)
      val initEnd_ =
        call (getSymbol "pango_glyph_item_iter_init_end")
          (
            PangoGlyphItemIterRecord.PolyML.cPtr
             &&> PangoGlyphItemRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
      val initStart_ =
        call (getSymbol "pango_glyph_item_iter_init_start")
          (
            PangoGlyphItemIterRecord.PolyML.cPtr
             &&> PangoGlyphItemRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
      val nextCluster_ = call (getSymbol "pango_glyph_item_iter_next_cluster") (PangoGlyphItemIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val prevCluster_ = call (getSymbol "pango_glyph_item_iter_prev_cluster") (PangoGlyphItemIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = PangoGlyphItemIterRecord.t
    type glyph_item_t = PangoGlyphItemRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (PangoGlyphItemIterRecord.FFI.withPtr false ---> PangoGlyphItemIterRecord.FFI.fromOptPtr true) copy_ self
    fun initEnd self (glyphItem, text) =
      (
        PangoGlyphItemIterRecord.FFI.withPtr false
         &&&> PangoGlyphItemRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> GBool.FFI.fromVal
      )
        initEnd_
        (
          self
           & glyphItem
           & text
        )
    fun initStart self (glyphItem, text) =
      (
        PangoGlyphItemIterRecord.FFI.withPtr false
         &&&> PangoGlyphItemRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> GBool.FFI.fromVal
      )
        initStart_
        (
          self
           & glyphItem
           & text
        )
    fun nextCluster self = (PangoGlyphItemIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) nextCluster_ self
    fun prevCluster self = (PangoGlyphItemIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) prevCluster_ self
  end
