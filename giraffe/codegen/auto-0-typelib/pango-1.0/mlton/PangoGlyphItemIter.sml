structure PangoGlyphItemIter :>
  PANGO_GLYPH_ITEM_ITER
    where type t = PangoGlyphItemIterRecord.t
    where type glyph_item_t = PangoGlyphItemRecord.t =
  struct
    val getType_ = _import "pango_glyph_item_iter_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "pango_glyph_item_iter_copy" : PangoGlyphItemIterRecord.FFI.non_opt PangoGlyphItemIterRecord.FFI.p -> PangoGlyphItemIterRecord.FFI.opt PangoGlyphItemIterRecord.FFI.p;
    val initEnd_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_pango_glyph_item_iter_init_end" :
              PangoGlyphItemIterRecord.FFI.non_opt PangoGlyphItemIterRecord.FFI.p
               * PangoGlyphItemRecord.FFI.non_opt PangoGlyphItemRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val initStart_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_pango_glyph_item_iter_init_start" :
              PangoGlyphItemIterRecord.FFI.non_opt PangoGlyphItemIterRecord.FFI.p
               * PangoGlyphItemRecord.FFI.non_opt PangoGlyphItemRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val nextCluster_ = _import "pango_glyph_item_iter_next_cluster" : PangoGlyphItemIterRecord.FFI.non_opt PangoGlyphItemIterRecord.FFI.p -> GBool.FFI.val_;
    val prevCluster_ = _import "pango_glyph_item_iter_prev_cluster" : PangoGlyphItemIterRecord.FFI.non_opt PangoGlyphItemIterRecord.FFI.p -> GBool.FFI.val_;
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
