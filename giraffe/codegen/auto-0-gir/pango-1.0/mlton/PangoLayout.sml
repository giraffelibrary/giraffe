structure PangoLayout :>
  PANGO_LAYOUT
    where type 'a class_t = 'a PangoLayoutClass.t
    where type attrlistrecord_t = PangoAttrListRecord.t
    where type 'a contextclass_t = 'a PangoContextClass.t
    where type layoutiterrecord_t = PangoLayoutIterRecord.t
    where type layoutlinerecord_t = PangoLayoutLineRecord.t
    where type rectanglerecord_t = PangoRectangleRecord.t
    where type alignment_t = PangoAlignment.t
    where type ellipsizemode_t = PangoEllipsizeMode.t
    where type fontdescriptionrecord_t = PangoFontDescriptionRecord.t
    where type tabarrayrecord_t = PangoTabArrayRecord.t
    where type wrapmode_t = PangoWrapMode.t =
  struct
    val getType_ = _import "pango_layout_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "pango_layout_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val contextChanged_ = _import "pango_layout_context_changed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val copy_ = _import "pango_layout_copy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAlignment_ = _import "pango_layout_get_alignment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoAlignment.C.val_;
    val getAttributes_ = _import "pango_layout_get_attributes" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p;
    val getAutoDir_ = _import "pango_layout_get_auto_dir" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getBaseline_ = _import "pango_layout_get_baseline" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getCharacterCount_ = _import "pango_layout_get_character_count" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getContext_ = _import "pango_layout_get_context" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getCursorPos_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_layout_get_cursor_pos" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getEllipsize_ = _import "pango_layout_get_ellipsize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoEllipsizeMode.C.val_;
    val getExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_get_extents" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getFontDescription_ = _import "pango_layout_get_font_description" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val getHeight_ = _import "pango_layout_get_height" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getIndent_ = _import "pango_layout_get_indent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getIter_ = _import "pango_layout_get_iter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p;
    val getJustify_ = _import "pango_layout_get_justify" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getLine_ = fn x1 & x2 => (_import "pango_layout_get_line" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p;) (x1, x2)
    val getLineCount_ = _import "pango_layout_get_line_count" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getLineReadonly_ = fn x1 & x2 => (_import "pango_layout_get_line_readonly" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p;) (x1, x2)
    val getPixelExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_get_pixel_extents" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPixelSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_get_pixel_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSingleParagraphMode_ = _import "pango_layout_get_single_paragraph_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_get_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSpacing_ = _import "pango_layout_get_spacing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getTabs_ = _import "pango_layout_get_tabs" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoTabArrayRecord.C.notnull PangoTabArrayRecord.C.p;
    val getText_ = _import "pango_layout_get_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUnknownGlyphsCount_ = _import "pango_layout_get_unknown_glyphs_count" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getWidth_ = _import "pango_layout_get_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getWrap_ = _import "pango_layout_get_wrap" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoWrapMode.C.val_;
    val indexToLineX_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_layout_index_to_line_x" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Bool.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val indexToPos_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_index_to_pos" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val isEllipsized_ = _import "pango_layout_is_ellipsized" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val isWrapped_ = _import "pango_layout_is_wrapped" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setAlignment_ = fn x1 & x2 => (_import "pango_layout_set_alignment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoAlignment.C.val_ -> unit;) (x1, x2)
    val setAutoDir_ = fn x1 & x2 => (_import "pango_layout_set_auto_dir" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setEllipsize_ = fn x1 & x2 => (_import "pango_layout_set_ellipsize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoEllipsizeMode.C.val_ -> unit;) (x1, x2)
    val setFontDescription_ = fn x1 & x2 => (_import "pango_layout_set_font_description" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit PangoFontDescriptionRecord.C.p -> unit;) (x1, x2)
    val setHeight_ = fn x1 & x2 => (_import "pango_layout_set_height" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setIndent_ = fn x1 & x2 => (_import "pango_layout_set_indent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setJustify_ = fn x1 & x2 => (_import "pango_layout_set_justify" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setMarkup_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_layout_set_markup" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setMarkupWithAccel_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_pango_layout_set_markup_with_accel" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int.C.val_
               * FFI.Char.C.val_
               * FFI.Char.C.ref_
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
    val setSingleParagraphMode_ = fn x1 & x2 => (_import "pango_layout_set_single_paragraph_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "pango_layout_set_spacing" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setTabs_ = fn x1 & x2 => (_import "pango_layout_set_tabs" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit PangoTabArrayRecord.C.p -> unit;) (x1, x2)
    val setText_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_layout_set_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setWidth_ = fn x1 & x2 => (_import "pango_layout_set_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setWrap_ = fn x1 & x2 => (_import "pango_layout_set_wrap" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoWrapMode.C.val_ -> unit;) (x1, x2)
    val xyToIndex_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_layout_xy_to_index" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class_t = 'a PangoLayoutClass.t
    type attrlistrecord_t = PangoAttrListRecord.t
    type 'a contextclass_t = 'a PangoContextClass.t
    type layoutiterrecord_t = PangoLayoutIterRecord.t
    type layoutlinerecord_t = PangoLayoutLineRecord.t
    type rectanglerecord_t = PangoRectangleRecord.t
    type alignment_t = PangoAlignment.t
    type ellipsizemode_t = PangoEllipsizeMode.t
    type fontdescriptionrecord_t = PangoFontDescriptionRecord.t
    type tabarrayrecord_t = PangoTabArrayRecord.t
    type wrapmode_t = PangoWrapMode.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new context = (GObjectObjectClass.C.withPtr ---> PangoLayoutClass.C.fromPtr true) new_ context
    fun contextChanged self = (GObjectObjectClass.C.withPtr ---> I) contextChanged_ self
    fun copy self = (GObjectObjectClass.C.withPtr ---> PangoLayoutClass.C.fromPtr true) copy_ self
    fun getAlignment self = (GObjectObjectClass.C.withPtr ---> PangoAlignment.C.fromVal) getAlignment_ self
    fun getAttributes self = (GObjectObjectClass.C.withPtr ---> PangoAttrListRecord.C.fromPtr true) getAttributes_ self
    fun getAutoDir self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAutoDir_ self
    fun getBaseline self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getBaseline_ self
    fun getCharacterCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getCharacterCount_ self
    fun getContext self = (GObjectObjectClass.C.withPtr ---> PangoContextClass.C.fromPtr false) getContext_ self
    fun getCursorPos self index =
      let
        val strongPos
         & weakPos
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> PangoRectangleRecord.C.withNewPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true
                   && PangoRectangleRecord.C.fromPtr true
                   && I
          )
            getCursorPos_
            (
              self
               & index
               & ()
               & ()
            )
      in
        (strongPos, weakPos)
      end
    fun getEllipsize self = (GObjectObjectClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsize_ self
    fun getExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true
                   && PangoRectangleRecord.C.fromPtr true
                   && I
          )
            getExtents_
            (
              self
               & ()
               & ()
            )
      in
        (inkRect, logicalRect)
      end
    fun getFontDescription self = (GObjectObjectClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr false) getFontDescription_ self
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getHeight_ self
    fun getIndent self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getIndent_ self
    fun getIter self = (GObjectObjectClass.C.withPtr ---> PangoLayoutIterRecord.C.fromPtr true) getIter_ self
    fun getJustify self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getJustify_ self
    fun getLine self line = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> PangoLayoutLineRecord.C.fromPtr false) getLine_ (self & line)
    fun getLineCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getLineCount_ self
    fun getLineReadonly self line = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> PangoLayoutLineRecord.C.fromPtr false) getLineReadonly_ (self & line)
    fun getPixelExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true
                   && PangoRectangleRecord.C.fromPtr true
                   && I
          )
            getPixelExtents_
            (
              self
               & ()
               & ()
            )
      in
        (inkRect, logicalRect)
      end
    fun getPixelSize self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPixelSize_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (width, height)
      end
    fun getSingleParagraphMode self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSingleParagraphMode_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getSize_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (width, height)
      end
    fun getSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getSpacing_ self
    fun getTabs self = (GObjectObjectClass.C.withPtr ---> PangoTabArrayRecord.C.fromPtr true) getTabs_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getText_ self
    fun getUnknownGlyphsCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getUnknownGlyphsCount_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getWidth_ self
    fun getWrap self = (GObjectObjectClass.C.withPtr ---> PangoWrapMode.C.fromVal) getWrap_ self
    fun indexToLineX self index trailing =
      let
        val line
         & xPos
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Bool.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            indexToLineX_
            (
              self
               & index
               & trailing
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (line, xPos)
      end
    fun indexToPos self index =
      let
        val pos & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true && I
          )
            indexToPos_
            (
              self
               & index
               & ()
            )
      in
        pos
      end
    fun isEllipsized self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isEllipsized_ self
    fun isWrapped self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isWrapped_ self
    fun setAlignment self alignment = (GObjectObjectClass.C.withPtr &&&> PangoAlignment.C.withVal ---> I) setAlignment_ (self & alignment)
    fun setAutoDir self autoDir = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAutoDir_ (self & autoDir)
    fun setEllipsize self ellipsize = (GObjectObjectClass.C.withPtr &&&> PangoEllipsizeMode.C.withVal ---> I) setEllipsize_ (self & ellipsize)
    fun setFontDescription self desc = (GObjectObjectClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) setFontDescription_ (self & desc)
    fun setHeight self height = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setHeight_ (self & height)
    fun setIndent self indent = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setIndent_ (self & indent)
    fun setJustify self justify = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setJustify_ (self & justify)
    fun setMarkup self markup length =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setMarkup_
        (
          self
           & markup
           & length
        )
    fun setMarkupWithAccel self markup length accelMarker =
      let
        val accelChar & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.String.C.withConstPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Char.C.withVal
             &&&> FFI.Char.C.withRefVal
             ---> FFI.Char.C.fromVal && I
          )
            setMarkupWithAccel_
            (
              self
               & markup
               & length
               & accelMarker
               & FFI.Char.null
            )
      in
        accelChar
      end
    fun setSingleParagraphMode self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSingleParagraphMode_ (self & setting)
    fun setSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSpacing_ (self & spacing)
    fun setTabs self tabs = (GObjectObjectClass.C.withPtr &&&> PangoTabArrayRecord.C.withOptPtr ---> I) setTabs_ (self & tabs)
    fun setText self text length =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & length
        )
    fun setWidth self width = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setWidth_ (self & width)
    fun setWrap self wrap = (GObjectObjectClass.C.withPtr &&&> PangoWrapMode.C.withVal ---> I) setWrap_ (self & wrap)
    fun xyToIndex self x y =
      let
        val index
         & trailing
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            xyToIndex_
            (
              self
               & x
               & y
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        if retVal then SOME (index, trailing) else NONE
      end
  end
