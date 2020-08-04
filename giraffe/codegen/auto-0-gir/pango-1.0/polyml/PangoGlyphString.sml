structure PangoGlyphString :>
  PANGO_GLYPH_STRING
    where type t = PangoGlyphStringRecord.t
    where type rectangle_t = PangoRectangleRecord.t
    where type 'a font_class = 'a PangoFontClass.class
    where type analysis_t = PangoAnalysisRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_glyph_string_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_glyph_string_new") (cVoid --> PangoGlyphStringRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "pango_glyph_string_copy") (PangoGlyphStringRecord.PolyML.cPtr --> PangoGlyphStringRecord.PolyML.cOptPtr)
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
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> PangoFontClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getWidth_ = call (getSymbol "pango_glyph_string_get_width") (PangoGlyphStringRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val indexToX_ =
        call (getSymbol "pango_glyph_string_index_to_x")
          (
            PangoGlyphStringRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> PangoAnalysisRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val setSize_ = call (getSymbol "pango_glyph_string_set_size") (PangoGlyphStringRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val xToIndex_ =
        call (getSymbol "pango_glyph_string_x_to_index")
          (
            PangoGlyphStringRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> PangoAnalysisRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
    end
    type t = PangoGlyphStringRecord.t
    type rectangle_t = PangoRectangleRecord.t
    type 'a font_class = 'a PangoFontClass.class
    type analysis_t = PangoAnalysisRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoGlyphStringRecord.FFI.fromPtr true) new_ ()
    fun copy self = (PangoGlyphStringRecord.FFI.withPtr false ---> PangoGlyphStringRecord.FFI.fromOptPtr true) copy_ self
    fun extents self font =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoGlyphStringRecord.FFI.withPtr false
             &&&> PangoFontClass.FFI.withPtr false
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
    fun extentsRange
      self
      (
        start,
        end',
        font
      ) =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoGlyphStringRecord.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> PangoFontClass.FFI.withPtr false
             &&&> PangoRectangleRecord.FFI.withNewPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true
                   && PangoRectangleRecord.FFI.fromPtr true
                   && I
          )
            extentsRange_
            (
              self
               & start
               & end'
               & font
               & ()
               & ()
            )
      in
        (inkRect, logicalRect)
      end
    fun getWidth self = (PangoGlyphStringRecord.FFI.withPtr false ---> GInt.FFI.fromVal) getWidth_ self
    fun indexToX
      self
      (
        text,
        length,
        analysis,
        index,
        trailing
      ) =
      let
        val xPos & () =
          (
            PangoGlyphStringRecord.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GInt.FFI.withVal
             &&&> PangoAnalysisRecord.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal && I
          )
            indexToX_
            (
              self
               & text
               & length
               & analysis
               & index
               & trailing
               & GInt.null
            )
      in
        xPos
      end
    fun setSize self newLen = (PangoGlyphStringRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setSize_ (self & newLen)
    fun xToIndex
      self
      (
        text,
        length,
        analysis,
        xPos
      ) =
      let
        val index
         & trailing
         & () =
          (
            PangoGlyphStringRecord.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GInt.FFI.withVal
             &&&> PangoAnalysisRecord.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            xToIndex_
            (
              self
               & text
               & length
               & analysis
               & xPos
               & GInt.null
               & GInt.null
            )
      in
        (index, trailing)
      end
  end
