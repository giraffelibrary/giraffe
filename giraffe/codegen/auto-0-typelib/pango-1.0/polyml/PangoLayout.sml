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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_layout_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_layout_new") (PangoContextClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val contextChanged_ = call (getSymbol "pango_layout_context_changed") (PangoLayoutClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val copy_ = call (getSymbol "pango_layout_copy") (PangoLayoutClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getAlignment_ = call (getSymbol "pango_layout_get_alignment") (PangoLayoutClass.PolyML.cPtr --> PangoAlignment.PolyML.cVal)
      val getAttributes_ = call (getSymbol "pango_layout_get_attributes") (PangoLayoutClass.PolyML.cPtr --> PangoAttrListRecord.PolyML.cPtr)
      val getAutoDir_ = call (getSymbol "pango_layout_get_auto_dir") (PangoLayoutClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBaseline_ = call (getSymbol "pango_layout_get_baseline") (PangoLayoutClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getCharacterCount_ = call (getSymbol "pango_layout_get_character_count") (PangoLayoutClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getContext_ = call (getSymbol "pango_layout_get_context") (PangoLayoutClass.PolyML.cPtr --> PangoContextClass.PolyML.cPtr)
      val getCursorPos_ =
        call (getSymbol "pango_layout_get_cursor_pos")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getEllipsize_ = call (getSymbol "pango_layout_get_ellipsize") (PangoLayoutClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getExtents_ =
        call (getSymbol "pango_layout_get_extents")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getFontDescription_ = call (getSymbol "pango_layout_get_font_description") (PangoLayoutClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getHeight_ = call (getSymbol "pango_layout_get_height") (PangoLayoutClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getIndent_ = call (getSymbol "pango_layout_get_indent") (PangoLayoutClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getIter_ = call (getSymbol "pango_layout_get_iter") (PangoLayoutClass.PolyML.cPtr --> PangoLayoutIterRecord.PolyML.cPtr)
      val getJustify_ = call (getSymbol "pango_layout_get_justify") (PangoLayoutClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLine_ = call (getSymbol "pango_layout_get_line") (PangoLayoutClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> PangoLayoutLineRecord.PolyML.cPtr)
      val getLineCount_ = call (getSymbol "pango_layout_get_line_count") (PangoLayoutClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getLineReadonly_ = call (getSymbol "pango_layout_get_line_readonly") (PangoLayoutClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> PangoLayoutLineRecord.PolyML.cPtr)
      val getLogAttrs_ =
        call (getSymbol "pango_layout_get_log_attrs")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> PangoLogAttrRecordCVectorN.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getPixelExtents_ =
        call (getSymbol "pango_layout_get_pixel_extents")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getPixelSize_ =
        call (getSymbol "pango_layout_get_pixel_size")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getSingleParagraphMode_ = call (getSymbol "pango_layout_get_single_paragraph_mode") (PangoLayoutClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSize_ =
        call (getSymbol "pango_layout_get_size")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getSpacing_ = call (getSymbol "pango_layout_get_spacing") (PangoLayoutClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getTabs_ = call (getSymbol "pango_layout_get_tabs") (PangoLayoutClass.PolyML.cPtr --> PangoTabArrayRecord.PolyML.cPtr)
      val getText_ = call (getSymbol "pango_layout_get_text") (PangoLayoutClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUnknownGlyphsCount_ = call (getSymbol "pango_layout_get_unknown_glyphs_count") (PangoLayoutClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getWidth_ = call (getSymbol "pango_layout_get_width") (PangoLayoutClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getWrap_ = call (getSymbol "pango_layout_get_wrap") (PangoLayoutClass.PolyML.cPtr --> PangoWrapMode.PolyML.cVal)
      val indexToLineX_ =
        call (getSymbol "pango_layout_index_to_line_x")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val indexToPos_ =
        call (getSymbol "pango_layout_index_to_pos")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val isEllipsized_ = call (getSymbol "pango_layout_is_ellipsized") (PangoLayoutClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isWrapped_ = call (getSymbol "pango_layout_is_wrapped") (PangoLayoutClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAlignment_ = call (getSymbol "pango_layout_set_alignment") (PangoLayoutClass.PolyML.cPtr &&> PangoAlignment.PolyML.cVal --> PolyMLFFI.cVoid)
      val setAutoDir_ = call (getSymbol "pango_layout_set_auto_dir") (PangoLayoutClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setEllipsize_ = call (getSymbol "pango_layout_set_ellipsize") (PangoLayoutClass.PolyML.cPtr &&> PangoEllipsizeMode.PolyML.cVal --> PolyMLFFI.cVoid)
      val setFontDescription_ = call (getSymbol "pango_layout_set_font_description") (PangoLayoutClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setHeight_ = call (getSymbol "pango_layout_set_height") (PangoLayoutClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setIndent_ = call (getSymbol "pango_layout_set_indent") (PangoLayoutClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setJustify_ = call (getSymbol "pango_layout_set_justify") (PangoLayoutClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setMarkup_ =
        call (getSymbol "pango_layout_set_markup")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setMarkupWithAccel_ =
        call (getSymbol "pango_layout_set_markup_with_accel")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GChar.PolyML.cVal
             &&> GChar.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val setSingleParagraphMode_ = call (getSymbol "pango_layout_set_single_paragraph_mode") (PangoLayoutClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSpacing_ = call (getSymbol "pango_layout_set_spacing") (PangoLayoutClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTabs_ = call (getSymbol "pango_layout_set_tabs") (PangoLayoutClass.PolyML.cPtr &&> PangoTabArrayRecord.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setText_ =
        call (getSymbol "pango_layout_set_text")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setWidth_ = call (getSymbol "pango_layout_set_width") (PangoLayoutClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setWrap_ = call (getSymbol "pango_layout_set_wrap") (PangoLayoutClass.PolyML.cPtr &&> PangoWrapMode.PolyML.cVal --> PolyMLFFI.cVoid)
      val xyToIndex_ =
        call (getSymbol "pango_layout_xy_to_index")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
    end
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
    fun indexToLineX self index trailing =
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
    fun setMarkup self markup length =
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
    fun setMarkupWithAccel self markup length accelMarker =
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
    fun setText self text length =
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
    fun xyToIndex self x y =
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
