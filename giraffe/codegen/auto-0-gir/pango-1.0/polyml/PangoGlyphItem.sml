structure PangoGlyphItem :>
  PANGO_GLYPH_ITEM
    where type t = PangoGlyphItemRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_glyph_item_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (load_sym libpango "pango_glyph_item_copy") (PangoGlyphItemRecord.PolyML.cPtr --> PangoGlyphItemRecord.PolyML.cPtr)
      val split_ =
        call (load_sym libpango "pango_glyph_item_split")
          (
            PangoGlyphItemRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> PangoGlyphItemRecord.PolyML.cPtr
          )
    end
    type t = PangoGlyphItemRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (PangoGlyphItemRecord.C.withPtr ---> PangoGlyphItemRecord.C.fromPtr true) copy_ self
    fun split self text splitIndex =
      (
        PangoGlyphItemRecord.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> PangoGlyphItemRecord.C.fromPtr true
      )
        split_
        (
          self
           & text
           & splitIndex
        )
  end
