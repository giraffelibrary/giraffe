structure PangoGlyphString :>
  PANGO_GLYPH_STRING
    where type record_t = PangoGlyphStringRecord.t
    where type rectangle_record_t = PangoRectangleRecord.t
    where type 'a font_class_t = 'a PangoFontClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_glyph_string_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libpango "pango_glyph_string_new") (FFI.PolyML.cVoid --> PangoGlyphStringRecord.PolyML.cPtr)
      val copy_ = call (load_sym libpango "pango_glyph_string_copy") (PangoGlyphStringRecord.PolyML.cPtr --> PangoGlyphStringRecord.PolyML.cPtr)
      val extents_ =
        call (load_sym libpango "pango_glyph_string_extents")
          (
            PangoGlyphStringRecord.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val extentsRange_ =
        call (load_sym libpango "pango_glyph_string_extents_range")
          (
            PangoGlyphStringRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getWidth_ = call (load_sym libpango "pango_glyph_string_get_width") (PangoGlyphStringRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val setSize_ = call (load_sym libpango "pango_glyph_string_set_size") (PangoGlyphStringRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type record_t = PangoGlyphStringRecord.t
    type rectangle_record_t = PangoRectangleRecord.t
    type 'a font_class_t = 'a PangoFontClass.t
    type t = record_t
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
             &&&> GObjectObjectClass.C.withPtr
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
         &&&> GObjectObjectClass.C.withPtr
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
