structure PangoGlyphItem :>
  PANGO_GLYPH_ITEM
    where type t = PangoGlyphItemRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_glyph_item_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (getSymbol "pango_glyph_item_copy") (PangoGlyphItemRecord.PolyML.cPtr --> PangoGlyphItemRecord.PolyML.cOptPtr)
      val split_ =
        call (getSymbol "pango_glyph_item_split")
          (
            PangoGlyphItemRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> PangoGlyphItemRecord.PolyML.cPtr
          )
    end
    type t = PangoGlyphItemRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (PangoGlyphItemRecord.FFI.withPtr false ---> PangoGlyphItemRecord.FFI.fromOptPtr true) copy_ self
    fun split self (text, splitIndex) =
      (
        PangoGlyphItemRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         ---> PangoGlyphItemRecord.FFI.fromPtr true
      )
        split_
        (
          self
           & text
           & splitIndex
        )
  end
