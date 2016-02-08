structure PangoGlyphItem :>
  PANGO_GLYPH_ITEM
    where type record_t = PangoGlyphItemRecord.t =
  struct
    val getType_ = _import "pango_glyph_item_get_type" : unit -> GObjectType.C.val_;
    val copy_ = _import "pango_glyph_item_copy" : PangoGlyphItemRecord.C.notnull PangoGlyphItemRecord.C.p -> PangoGlyphItemRecord.C.notnull PangoGlyphItemRecord.C.p;
    val split_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_glyph_item_split" :
              PangoGlyphItemRecord.C.notnull PangoGlyphItemRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int32.C.val_
               -> PangoGlyphItemRecord.C.notnull PangoGlyphItemRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type record_t = PangoGlyphItemRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (PangoGlyphItemRecord.C.withPtr ---> PangoGlyphItemRecord.C.fromPtr true) copy_ self
    fun split self text splitIndex =
      (
        PangoGlyphItemRecord.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         ---> PangoGlyphItemRecord.C.fromPtr true
      )
        split_
        (
          self
           & text
           & splitIndex
        )
  end
