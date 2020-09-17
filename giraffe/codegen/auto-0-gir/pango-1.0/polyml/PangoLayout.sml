structure PangoLayout :>
  PANGO_LAYOUT
    where type 'a class = 'a PangoLayoutClass.class
    where type 'a context_class = 'a PangoContextClass.class
    where type layout_iter_t = PangoLayoutIterRecord.t
    where type layout_line_t = PangoLayoutLineRecord.t
    where type log_attr_record_c_array_n_t = PangoLogAttrRecordCArrayN.t
    where type rectangle_t = PangoRectangleRecord.t
    where type alignment_t = PangoAlignment.t
    where type attr_list_t = PangoAttrListRecord.t
    where type ellipsize_mode_t = PangoEllipsizeMode.t
    where type font_description_t = PangoFontDescriptionRecord.t
    where type tab_array_t = PangoTabArrayRecord.t
    where type wrap_mode_t = PangoWrapMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_layout_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "pango_layout_new") (PangoContextClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val contextChanged_ = call (getSymbol "pango_layout_context_changed") (PangoLayoutClass.PolyML.cPtr --> cVoid)
      val copy_ = call (getSymbol "pango_layout_copy") (PangoLayoutClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getAlignment_ = call (getSymbol "pango_layout_get_alignment") (PangoLayoutClass.PolyML.cPtr --> PangoAlignment.PolyML.cVal)
      val getAttributes_ = call (getSymbol "pango_layout_get_attributes") (PangoLayoutClass.PolyML.cPtr --> PangoAttrListRecord.PolyML.cPtr)
      val getAutoDir_ = call (getSymbol "pango_layout_get_auto_dir") (PangoLayoutClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBaseline_ = call (getSymbol "pango_layout_get_baseline") (PangoLayoutClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getCharacterCount_ = call (getSymbol "pango_layout_get_character_count") (PangoLayoutClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getContext_ = call (getSymbol "pango_layout_get_context") (PangoLayoutClass.PolyML.cPtr --> PangoContextClass.PolyML.cPtr)
      val getCursorPos_ =
        call (getSymbol "pango_layout_get_cursor_pos")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getEllipsize_ = call (getSymbol "pango_layout_get_ellipsize") (PangoLayoutClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getExtents_ =
        call (getSymbol "pango_layout_get_extents")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getFontDescription_ = call (getSymbol "pango_layout_get_font_description") (PangoLayoutClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cOptPtr)
      val getHeight_ = call (getSymbol "pango_layout_get_height") (PangoLayoutClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getIndent_ = call (getSymbol "pango_layout_get_indent") (PangoLayoutClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getIter_ = call (getSymbol "pango_layout_get_iter") (PangoLayoutClass.PolyML.cPtr --> PangoLayoutIterRecord.PolyML.cPtr)
      val getJustify_ = call (getSymbol "pango_layout_get_justify") (PangoLayoutClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLine_ = call (getSymbol "pango_layout_get_line") (PangoLayoutClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PangoLayoutLineRecord.PolyML.cOptPtr)
      val getLineCount_ = call (getSymbol "pango_layout_get_line_count") (PangoLayoutClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getLineReadonly_ = call (getSymbol "pango_layout_get_line_readonly") (PangoLayoutClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PangoLayoutLineRecord.PolyML.cOptPtr)
      val getLogAttrs_ =
        call (getSymbol "pango_layout_get_log_attrs")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> PangoLogAttrRecordCArrayN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getLogAttrsReadonly_ = call (getSymbol "pango_layout_get_log_attrs_readonly") (PangoLayoutClass.PolyML.cPtr &&> GInt.PolyML.cRef --> PangoLogAttrRecordCArrayN.PolyML.cOutPtr)
      val getPixelExtents_ =
        call (getSymbol "pango_layout_get_pixel_extents")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getPixelSize_ =
        call (getSymbol "pango_layout_get_pixel_size")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getSerial_ = call (getSymbol "pango_layout_get_serial") (PangoLayoutClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getSingleParagraphMode_ = call (getSymbol "pango_layout_get_single_paragraph_mode") (PangoLayoutClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSize_ =
        call (getSymbol "pango_layout_get_size")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getSpacing_ = call (getSymbol "pango_layout_get_spacing") (PangoLayoutClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getTabs_ = call (getSymbol "pango_layout_get_tabs") (PangoLayoutClass.PolyML.cPtr --> PangoTabArrayRecord.PolyML.cOptPtr)
      val getText_ = call (getSymbol "pango_layout_get_text") (PangoLayoutClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUnknownGlyphsCount_ = call (getSymbol "pango_layout_get_unknown_glyphs_count") (PangoLayoutClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getWidth_ = call (getSymbol "pango_layout_get_width") (PangoLayoutClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getWrap_ = call (getSymbol "pango_layout_get_wrap") (PangoLayoutClass.PolyML.cPtr --> PangoWrapMode.PolyML.cVal)
      val indexToLineX_ =
        call (getSymbol "pango_layout_index_to_line_x")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val indexToPos_ =
        call (getSymbol "pango_layout_index_to_pos")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> PangoRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val isEllipsized_ = call (getSymbol "pango_layout_is_ellipsized") (PangoLayoutClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isWrapped_ = call (getSymbol "pango_layout_is_wrapped") (PangoLayoutClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val moveCursorVisually_ =
        call (getSymbol "pango_layout_move_cursor_visually")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val setAlignment_ = call (getSymbol "pango_layout_set_alignment") (PangoLayoutClass.PolyML.cPtr &&> PangoAlignment.PolyML.cVal --> cVoid)
      val setAttributes_ = call (getSymbol "pango_layout_set_attributes") (PangoLayoutClass.PolyML.cPtr &&> PangoAttrListRecord.PolyML.cOptPtr --> cVoid)
      val setAutoDir_ = call (getSymbol "pango_layout_set_auto_dir") (PangoLayoutClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setEllipsize_ = call (getSymbol "pango_layout_set_ellipsize") (PangoLayoutClass.PolyML.cPtr &&> PangoEllipsizeMode.PolyML.cVal --> cVoid)
      val setFontDescription_ = call (getSymbol "pango_layout_set_font_description") (PangoLayoutClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> cVoid)
      val setHeight_ = call (getSymbol "pango_layout_set_height") (PangoLayoutClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setIndent_ = call (getSymbol "pango_layout_set_indent") (PangoLayoutClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setJustify_ = call (getSymbol "pango_layout_set_justify") (PangoLayoutClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMarkup_ =
        call (getSymbol "pango_layout_set_markup")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setMarkupWithAccel_ =
        call (getSymbol "pango_layout_set_markup_with_accel")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GChar.PolyML.cVal
             &&> GChar.PolyML.cRef
             --> cVoid
          )
      val setSingleParagraphMode_ = call (getSymbol "pango_layout_set_single_paragraph_mode") (PangoLayoutClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSpacing_ = call (getSymbol "pango_layout_set_spacing") (PangoLayoutClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setTabs_ = call (getSymbol "pango_layout_set_tabs") (PangoLayoutClass.PolyML.cPtr &&> PangoTabArrayRecord.PolyML.cOptPtr --> cVoid)
      val setText_ =
        call (getSymbol "pango_layout_set_text")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setWidth_ = call (getSymbol "pango_layout_set_width") (PangoLayoutClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setWrap_ = call (getSymbol "pango_layout_set_wrap") (PangoLayoutClass.PolyML.cPtr &&> PangoWrapMode.PolyML.cVal --> cVoid)
      val xyToIndex_ =
        call (getSymbol "pango_layout_xy_to_index")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a PangoLayoutClass.class
    type 'a context_class = 'a PangoContextClass.class
    type layout_iter_t = PangoLayoutIterRecord.t
    type layout_line_t = PangoLayoutLineRecord.t
    type log_attr_record_c_array_n_t = PangoLogAttrRecordCArrayN.t
    type rectangle_t = PangoRectangleRecord.t
    type alignment_t = PangoAlignment.t
    type attr_list_t = PangoAttrListRecord.t
    type ellipsize_mode_t = PangoEllipsizeMode.t
    type font_description_t = PangoFontDescriptionRecord.t
    type tab_array_t = PangoTabArrayRecord.t
    type wrap_mode_t = PangoWrapMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new context = (PangoContextClass.FFI.withPtr false ---> PangoLayoutClass.FFI.fromPtr true) new_ context
    fun contextChanged self = (PangoLayoutClass.FFI.withPtr false ---> I) contextChanged_ self
    fun copy self = (PangoLayoutClass.FFI.withPtr false ---> PangoLayoutClass.FFI.fromPtr true) copy_ self
    fun getAlignment self = (PangoLayoutClass.FFI.withPtr false ---> PangoAlignment.FFI.fromVal) getAlignment_ self
    fun getAttributes self = (PangoLayoutClass.FFI.withPtr false ---> PangoAttrListRecord.FFI.fromPtr false) getAttributes_ self before PangoLayoutClass.FFI.touchPtr self
    fun getAutoDir self = (PangoLayoutClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAutoDir_ self
    fun getBaseline self = (PangoLayoutClass.FFI.withPtr false ---> GInt.FFI.fromVal) getBaseline_ self
    fun getCharacterCount self = (PangoLayoutClass.FFI.withPtr false ---> GInt.FFI.fromVal) getCharacterCount_ self
    fun getContext self = (PangoLayoutClass.FFI.withPtr false ---> PangoContextClass.FFI.fromPtr false) getContext_ self before PangoLayoutClass.FFI.touchPtr self
    fun getCursorPos self index =
      let
        val strongPos
         & weakPos
         & () =
          (
            PangoLayoutClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
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
    fun getEllipsize self = (PangoLayoutClass.FFI.withPtr false ---> PangoEllipsizeMode.FFI.fromVal) getEllipsize_ self
    fun getExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutClass.FFI.withPtr false
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
    fun getFontDescription self = (PangoLayoutClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromOptPtr false) getFontDescription_ self before PangoLayoutClass.FFI.touchPtr self
    fun getHeight self = (PangoLayoutClass.FFI.withPtr false ---> GInt.FFI.fromVal) getHeight_ self
    fun getIndent self = (PangoLayoutClass.FFI.withPtr false ---> GInt.FFI.fromVal) getIndent_ self
    fun getIter self = (PangoLayoutClass.FFI.withPtr false ---> PangoLayoutIterRecord.FFI.fromPtr true) getIter_ self
    fun getJustify self = (PangoLayoutClass.FFI.withPtr false ---> GBool.FFI.fromVal) getJustify_ self
    fun getLine self line = (PangoLayoutClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> PangoLayoutLineRecord.FFI.fromOptPtr false) getLine_ (self & line) before PangoLayoutClass.FFI.touchPtr self
    fun getLineCount self = (PangoLayoutClass.FFI.withPtr false ---> GInt.FFI.fromVal) getLineCount_ self
    fun getLineReadonly self line = (PangoLayoutClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> PangoLayoutLineRecord.FFI.fromOptPtr false) getLineReadonly_ (self & line) before PangoLayoutClass.FFI.touchPtr self
    fun getLogAttrs self =
      let
        val attrs
         & nAttrs
         & () =
          (
            PangoLayoutClass.FFI.withPtr false
             &&&> PangoLogAttrRecordCArrayN.FFI.withRefOptPtr 0
             &&&> GInt.FFI.withRefVal
             ---> PangoLogAttrRecordCArrayN.FFI.fromPtr ~1
                   && GInt.FFI.fromVal
                   && I
          )
            getLogAttrs_
            (
              self
               & NONE
               & GInt.null
            )
      in
        attrs (LargeInt.toInt nAttrs)
      end
    fun getLogAttrsReadonly self =
      let
        val nAttrs & retVal = (PangoLayoutClass.FFI.withPtr false &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && PangoLogAttrRecordCArrayN.FFI.fromPtr 0) getLogAttrsReadonly_ (self & GInt.null)
      in
        retVal (LargeInt.toInt nAttrs) before PangoLayoutClass.FFI.touchPtr self
      end
    fun getPixelExtents self =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoLayoutClass.FFI.withPtr false
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
            PangoLayoutClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPixelSize_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (width, height)
      end
    fun getSerial self = (PangoLayoutClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getSerial_ self
    fun getSingleParagraphMode self = (PangoLayoutClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSingleParagraphMode_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            PangoLayoutClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getSize_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (width, height)
      end
    fun getSpacing self = (PangoLayoutClass.FFI.withPtr false ---> GInt.FFI.fromVal) getSpacing_ self
    fun getTabs self = (PangoLayoutClass.FFI.withPtr false ---> PangoTabArrayRecord.FFI.fromOptPtr true) getTabs_ self
    fun getText self = (PangoLayoutClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getText_ self before PangoLayoutClass.FFI.touchPtr self
    fun getUnknownGlyphsCount self = (PangoLayoutClass.FFI.withPtr false ---> GInt.FFI.fromVal) getUnknownGlyphsCount_ self
    fun getWidth self = (PangoLayoutClass.FFI.withPtr false ---> GInt.FFI.fromVal) getWidth_ self
    fun getWrap self = (PangoLayoutClass.FFI.withPtr false ---> PangoWrapMode.FFI.fromVal) getWrap_ self
    fun indexToLineX self (index, trailing) =
      let
        val line
         & xPos
         & () =
          (
            PangoLayoutClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GBool.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            indexToLineX_
            (
              self
               & index
               & trailing
               & GInt.null
               & GInt.null
            )
      in
        (line, xPos)
      end
    fun indexToPos self index =
      let
        val pos & () =
          (
            PangoLayoutClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
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
    fun isEllipsized self = (PangoLayoutClass.FFI.withPtr false ---> GBool.FFI.fromVal) isEllipsized_ self
    fun isWrapped self = (PangoLayoutClass.FFI.withPtr false ---> GBool.FFI.fromVal) isWrapped_ self
    fun moveCursorVisually
      self
      (
        strong,
        oldIndex,
        oldTrailing,
        direction
      ) =
      let
        val newIndex
         & newTrailing
         & () =
          (
            PangoLayoutClass.FFI.withPtr false
             &&&> GBool.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            moveCursorVisually_
            (
              self
               & strong
               & oldIndex
               & oldTrailing
               & direction
               & GInt.null
               & GInt.null
            )
      in
        (newIndex, newTrailing)
      end
    fun setAlignment self alignment = (PangoLayoutClass.FFI.withPtr false &&&> PangoAlignment.FFI.withVal ---> I) setAlignment_ (self & alignment)
    fun setAttributes self attrs = (PangoLayoutClass.FFI.withPtr false &&&> PangoAttrListRecord.FFI.withOptPtr false ---> I) setAttributes_ (self & attrs)
    fun setAutoDir self autoDir = (PangoLayoutClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAutoDir_ (self & autoDir)
    fun setEllipsize self ellipsize = (PangoLayoutClass.FFI.withPtr false &&&> PangoEllipsizeMode.FFI.withVal ---> I) setEllipsize_ (self & ellipsize)
    fun setFontDescription self desc = (PangoLayoutClass.FFI.withPtr false &&&> PangoFontDescriptionRecord.FFI.withOptPtr false ---> I) setFontDescription_ (self & desc)
    fun setHeight self height = (PangoLayoutClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setHeight_ (self & height)
    fun setIndent self indent = (PangoLayoutClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setIndent_ (self & indent)
    fun setJustify self justify = (PangoLayoutClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setJustify_ (self & justify)
    fun setMarkup self (markup, length) =
      (
        PangoLayoutClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
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
            PangoLayoutClass.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GInt.FFI.withVal
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
    fun setSingleParagraphMode self setting = (PangoLayoutClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSingleParagraphMode_ (self & setting)
    fun setSpacing self spacing = (PangoLayoutClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setSpacing_ (self & spacing)
    fun setTabs self tabs = (PangoLayoutClass.FFI.withPtr false &&&> PangoTabArrayRecord.FFI.withOptPtr false ---> I) setTabs_ (self & tabs)
    fun setText self (text, length) =
      (
        PangoLayoutClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & length
        )
    fun setWidth self width = (PangoLayoutClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setWidth_ (self & width)
    fun setWrap self wrap = (PangoLayoutClass.FFI.withPtr false &&&> PangoWrapMode.FFI.withVal ---> I) setWrap_ (self & wrap)
    fun xyToIndex self (x, y) =
      let
        val index
         & trailing
         & retVal =
          (
            PangoLayoutClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            xyToIndex_
            (
              self
               & x
               & y
               & GInt.null
               & GInt.null
            )
      in
        if retVal then SOME (index, trailing) else NONE
      end
  end
