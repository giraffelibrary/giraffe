structure PangoGlyphItem :>
  PANGO_GLYPH_ITEM
    where type t = PangoGlyphItemRecord.t =
  struct
    val getType_ = _import "pango_glyph_item_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "pango_glyph_item_copy" : PangoGlyphItemRecord.FFI.non_opt PangoGlyphItemRecord.FFI.p -> PangoGlyphItemRecord.FFI.opt PangoGlyphItemRecord.FFI.p;
    val split_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_glyph_item_split" :
              PangoGlyphItemRecord.FFI.non_opt PangoGlyphItemRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               -> PangoGlyphItemRecord.FFI.non_opt PangoGlyphItemRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type t = PangoGlyphItemRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (PangoGlyphItemRecord.FFI.withPtr ---> PangoGlyphItemRecord.FFI.fromOptPtr true) copy_ self
    fun split self (text, splitIndex) =
      (
        PangoGlyphItemRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> PangoGlyphItemRecord.FFI.fromPtr true
      )
        split_
        (
          self
           & text
           & splitIndex
        )
  end
