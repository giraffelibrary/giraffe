structure PangoLayout :>
  PANGO_LAYOUT
    where type 'a class = 'a PangoLayoutClass.class
    where type attr_list_t = PangoAttrListRecord.t
    where type 'a context_class = 'a PangoContextClass.class
    where type layout_iter_t = PangoLayoutIterRecord.t
    where type layout_line_t = PangoLayoutLineRecord.t
    where type log_attr_t = PangoLogAttrRecord.t
    where type rectangle_t = PangoRectangleRecord.t
    where type alignment_t = PangoAlignment.t
    where type ellipsize_mode_t = PangoEllipsizeMode.t
    where type font_description_t = PangoFontDescriptionRecord.t
    where type tab_array_t = PangoTabArrayRecord.t
    where type wrap_mode_t = PangoWrapMode.t =
  struct
    structure PangoLogAttrRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = PangoLogAttrRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure PangoLogAttrRecordCVectorN = CVectorN(PangoLogAttrRecordCVectorNType)
    val getType_ = _import "pango_layout_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "pango_layout_new" : PangoContextClass.FFI.notnull PangoContextClass.FFI.p -> PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p;
    val contextChanged_ = _import "pango_layout_context_changed" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> unit;
    val copy_ = _import "pango_layout_copy" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p;
    val getAlignment_ = _import "pango_layout_get_alignment" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> PangoAlignment.FFI.val_;
    val getAttributes_ = _import "pango_layout_get_attributes" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> PangoAttrListRecord.FFI.notnull PangoAttrListRecord.FFI.p;
    val getAutoDir_ = _import "pango_layout_get_auto_dir" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GBool.FFI.val_;
    val getBaseline_ = _import "pango_layout_get_baseline" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GInt32.FFI.val_;
    val getCharacterCount_ = _import "pango_layout_get_character_count" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GInt32.FFI.val_;
    val getContext_ = _import "pango_layout_get_context" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> PangoContextClass.FFI.notnull PangoContextClass.FFI.p;
    val getCursorPos_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_layout_get_cursor_pos" :
              PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * GInt32.FFI.val_
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
    val getEllipsize_ = _import "pango_layout_get_ellipsize" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> PangoEllipsizeMode.FFI.val_;
    val getExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_get_extents" :
              PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getFontDescription_ = _import "pango_layout_get_font_description" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p;
    val getHeight_ = _import "pango_layout_get_height" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GInt32.FFI.val_;
    val getIndent_ = _import "pango_layout_get_indent" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GInt32.FFI.val_;
    val getIter_ = _import "pango_layout_get_iter" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> PangoLayoutIterRecord.FFI.notnull PangoLayoutIterRecord.FFI.p;
    val getJustify_ = _import "pango_layout_get_justify" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GBool.FFI.val_;
    val getLine_ = fn x1 & x2 => (_import "pango_layout_get_line" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * GInt32.FFI.val_ -> PangoLayoutLineRecord.FFI.notnull PangoLayoutLineRecord.FFI.p;) (x1, x2)
    val getLineCount_ = _import "pango_layout_get_line_count" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GInt32.FFI.val_;
    val getLineReadonly_ = fn x1 & x2 => (_import "pango_layout_get_line_readonly" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * GInt32.FFI.val_ -> PangoLayoutLineRecord.FFI.notnull PangoLayoutLineRecord.FFI.p;) (x1, x2)
    val getLogAttrs_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_layout_get_log_attrs" :
              PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * PangoLogAttrRecordCVectorN.MLton.r1
               * (unit, PangoLogAttrRecordCVectorN.FFI.notnull) PangoLogAttrRecordCVectorN.MLton.r2
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getPixelExtents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_get_pixel_extents" :
              PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
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
              PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSingleParagraphMode_ = _import "pango_layout_get_single_paragraph_mode" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GBool.FFI.val_;
    val getSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_layout_get_size" :
              PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSpacing_ = _import "pango_layout_get_spacing" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GInt32.FFI.val_;
    val getTabs_ = _import "pango_layout_get_tabs" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> PangoTabArrayRecord.FFI.notnull PangoTabArrayRecord.FFI.p;
    val getText_ = _import "pango_layout_get_text" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUnknownGlyphsCount_ = _import "pango_layout_get_unknown_glyphs_count" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GInt32.FFI.val_;
    val getWidth_ = _import "pango_layout_get_width" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GInt32.FFI.val_;
    val getWrap_ = _import "pango_layout_get_wrap" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> PangoWrapMode.FFI.val_;
    val indexToLineX_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_layout_index_to_line_x" :
              PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * GInt32.FFI.val_
               * GBool.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * GInt32.FFI.val_
               * PangoRectangleRecord.FFI.notnull PangoRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val isEllipsized_ = _import "pango_layout_is_ellipsized" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GBool.FFI.val_;
    val isWrapped_ = _import "pango_layout_is_wrapped" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p -> GBool.FFI.val_;
    val setAlignment_ = fn x1 & x2 => (_import "pango_layout_set_alignment" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * PangoAlignment.FFI.val_ -> unit;) (x1, x2)
    val setAutoDir_ = fn x1 & x2 => (_import "pango_layout_set_auto_dir" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setEllipsize_ = fn x1 & x2 => (_import "pango_layout_set_ellipsize" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * PangoEllipsizeMode.FFI.val_ -> unit;) (x1, x2)
    val setFontDescription_ = fn x1 & x2 => (_import "pango_layout_set_font_description" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * unit PangoFontDescriptionRecord.FFI.p -> unit;) (x1, x2)
    val setHeight_ = fn x1 & x2 => (_import "pango_layout_set_height" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setIndent_ = fn x1 & x2 => (_import "pango_layout_set_indent" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setJustify_ = fn x1 & x2 => (_import "pango_layout_set_justify" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMarkup_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_layout_set_markup" :
              PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
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
              PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               * GChar.FFI.val_
               * GChar.FFI.ref_
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
    val setSingleParagraphMode_ = fn x1 & x2 => (_import "pango_layout_set_single_paragraph_mode" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "pango_layout_set_spacing" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setTabs_ = fn x1 & x2 => (_import "pango_layout_set_tabs" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * unit PangoTabArrayRecord.FFI.p -> unit;) (x1, x2)
    val setText_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_pango_layout_set_text" :
              PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setWidth_ = fn x1 & x2 => (_import "pango_layout_set_width" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setWrap_ = fn x1 & x2 => (_import "pango_layout_set_wrap" : PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p * PangoWrapMode.FFI.val_ -> unit;) (x1, x2)
    val xyToIndex_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_layout_xy_to_index" :
              PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
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
    type log_attr_t = PangoLogAttrRecord.t
    type rectangle_t = PangoRectangleRecord.t
    type alignment_t = PangoAlignment.t
    type ellipsize_mode_t = PangoEllipsizeMode.t
    type font_description_t = PangoFontDescriptionRecord.t
    type tab_array_t = PangoTabArrayRecord.t
    type wrap_mode_t = PangoWrapMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new context = (PangoContextClass.FFI.withPtr ---> PangoLayoutClass.FFI.fromPtr true) new_ context
    fun contextChanged self = (PangoLayoutClass.FFI.withPtr ---> I) contextChanged_ self
    fun copy self = (PangoLayoutClass.FFI.withPtr ---> PangoLayoutClass.FFI.fromPtr true) copy_ self
    fun getAlignment self = (PangoLayoutClass.FFI.withPtr ---> PangoAlignment.FFI.fromVal) getAlignment_ self
    fun getAttributes self = (PangoLayoutClass.FFI.withPtr ---> PangoAttrListRecord.FFI.fromPtr true) getAttributes_ self
    fun getAutoDir self = (PangoLayoutClass.FFI.withPtr ---> GBool.FFI.fromVal) getAutoDir_ self
    fun getBaseline self = (PangoLayoutClass.FFI.withPtr ---> GInt32.FFI.fromVal) getBaseline_ self
    fun getCharacterCount self = (PangoLayoutClass.FFI.withPtr ---> GInt32.FFI.fromVal) getCharacterCount_ self
    fun getContext self = (PangoLayoutClass.FFI.withPtr ---> PangoContextClass.FFI.fromPtr false) getContext_ self
    fun getCursorPos self index =
      let
        val strongPos
         & weakPos
         & () =
          (
            PangoLayoutClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> PangoRectangleRecord.FFI.withNewPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true
                   && PangoRectangleRecord.FFI.fromPtr true
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
    fun getEllipsize self = (PangoLayoutClass.FFI.withPtr ---> PangoEllipsizeMode.FFI.fromVal) getEllipsize_ self
    fun getExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutClass.FFI.withPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true
                   && PangoRectangleRecord.FFI.fromPtr true
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
    fun getFontDescription self = (PangoLayoutClass.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFontDescription_ self
    fun getHeight self = (PangoLayoutClass.FFI.withPtr ---> GInt32.FFI.fromVal) getHeight_ self
    fun getIndent self = (PangoLayoutClass.FFI.withPtr ---> GInt32.FFI.fromVal) getIndent_ self
    fun getIter self = (PangoLayoutClass.FFI.withPtr ---> PangoLayoutIterRecord.FFI.fromPtr true) getIter_ self
    fun getJustify self = (PangoLayoutClass.FFI.withPtr ---> GBool.FFI.fromVal) getJustify_ self
    fun getLine self line = (PangoLayoutClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> PangoLayoutLineRecord.FFI.fromPtr false) getLine_ (self & line)
    fun getLineCount self = (PangoLayoutClass.FFI.withPtr ---> GInt32.FFI.fromVal) getLineCount_ self
    fun getLineReadonly self line = (PangoLayoutClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> PangoLayoutLineRecord.FFI.fromPtr false) getLineReadonly_ (self & line)
    fun getLogAttrs self =
      let
        val attrs
         & nAttrs
         & () =
          (
            PangoLayoutClass.FFI.withPtr
             &&&> PangoLogAttrRecordCVectorN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> PangoLogAttrRecordCVectorN.FFI.fromPtr 1
                   && GInt32.FFI.fromVal
                   && I
          )
            getLogAttrs_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        attrs (LargeInt.toInt nAttrs)
      end
    fun getPixelExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutClass.FFI.withPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true
                   && PangoRectangleRecord.FFI.fromPtr true
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
            PangoLayoutClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPixelSize_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (width, height)
      end
    fun getSingleParagraphMode self = (PangoLayoutClass.FFI.withPtr ---> GBool.FFI.fromVal) getSingleParagraphMode_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            PangoLayoutClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getSize_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (width, height)
      end
    fun getSpacing self = (PangoLayoutClass.FFI.withPtr ---> GInt32.FFI.fromVal) getSpacing_ self
    fun getTabs self = (PangoLayoutClass.FFI.withPtr ---> PangoTabArrayRecord.FFI.fromPtr true) getTabs_ self
    fun getText self = (PangoLayoutClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getText_ self
    fun getUnknownGlyphsCount self = (PangoLayoutClass.FFI.withPtr ---> GInt32.FFI.fromVal) getUnknownGlyphsCount_ self
    fun getWidth self = (PangoLayoutClass.FFI.withPtr ---> GInt32.FFI.fromVal) getWidth_ self
    fun getWrap self = (PangoLayoutClass.FFI.withPtr ---> PangoWrapMode.FFI.fromVal) getWrap_ self
    fun indexToLineX self (index, trailing) =
      let
        val line
         & xPos
         & () =
          (
            PangoLayoutClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            indexToLineX_
            (
              self
               & index
               & trailing
               & GInt32.null
               & GInt32.null
            )
      in
        (line, xPos)
      end
    fun indexToPos self index =
      let
        val pos & () =
          (
            PangoLayoutClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> PangoRectangleRecord.FFI.withNewPtr
             ---> PangoRectangleRecord.FFI.fromPtr true && I
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
    fun isEllipsized self = (PangoLayoutClass.FFI.withPtr ---> GBool.FFI.fromVal) isEllipsized_ self
    fun isWrapped self = (PangoLayoutClass.FFI.withPtr ---> GBool.FFI.fromVal) isWrapped_ self
    fun setAlignment self alignment = (PangoLayoutClass.FFI.withPtr &&&> PangoAlignment.FFI.withVal ---> I) setAlignment_ (self & alignment)
    fun setAutoDir self autoDir = (PangoLayoutClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAutoDir_ (self & autoDir)
    fun setEllipsize self ellipsize = (PangoLayoutClass.FFI.withPtr &&&> PangoEllipsizeMode.FFI.withVal ---> I) setEllipsize_ (self & ellipsize)
    fun setFontDescription self desc = (PangoLayoutClass.FFI.withPtr &&&> PangoFontDescriptionRecord.FFI.withOptPtr ---> I) setFontDescription_ (self & desc)
    fun setHeight self height = (PangoLayoutClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setHeight_ (self & height)
    fun setIndent self indent = (PangoLayoutClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setIndent_ (self & indent)
    fun setJustify self justify = (PangoLayoutClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setJustify_ (self & justify)
    fun setMarkup self (markup, length) =
      (
        PangoLayoutClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setMarkup_
        (
          self
           & markup
           & length
        )
    fun setMarkupWithAccel
      self
      (
        markup,
        length,
        accelMarker
      ) =
      let
        val accelChar & () =
          (
            PangoLayoutClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GChar.FFI.withVal
             &&&> GChar.FFI.withRefVal
             ---> GChar.FFI.fromVal && I
          )
            setMarkupWithAccel_
            (
              self
               & markup
               & length
               & accelMarker
               & GChar.null
            )
      in
        accelChar
      end
    fun setSingleParagraphMode self setting = (PangoLayoutClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSingleParagraphMode_ (self & setting)
    fun setSpacing self spacing = (PangoLayoutClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setSpacing_ (self & spacing)
    fun setTabs self tabs = (PangoLayoutClass.FFI.withPtr &&&> PangoTabArrayRecord.FFI.withOptPtr ---> I) setTabs_ (self & tabs)
    fun setText self (text, length) =
      (
        PangoLayoutClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & length
        )
    fun setWidth self width = (PangoLayoutClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setWidth_ (self & width)
    fun setWrap self wrap = (PangoLayoutClass.FFI.withPtr &&&> PangoWrapMode.FFI.withVal ---> I) setWrap_ (self & wrap)
    fun xyToIndex self (x, y) =
      let
        val index
         & trailing
         & retVal =
          (
            PangoLayoutClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            xyToIndex_
            (
              self
               & x
               & y
               & GInt32.null
               & GInt32.null
            )
      in
        if retVal then SOME (index, trailing) else NONE
      end
  end
