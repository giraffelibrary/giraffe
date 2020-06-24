structure PangoGlyphString :>
  PANGO_GLYPH_STRING
    where type t = PangoGlyphStringRecord.t
    where type rectangle_t = PangoRectangleRecord.t
    where type 'a font_class = 'a PangoFontClass.class
    where type analysis_t = PangoAnalysisRecord.t =
  struct
    val getType_ = _import "pango_glyph_string_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "pango_glyph_string_new" : unit -> PangoGlyphStringRecord.FFI.non_opt PangoGlyphStringRecord.FFI.p;
    val copy_ = _import "pango_glyph_string_copy" : PangoGlyphStringRecord.FFI.non_opt PangoGlyphStringRecord.FFI.p -> PangoGlyphStringRecord.FFI.opt PangoGlyphStringRecord.FFI.p;
    val extents_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_glyph_string_extents" :
              PangoGlyphStringRecord.FFI.non_opt PangoGlyphStringRecord.FFI.p
               * PangoFontClass.FFI.non_opt PangoFontClass.FFI.p
               * PangoRectangleRecord.FFI.non_opt PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.non_opt PangoRectangleRecord.FFI.p
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
              PangoGlyphStringRecord.FFI.non_opt PangoGlyphStringRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * PangoFontClass.FFI.non_opt PangoFontClass.FFI.p
               * PangoRectangleRecord.FFI.non_opt PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.non_opt PangoRectangleRecord.FFI.p
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
    val getWidth_ = _import "pango_glyph_string_get_width" : PangoGlyphStringRecord.FFI.non_opt PangoGlyphStringRecord.FFI.p -> GInt32.FFI.val_;
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
              PangoGlyphStringRecord.FFI.non_opt PangoGlyphStringRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * PangoAnalysisRecord.FFI.non_opt PangoAnalysisRecord.FFI.p
               * GInt32.FFI.val_
               * GBool.FFI.val_
               * GInt32.FFI.ref_
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
    val setSize_ = fn x1 & x2 => (_import "pango_glyph_string_set_size" : PangoGlyphStringRecord.FFI.non_opt PangoGlyphStringRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
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
              PangoGlyphStringRecord.FFI.non_opt PangoGlyphStringRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               * PangoAnalysisRecord.FFI.non_opt PangoAnalysisRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
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
    fun getWidth self = (PangoGlyphStringRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getWidth_ self
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
             &&&> GInt32.FFI.withVal
             &&&> PangoAnalysisRecord.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal && I
          )
            indexToX_
            (
              self
               & text
               & length
               & analysis
               & index
               & trailing
               & GInt32.null
            )
      in
        xPos
      end
    fun setSize self newLen = (PangoGlyphStringRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setSize_ (self & newLen)
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
             &&&> GInt32.FFI.withVal
             &&&> PangoAnalysisRecord.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            xToIndex_
            (
              self
               & text
               & length
               & analysis
               & xPos
               & GInt32.null
               & GInt32.null
            )
      in
        (index, trailing)
      end
  end
