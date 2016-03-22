structure PangoLayout :>
  PANGO_LAYOUT
    where type 'a class = 'a PangoLayoutClass.class
    where type attr_list_t = PangoAttrListRecord.t
    where type 'a context_class = 'a PangoContextClass.class
    where type layout_iter_t = PangoLayoutIterRecord.t
    where type layout_line_t = PangoLayoutLineRecord.t
    where type rectangle_t = PangoRectangleRecord.t
    where type alignment_t = PangoAlignment.t
    where type ellipsize_mode_t = PangoEllipsizeMode.t
    where type font_description_t = PangoFontDescriptionRecord.t
    where type tab_array_t = PangoTabArrayRecord.t
    where type wrap_mode_t = PangoWrapMode.t =
  struct
    val getType_ = _import "pango_layout_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "pango_layout_new" : PangoContextClass.C.notnull PangoContextClass.C.p -> PangoLayoutClass.C.notnull PangoLayoutClass.C.p;
    val contextChanged_ = _import "pango_layout_context_changed" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> unit;
    val copy_ = _import "pango_layout_copy" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> PangoLayoutClass.C.notnull PangoLayoutClass.C.p;
    val getAlignment_ = _import "pango_layout_get_alignment" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> PangoAlignment.C.val_;
    val getAttributes_ = _import "pango_layout_get_attributes" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p;
    val getAutoDir_ = _import "pango_layout_get_auto_dir" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Bool.C.val_;
    val getBaseline_ = _import "pango_layout_get_baseline" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Int32.C.val_;
    val getCharacterCount_ = _import "pango_layout_get_character_count" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Int32.C.val_;
    val getContext_ = _import "pango_layout_get_context" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> PangoContextClass.C.notnull PangoContextClass.C.p;
    val getCursorPos_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_layout_get_cursor_pos" :
              PangoLayoutClass.C.notnull PangoLayoutClass.C.p
               * FFI.Int32.C.val_
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
    val getEllipsize_ = _import "pango_layout_get_ellipsize" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> PangoEllipsizeMode.C.val_;
    val getExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_get_extents" :
              PangoLayoutClass.C.notnull PangoLayoutClass.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getFontDescription_ = _import "pango_layout_get_font_description" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;
    val getHeight_ = _import "pango_layout_get_height" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Int32.C.val_;
    val getIndent_ = _import "pango_layout_get_indent" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Int32.C.val_;
    val getIter_ = _import "pango_layout_get_iter" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> PangoLayoutIterRecord.C.notnull PangoLayoutIterRecord.C.p;
    val getJustify_ = _import "pango_layout_get_justify" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Bool.C.val_;
    val getLine_ = fn x1 & x2 => (_import "pango_layout_get_line" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * FFI.Int32.C.val_ -> PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p;) (x1, x2)
    val getLineCount_ = _import "pango_layout_get_line_count" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Int32.C.val_;
    val getLineReadonly_ = fn x1 & x2 => (_import "pango_layout_get_line_readonly" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * FFI.Int32.C.val_ -> PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p;) (x1, x2)
    val getPixelExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_get_pixel_extents" :
              PangoLayoutClass.C.notnull PangoLayoutClass.C.p
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
              PangoLayoutClass.C.notnull PangoLayoutClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSingleParagraphMode_ = _import "pango_layout_get_single_paragraph_mode" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Bool.C.val_;
    val getSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_get_size" :
              PangoLayoutClass.C.notnull PangoLayoutClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSpacing_ = _import "pango_layout_get_spacing" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Int32.C.val_;
    val getTabs_ = _import "pango_layout_get_tabs" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> PangoTabArrayRecord.C.notnull PangoTabArrayRecord.C.p;
    val getText_ = _import "pango_layout_get_text" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getUnknownGlyphsCount_ = _import "pango_layout_get_unknown_glyphs_count" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Int32.C.val_;
    val getWidth_ = _import "pango_layout_get_width" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Int32.C.val_;
    val getWrap_ = _import "pango_layout_get_wrap" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> PangoWrapMode.C.val_;
    val indexToLineX_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_layout_index_to_line_x" :
              PangoLayoutClass.C.notnull PangoLayoutClass.C.p
               * FFI.Int32.C.val_
               * FFI.Bool.C.val_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
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
              PangoLayoutClass.C.notnull PangoLayoutClass.C.p
               * FFI.Int32.C.val_
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val isEllipsized_ = _import "pango_layout_is_ellipsized" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Bool.C.val_;
    val isWrapped_ = _import "pango_layout_is_wrapped" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p -> FFI.Bool.C.val_;
    val setAlignment_ = fn x1 & x2 => (_import "pango_layout_set_alignment" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * PangoAlignment.C.val_ -> unit;) (x1, x2)
    val setAutoDir_ = fn x1 & x2 => (_import "pango_layout_set_auto_dir" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setEllipsize_ = fn x1 & x2 => (_import "pango_layout_set_ellipsize" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * PangoEllipsizeMode.C.val_ -> unit;) (x1, x2)
    val setFontDescription_ = fn x1 & x2 => (_import "pango_layout_set_font_description" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * unit PangoFontDescriptionRecord.C.p -> unit;) (x1, x2)
    val setHeight_ = fn x1 & x2 => (_import "pango_layout_set_height" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setIndent_ = fn x1 & x2 => (_import "pango_layout_set_indent" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setJustify_ = fn x1 & x2 => (_import "pango_layout_set_justify" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setMarkup_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_layout_set_markup" :
              PangoLayoutClass.C.notnull PangoLayoutClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
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
              PangoLayoutClass.C.notnull PangoLayoutClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
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
    val setSingleParagraphMode_ = fn x1 & x2 => (_import "pango_layout_set_single_paragraph_mode" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "pango_layout_set_spacing" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setTabs_ = fn x1 & x2 => (_import "pango_layout_set_tabs" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * unit PangoTabArrayRecord.C.p -> unit;) (x1, x2)
    val setText_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_layout_set_text" :
              PangoLayoutClass.C.notnull PangoLayoutClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setWidth_ = fn x1 & x2 => (_import "pango_layout_set_width" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setWrap_ = fn x1 & x2 => (_import "pango_layout_set_wrap" : PangoLayoutClass.C.notnull PangoLayoutClass.C.p * PangoWrapMode.C.val_ -> unit;) (x1, x2)
    val xyToIndex_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_layout_xy_to_index" :
              PangoLayoutClass.C.notnull PangoLayoutClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class = 'a PangoLayoutClass.class
    type attr_list_t = PangoAttrListRecord.t
    type 'a context_class = 'a PangoContextClass.class
    type layout_iter_t = PangoLayoutIterRecord.t
    type layout_line_t = PangoLayoutLineRecord.t
    type rectangle_t = PangoRectangleRecord.t
    type alignment_t = PangoAlignment.t
    type ellipsize_mode_t = PangoEllipsizeMode.t
    type font_description_t = PangoFontDescriptionRecord.t
    type tab_array_t = PangoTabArrayRecord.t
    type wrap_mode_t = PangoWrapMode.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new context = (PangoContextClass.C.withPtr ---> PangoLayoutClass.C.fromPtr true) new_ context
    fun contextChanged self = (PangoLayoutClass.C.withPtr ---> I) contextChanged_ self
    fun copy self = (PangoLayoutClass.C.withPtr ---> PangoLayoutClass.C.fromPtr true) copy_ self
    fun getAlignment self = (PangoLayoutClass.C.withPtr ---> PangoAlignment.C.fromVal) getAlignment_ self
    fun getAttributes self = (PangoLayoutClass.C.withPtr ---> PangoAttrListRecord.C.fromPtr true) getAttributes_ self
    fun getAutoDir self = (PangoLayoutClass.C.withPtr ---> FFI.Bool.C.fromVal) getAutoDir_ self
    fun getBaseline self = (PangoLayoutClass.C.withPtr ---> FFI.Int32.C.fromVal) getBaseline_ self
    fun getCharacterCount self = (PangoLayoutClass.C.withPtr ---> FFI.Int32.C.fromVal) getCharacterCount_ self
    fun getContext self = (PangoLayoutClass.C.withPtr ---> PangoContextClass.C.fromPtr false) getContext_ self
    fun getCursorPos self index =
      let
        val strongPos
         & weakPos
         & () =
          (
            PangoLayoutClass.C.withPtr
             &&&> FFI.Int32.C.withVal
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
    fun getEllipsize self = (PangoLayoutClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsize_ self
    fun getExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutClass.C.withPtr
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
    fun getFontDescription self = (PangoLayoutClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr false) getFontDescription_ self
    fun getHeight self = (PangoLayoutClass.C.withPtr ---> FFI.Int32.C.fromVal) getHeight_ self
    fun getIndent self = (PangoLayoutClass.C.withPtr ---> FFI.Int32.C.fromVal) getIndent_ self
    fun getIter self = (PangoLayoutClass.C.withPtr ---> PangoLayoutIterRecord.C.fromPtr true) getIter_ self
    fun getJustify self = (PangoLayoutClass.C.withPtr ---> FFI.Bool.C.fromVal) getJustify_ self
    fun getLine self line = (PangoLayoutClass.C.withPtr &&&> FFI.Int32.C.withVal ---> PangoLayoutLineRecord.C.fromPtr false) getLine_ (self & line)
    fun getLineCount self = (PangoLayoutClass.C.withPtr ---> FFI.Int32.C.fromVal) getLineCount_ self
    fun getLineReadonly self line = (PangoLayoutClass.C.withPtr &&&> FFI.Int32.C.withVal ---> PangoLayoutLineRecord.C.fromPtr false) getLineReadonly_ (self & line)
    fun getPixelExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutClass.C.withPtr
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
            PangoLayoutClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPixelSize_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (width, height)
      end
    fun getSingleParagraphMode self = (PangoLayoutClass.C.withPtr ---> FFI.Bool.C.fromVal) getSingleParagraphMode_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            PangoLayoutClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getSize_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (width, height)
      end
    fun getSpacing self = (PangoLayoutClass.C.withPtr ---> FFI.Int32.C.fromVal) getSpacing_ self
    fun getTabs self = (PangoLayoutClass.C.withPtr ---> PangoTabArrayRecord.C.fromPtr true) getTabs_ self
    fun getText self = (PangoLayoutClass.C.withPtr ---> Utf8.C.fromPtr false) getText_ self
    fun getUnknownGlyphsCount self = (PangoLayoutClass.C.withPtr ---> FFI.Int32.C.fromVal) getUnknownGlyphsCount_ self
    fun getWidth self = (PangoLayoutClass.C.withPtr ---> FFI.Int32.C.fromVal) getWidth_ self
    fun getWrap self = (PangoLayoutClass.C.withPtr ---> PangoWrapMode.C.fromVal) getWrap_ self
    fun indexToLineX self index trailing =
      let
        val line
         & xPos
         & () =
          (
            PangoLayoutClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Bool.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            indexToLineX_
            (
              self
               & index
               & trailing
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (line, xPos)
      end
    fun indexToPos self index =
      let
        val pos & () =
          (
            PangoLayoutClass.C.withPtr
             &&&> FFI.Int32.C.withVal
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
    fun isEllipsized self = (PangoLayoutClass.C.withPtr ---> FFI.Bool.C.fromVal) isEllipsized_ self
    fun isWrapped self = (PangoLayoutClass.C.withPtr ---> FFI.Bool.C.fromVal) isWrapped_ self
    fun setAlignment self alignment = (PangoLayoutClass.C.withPtr &&&> PangoAlignment.C.withVal ---> I) setAlignment_ (self & alignment)
    fun setAutoDir self autoDir = (PangoLayoutClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAutoDir_ (self & autoDir)
    fun setEllipsize self ellipsize = (PangoLayoutClass.C.withPtr &&&> PangoEllipsizeMode.C.withVal ---> I) setEllipsize_ (self & ellipsize)
    fun setFontDescription self desc = (PangoLayoutClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) setFontDescription_ (self & desc)
    fun setHeight self height = (PangoLayoutClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setHeight_ (self & height)
    fun setIndent self indent = (PangoLayoutClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setIndent_ (self & indent)
    fun setJustify self justify = (PangoLayoutClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setJustify_ (self & justify)
    fun setMarkup self markup length =
      (
        PangoLayoutClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
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
            PangoLayoutClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> FFI.Int32.C.withVal
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
    fun setSingleParagraphMode self setting = (PangoLayoutClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSingleParagraphMode_ (self & setting)
    fun setSpacing self spacing = (PangoLayoutClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSpacing_ (self & spacing)
    fun setTabs self tabs = (PangoLayoutClass.C.withPtr &&&> PangoTabArrayRecord.C.withOptPtr ---> I) setTabs_ (self & tabs)
    fun setText self text length =
      (
        PangoLayoutClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & length
        )
    fun setWidth self width = (PangoLayoutClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setWidth_ (self & width)
    fun setWrap self wrap = (PangoLayoutClass.C.withPtr &&&> PangoWrapMode.C.withVal ---> I) setWrap_ (self & wrap)
    fun xyToIndex self x y =
      let
        val index
         & trailing
         & retVal =
          (
            PangoLayoutClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            xyToIndex_
            (
              self
               & x
               & y
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        if retVal then SOME (index, trailing) else NONE
      end
  end
