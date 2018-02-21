structure PangoGlyphString :>
  PANGO_GLYPH_STRING
    where type t = PangoGlyphStringRecord.t
    where type rectangle_t = PangoRectangleRecord.t
    where type 'a font_class = 'a PangoFontClass.class
    where type analysis_t = PangoAnalysisRecord.t =
  struct
    val getType_ = _import "pango_glyph_string_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "pango_glyph_string_new" : unit -> PangoGlyphStringRecord.FFI.notnull PangoGlyphStringRecord.FFI.p;
    val copy_ = _import "pango_glyph_string_copy" : PangoGlyphStringRecord.FFI.notnull PangoGlyphStringRecord.FFI.p -> unit PangoGlyphStringRecord.FFI.p;
    val extents_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_glyph_string_extents" :
              PangoGlyphStringRecord.FFI.notnull PangoGlyphStringRecord.FFI.p
               * PangoFontClass.FFI.notnull PangoFontClass.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val extentsRange_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "pango_glyph_string_extents_range" :
              PangoGlyphStringRecord.FFI.notnull PangoGlyphStringRecord.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * PangoFontClass.FFI.notnull PangoFontClass.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getWidth_ = _import "pango_glyph_string_get_width" : PangoGlyphStringRecord.FFI.notnull PangoGlyphStringRecord.FFI.p -> GInt.FFI.val_;
    val indexToX_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_pango_glyph_string_index_to_x" :
              PangoGlyphStringRecord.FFI.notnull PangoGlyphStringRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * PangoAnalysisRecord.FFI.notnull PangoAnalysisRecord.FFI.p
               * GInt.FFI.val_
               * GBool.FFI.val_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val setSize_ = fn x1 & x2 => (_import "pango_glyph_string_set_size" : PangoGlyphStringRecord.FFI.notnull PangoGlyphStringRecord.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val xToIndex_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_pango_glyph_string_x_to_index" :
              PangoGlyphStringRecord.FFI.notnull PangoGlyphStringRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * PangoAnalysisRecord.FFI.notnull PangoAnalysisRecord.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    type t = PangoGlyphStringRecord.t
    type rectangle_t = PangoRectangleRecord.t
    type 'a font_class = 'a PangoFontClass.class
    type analysis_t = PangoAnalysisRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> PangoGlyphStringRecord.FFI.fromPtr true) new_ ()
    fun copy self = (PangoGlyphStringRecord.FFI.withPtr ---> PangoGlyphStringRecord.FFI.fromOptPtr true) copy_ self
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
            PangoGlyphStringRecord.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> PangoFontClass.FFI.withPtr
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
    fun getWidth self = (PangoGlyphStringRecord.FFI.withPtr ---> GInt.FFI.fromVal) getWidth_ self
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
            PangoGlyphStringRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> PangoAnalysisRecord.FFI.withPtr
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
    fun setSize self newLen = (PangoGlyphStringRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setSize_ (self & newLen)
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
            PangoGlyphStringRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> PangoAnalysisRecord.FFI.withPtr
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
