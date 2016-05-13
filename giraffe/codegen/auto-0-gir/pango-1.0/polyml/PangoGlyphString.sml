structure PangoGlyphString :>
  PANGO_GLYPH_STRING
    where type t = PangoGlyphStringRecord.t
    where type rectangle_t = PangoRectangleRecord.t
    where type 'a font_class = 'a PangoFontClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_glyph_string_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libpango "pango_glyph_string_new") (PolyMLFFI.cVoid --> PangoGlyphStringRecord.PolyML.cPtr)
      val copy_ = call (load_sym libpango "pango_glyph_string_copy") (PangoGlyphStringRecord.PolyML.cPtr --> PangoGlyphStringRecord.PolyML.cPtr)
      val extents_ =
        call (load_sym libpango "pango_glyph_string_extents")
          (
            PangoGlyphStringRecord.PolyML.cPtr
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val extentsRange_ =
        call (load_sym libpango "pango_glyph_string_extents_range")
          (
            PangoGlyphStringRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getWidth_ = call (load_sym libpango "pango_glyph_string_get_width") (PangoGlyphStringRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val setSize_ = call (load_sym libpango "pango_glyph_string_set_size") (PangoGlyphStringRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type t = PangoGlyphStringRecord.t
    type rectangle_t = PangoRectangleRecord.t
    type 'a font_class = 'a PangoFontClass.class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> PangoGlyphStringRecord.C.fromPtr true) new_ ()
    fun copy self = (PangoGlyphStringRecord.C.withPtr ---> PangoGlyphStringRecord.C.fromPtr true) copy_ self
    fun extents self font =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoGlyphStringRecord.C.withPtr
             &&&> PangoFontClass.C.withPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true
                   && PangoRectangleRecord.C.fromPtr true
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
        PangoGlyphStringRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> PangoFontClass.C.withPtr
         &&&> PangoRectangleRecord.C.withPtr
         &&&> PangoRectangleRecord.C.withPtr
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
    fun getWidth self = (PangoGlyphStringRecord.C.withPtr ---> FFI.Int.C.fromVal) getWidth_ self
    fun setSize self newLen = (PangoGlyphStringRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSize_ (self & newLen)
  end
