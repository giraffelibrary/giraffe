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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_layout_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libpango "pango_layout_new") (PangoContextClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val contextChanged_ = call (load_sym libpango "pango_layout_context_changed") (PangoLayoutClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val copy_ = call (load_sym libpango "pango_layout_copy") (PangoLayoutClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getAlignment_ = call (load_sym libpango "pango_layout_get_alignment") (PangoLayoutClass.PolyML.cPtr --> PangoAlignment.PolyML.cVal)
      val getAttributes_ = call (load_sym libpango "pango_layout_get_attributes") (PangoLayoutClass.PolyML.cPtr --> PangoAttrListRecord.PolyML.cPtr)
      val getAutoDir_ = call (load_sym libpango "pango_layout_get_auto_dir") (PangoLayoutClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getBaseline_ = call (load_sym libpango "pango_layout_get_baseline") (PangoLayoutClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getCharacterCount_ = call (load_sym libpango "pango_layout_get_character_count") (PangoLayoutClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getContext_ = call (load_sym libpango "pango_layout_get_context") (PangoLayoutClass.PolyML.cPtr --> PangoContextClass.PolyML.cPtr)
      val getCursorPos_ =
        call (load_sym libpango "pango_layout_get_cursor_pos")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getEllipsize_ = call (load_sym libpango "pango_layout_get_ellipsize") (PangoLayoutClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getExtents_ =
        call (load_sym libpango "pango_layout_get_extents")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getFontDescription_ = call (load_sym libpango "pango_layout_get_font_description") (PangoLayoutClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getHeight_ = call (load_sym libpango "pango_layout_get_height") (PangoLayoutClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getIndent_ = call (load_sym libpango "pango_layout_get_indent") (PangoLayoutClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getIter_ = call (load_sym libpango "pango_layout_get_iter") (PangoLayoutClass.PolyML.cPtr --> PangoLayoutIterRecord.PolyML.cPtr)
      val getJustify_ = call (load_sym libpango "pango_layout_get_justify") (PangoLayoutClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getLine_ = call (load_sym libpango "pango_layout_get_line") (PangoLayoutClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PangoLayoutLineRecord.PolyML.cPtr)
      val getLineCount_ = call (load_sym libpango "pango_layout_get_line_count") (PangoLayoutClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getLineReadonly_ = call (load_sym libpango "pango_layout_get_line_readonly") (PangoLayoutClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PangoLayoutLineRecord.PolyML.cPtr)
      val getPixelExtents_ =
        call (load_sym libpango "pango_layout_get_pixel_extents")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getPixelSize_ =
        call (load_sym libpango "pango_layout_get_pixel_size")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getSingleParagraphMode_ = call (load_sym libpango "pango_layout_get_single_paragraph_mode") (PangoLayoutClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getSize_ =
        call (load_sym libpango "pango_layout_get_size")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getSpacing_ = call (load_sym libpango "pango_layout_get_spacing") (PangoLayoutClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getTabs_ = call (load_sym libpango "pango_layout_get_tabs") (PangoLayoutClass.PolyML.cPtr --> PangoTabArrayRecord.PolyML.cPtr)
      val getText_ = call (load_sym libpango "pango_layout_get_text") (PangoLayoutClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUnknownGlyphsCount_ = call (load_sym libpango "pango_layout_get_unknown_glyphs_count") (PangoLayoutClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getWidth_ = call (load_sym libpango "pango_layout_get_width") (PangoLayoutClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getWrap_ = call (load_sym libpango "pango_layout_get_wrap") (PangoLayoutClass.PolyML.cPtr --> PangoWrapMode.PolyML.cVal)
      val indexToLineX_ =
        call (load_sym libpango "pango_layout_index_to_line_x")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val indexToPos_ =
        call (load_sym libpango "pango_layout_index_to_pos")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> PangoRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val isEllipsized_ = call (load_sym libpango "pango_layout_is_ellipsized") (PangoLayoutClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isWrapped_ = call (load_sym libpango "pango_layout_is_wrapped") (PangoLayoutClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setAlignment_ = call (load_sym libpango "pango_layout_set_alignment") (PangoLayoutClass.PolyML.cPtr &&> PangoAlignment.PolyML.cVal --> PolyMLFFI.cVoid)
      val setAutoDir_ = call (load_sym libpango "pango_layout_set_auto_dir") (PangoLayoutClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setEllipsize_ = call (load_sym libpango "pango_layout_set_ellipsize") (PangoLayoutClass.PolyML.cPtr &&> PangoEllipsizeMode.PolyML.cVal --> PolyMLFFI.cVoid)
      val setFontDescription_ = call (load_sym libpango "pango_layout_set_font_description") (PangoLayoutClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setHeight_ = call (load_sym libpango "pango_layout_set_height") (PangoLayoutClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setIndent_ = call (load_sym libpango "pango_layout_set_indent") (PangoLayoutClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setJustify_ = call (load_sym libpango "pango_layout_set_justify") (PangoLayoutClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setMarkup_ =
        call (load_sym libpango "pango_layout_set_markup")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setMarkupWithAccel_ =
        call (load_sym libpango "pango_layout_set_markup_with_accel")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Char.PolyML.cVal
             &&> FFI.Char.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val setSingleParagraphMode_ = call (load_sym libpango "pango_layout_set_single_paragraph_mode") (PangoLayoutClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSpacing_ = call (load_sym libpango "pango_layout_set_spacing") (PangoLayoutClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTabs_ = call (load_sym libpango "pango_layout_set_tabs") (PangoLayoutClass.PolyML.cPtr &&> PangoTabArrayRecord.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setText_ =
        call (load_sym libpango "pango_layout_set_text")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setWidth_ = call (load_sym libpango "pango_layout_set_width") (PangoLayoutClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setWrap_ = call (load_sym libpango "pango_layout_set_wrap") (PangoLayoutClass.PolyML.cPtr &&> PangoWrapMode.PolyML.cVal --> PolyMLFFI.cVoid)
      val xyToIndex_ =
        call (load_sym libpango "pango_layout_xy_to_index")
          (
            PangoLayoutClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
    end
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
