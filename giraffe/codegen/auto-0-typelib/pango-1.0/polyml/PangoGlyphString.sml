structure PangoGlyphString :>
  PANGO_GLYPH_STRING
    where type t = PangoGlyphStringRecord.t
    where type rectangle_t = PangoRectangleRecord.t
    where type 'a font_class = 'a PangoFontClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_glyph_string_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_glyph_string_new") (cVoid --> PangoGlyphStringRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "pango_glyph_string_copy") (PangoGlyphStringRecord.PolyML.cPtr --> PangoGlyphStringRecord.PolyML.cPtr)
      val extents_ =
        call (getSymbol "pango_glyph_string_extents")
          (
            PangoGlyphStringRecord.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val extentsRange_ =
        call (getSymbol "pango_glyph_string_extents_range")
          (
            PangoGlyphStringRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getWidth_ = call (getSymbol "pango_glyph_string_get_width") (PangoGlyphStringRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val setSize_ = call (getSymbol "pango_glyph_string_set_size") (PangoGlyphStringRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
    end
    type t = PangoGlyphStringRecord.t
    type rectangle_t = PangoRectangleRecord.t
    type 'a font_class = 'a PangoFontClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoGlyphStringRecord.FFI.fromPtr true) new_ ()
    fun copy self = (PangoGlyphStringRecord.FFI.withPtr ---> PangoGlyphStringRecord.FFI.fromPtr true) copy_ self
    fun extents self font =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoGlyphStringRecord.FFI.withPtr
             &&&> PangoFontClass.FFI.withPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true
                   && PangoRectangleRecord.FFI.fromPtr true
                   && I
          )
            extents_
            (
              self
               & font
               & ()
               & ()
            )
      in
        (inkRect, logicalRect)
      end
    fun extentsRange self start end' font inkRect logicalRect =
      (
        PangoGlyphStringRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> PangoFontClass.FFI.withPtr
         &&&> PangoRectangleRecord.FFI.withPtr
         &&&> PangoRectangleRecord.FFI.withPtr
         ---> I
      )
        extentsRange_
        (
          self
           & start
           & end'
           & font
           & inkRect
           & logicalRect
        )
    fun getWidth self = (PangoGlyphStringRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getWidth_ self
    fun setSize self newLen = (PangoGlyphStringRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setSize_ (self & newLen)
  end
