structure PangoGlyphItem :>
  PANGO_GLYPH_ITEM
    where type record_t = PangoGlyphItemRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_glyph_item_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val copy_ = call (load_sym libpango "pango_glyph_item_copy") (PangoGlyphItemRecord.PolyML.PTR --> PangoGlyphItemRecord.PolyML.PTR)
      val split_ =
        call (load_sym libpango "pango_glyph_item_split")
          (
            PangoGlyphItemRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             --> PangoGlyphItemRecord.PolyML.PTR
          )
    end
    type record_t = PangoGlyphItemRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (PangoGlyphItemRecord.C.withPtr ---> PangoGlyphItemRecord.C.fromPtr true) copy_ self
    fun split self text splitIndex =
      (
        PangoGlyphItemRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
