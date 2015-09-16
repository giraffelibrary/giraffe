structure PangoLayout :>
  PANGO_LAYOUT
    where type 'a class_t = 'a PangoLayoutClass.t
    where type attr_list_record_t = PangoAttrListRecord.t
    where type 'a context_class_t = 'a PangoContextClass.t
    where type layout_iter_record_t = PangoLayoutIterRecord.t
    where type layout_line_record_t = PangoLayoutLineRecord.t
    where type rectangle_record_t = PangoRectangleRecord.t
    where type alignment_t = PangoAlignment.t
    where type ellipsize_mode_t = PangoEllipsizeMode.t
    where type font_description_record_t = PangoFontDescriptionRecord.t
    where type tab_array_record_t = PangoTabArrayRecord.t
    where type wrap_mode_t = PangoWrapMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_layout_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libpango "pango_layout_new") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val contextChanged_ = call (load_sym libpango "pango_layout_context_changed") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val copy_ = call (load_sym libpango "pango_layout_copy") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getAlignment_ = call (load_sym libpango "pango_layout_get_alignment") (GObjectObjectClass.PolyML.PTR --> PangoAlignment.PolyML.VAL)
      val getAttributes_ = call (load_sym libpango "pango_layout_get_attributes") (GObjectObjectClass.PolyML.PTR --> PangoAttrListRecord.PolyML.PTR)
      val getAutoDir_ = call (load_sym libpango "pango_layout_get_auto_dir") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getBaseline_ = call (load_sym libpango "pango_layout_get_baseline") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getCharacterCount_ = call (load_sym libpango "pango_layout_get_character_count") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getContext_ = call (load_sym libpango "pango_layout_get_context") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getCursorPos_ =
        call (load_sym libpango "pango_layout_get_cursor_pos")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> PangoRectangleRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getEllipsize_ = call (load_sym libpango "pango_layout_get_ellipsize") (GObjectObjectClass.PolyML.PTR --> PangoEllipsizeMode.PolyML.VAL)
      val getExtents_ =
        call (load_sym libpango "pango_layout_get_extents")
          (
            GObjectObjectClass.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getFontDescription_ = call (load_sym libpango "pango_layout_get_font_description") (GObjectObjectClass.PolyML.PTR --> PangoFontDescriptionRecord.PolyML.PTR)
      val getHeight_ = call (load_sym libpango "pango_layout_get_height") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getIndent_ = call (load_sym libpango "pango_layout_get_indent") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getIter_ = call (load_sym libpango "pango_layout_get_iter") (GObjectObjectClass.PolyML.PTR --> PangoLayoutIterRecord.PolyML.PTR)
      val getJustify_ = call (load_sym libpango "pango_layout_get_justify") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getLine_ = call (load_sym libpango "pango_layout_get_line") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> PangoLayoutLineRecord.PolyML.PTR)
      val getLineCount_ = call (load_sym libpango "pango_layout_get_line_count") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getLineReadonly_ = call (load_sym libpango "pango_layout_get_line_readonly") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> PangoLayoutLineRecord.PolyML.PTR)
      val getPixelExtents_ =
        call (load_sym libpango "pango_layout_get_pixel_extents")
          (
            GObjectObjectClass.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             &&> PangoRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getPixelSize_ =
        call (load_sym libpango "pango_layout_get_pixel_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getSingleParagraphMode_ = call (load_sym libpango "pango_layout_get_single_paragraph_mode") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getSize_ =
        call (load_sym libpango "pango_layout_get_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getSpacing_ = call (load_sym libpango "pango_layout_get_spacing") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getTabs_ = call (load_sym libpango "pango_layout_get_tabs") (GObjectObjectClass.PolyML.PTR --> PangoTabArrayRecord.PolyML.PTR)
      val getText_ = call (load_sym libpango "pango_layout_get_text") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getUnknownGlyphsCount_ = call (load_sym libpango "pango_layout_get_unknown_glyphs_count") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getWidth_ = call (load_sym libpango "pango_layout_get_width") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getWrap_ = call (load_sym libpango "pango_layout_get_wrap") (GObjectObjectClass.PolyML.PTR --> PangoWrapMode.PolyML.VAL)
      val indexToLineX_ =
        call (load_sym libpango "pango_layout_index_to_line_x")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val indexToPos_ =
        call (load_sym libpango "pango_layout_index_to_pos")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> PangoRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val isEllipsized_ = call (load_sym libpango "pango_layout_is_ellipsized") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isWrapped_ = call (load_sym libpango "pango_layout_is_wrapped") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setAlignment_ = call (load_sym libpango "pango_layout_set_alignment") (GObjectObjectClass.PolyML.PTR &&> PangoAlignment.PolyML.VAL --> FFI.PolyML.VOID)
      val setAutoDir_ = call (load_sym libpango "pango_layout_set_auto_dir") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setEllipsize_ = call (load_sym libpango "pango_layout_set_ellipsize") (GObjectObjectClass.PolyML.PTR &&> PangoEllipsizeMode.PolyML.VAL --> FFI.PolyML.VOID)
      val setFontDescription_ = call (load_sym libpango "pango_layout_set_font_description") (GObjectObjectClass.PolyML.PTR &&> PangoFontDescriptionRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setHeight_ = call (load_sym libpango "pango_layout_set_height") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setIndent_ = call (load_sym libpango "pango_layout_set_indent") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setJustify_ = call (load_sym libpango "pango_layout_set_justify") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setMarkup_ =
        call (load_sym libpango "pango_layout_set_markup")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setMarkupWithAccel_ =
        call (load_sym libpango "pango_layout_set_markup_with_accel")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Char.PolyML.VAL
             &&> FFI.Char.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val setSingleParagraphMode_ = call (load_sym libpango "pango_layout_set_single_paragraph_mode") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setSpacing_ = call (load_sym libpango "pango_layout_set_spacing") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setTabs_ = call (load_sym libpango "pango_layout_set_tabs") (GObjectObjectClass.PolyML.PTR &&> PangoTabArrayRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setText_ =
        call (load_sym libpango "pango_layout_set_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setWidth_ = call (load_sym libpango "pango_layout_set_width") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setWrap_ = call (load_sym libpango "pango_layout_set_wrap") (GObjectObjectClass.PolyML.PTR &&> PangoWrapMode.PolyML.VAL --> FFI.PolyML.VOID)
      val xyToIndex_ =
        call (load_sym libpango "pango_layout_xy_to_index")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a PangoLayoutClass.t
    type attr_list_record_t = PangoAttrListRecord.t
    type 'a context_class_t = 'a PangoContextClass.t
    type layout_iter_record_t = PangoLayoutIterRecord.t
    type layout_line_record_t = PangoLayoutLineRecord.t
    type rectangle_record_t = PangoRectangleRecord.t
    type alignment_t = PangoAlignment.t
    type ellipsize_mode_t = PangoEllipsizeMode.t
    type font_description_record_t = PangoFontDescriptionRecord.t
    type tab_array_record_t = PangoTabArrayRecord.t
    type wrap_mode_t = PangoWrapMode.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new context = (GObjectObjectClass.C.withPtr ---> PangoLayoutClass.C.fromPtr true) new_ context
    fun contextChanged self = (GObjectObjectClass.C.withPtr ---> I) contextChanged_ self
    fun copy self = (GObjectObjectClass.C.withPtr ---> PangoLayoutClass.C.fromPtr true) copy_ self
    fun getAlignment self = (GObjectObjectClass.C.withPtr ---> PangoAlignment.C.fromVal) getAlignment_ self
    fun getAttributes self = (GObjectObjectClass.C.withPtr ---> PangoAttrListRecord.C.fromPtr true) getAttributes_ self
    fun getAutoDir self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAutoDir_ self
    fun getBaseline self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getBaseline_ self
    fun getCharacterCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getCharacterCount_ self
    fun getContext self = (GObjectObjectClass.C.withPtr ---> PangoContextClass.C.fromPtr false) getContext_ self
    fun getCursorPos self index =
      let
        val strongPos
         & weakPos
         & () =
          (
            GObjectObjectClass.C.withPtr
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
    fun getHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getHeight_ self
    fun getIndent self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getIndent_ self
    fun getIter self = (GObjectObjectClass.C.withPtr ---> PangoLayoutIterRecord.C.fromPtr true) getIter_ self
    fun getJustify self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getJustify_ self
    fun getLine self line = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> PangoLayoutLineRecord.C.fromPtr false) getLine_ (self & line)
    fun getLineCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getLineCount_ self
    fun getLineReadonly self line = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> PangoLayoutLineRecord.C.fromPtr false) getLineReadonly_ (self & line)
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
    fun getSingleParagraphMode self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSingleParagraphMode_ self
    fun getSize self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
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
    fun getSpacing self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getSpacing_ self
    fun getTabs self = (GObjectObjectClass.C.withPtr ---> PangoTabArrayRecord.C.fromPtr true) getTabs_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getText_ self
    fun getUnknownGlyphsCount self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getUnknownGlyphsCount_ self
    fun getWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getWidth_ self
    fun getWrap self = (GObjectObjectClass.C.withPtr ---> PangoWrapMode.C.fromVal) getWrap_ self
    fun indexToLineX self index trailing =
      let
        val line
         & xPos
         & () =
          (
            GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
    fun isEllipsized self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isEllipsized_ self
    fun isWrapped self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isWrapped_ self
    fun setAlignment self alignment = (GObjectObjectClass.C.withPtr &&&> PangoAlignment.C.withVal ---> I) setAlignment_ (self & alignment)
    fun setAutoDir self autoDir = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAutoDir_ (self & autoDir)
    fun setEllipsize self ellipsize = (GObjectObjectClass.C.withPtr &&&> PangoEllipsizeMode.C.withVal ---> I) setEllipsize_ (self & ellipsize)
    fun setFontDescription self desc = (GObjectObjectClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) setFontDescription_ (self & desc)
    fun setHeight self height = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setHeight_ (self & height)
    fun setIndent self indent = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setIndent_ (self & indent)
    fun setJustify self justify = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setJustify_ (self & justify)
    fun setMarkup self markup length =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.String.C.withConstPtr
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
    fun setSingleParagraphMode self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSingleParagraphMode_ (self & setting)
    fun setSpacing self spacing = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSpacing_ (self & spacing)
    fun setTabs self tabs = (GObjectObjectClass.C.withPtr &&&> PangoTabArrayRecord.C.withOptPtr ---> I) setTabs_ (self & tabs)
    fun setText self text length =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setText_
        (
          self
           & text
           & length
        )
    fun setWidth self width = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setWidth_ (self & width)
    fun setWrap self wrap = (GObjectObjectClass.C.withPtr &&&> PangoWrapMode.C.withVal ---> I) setWrap_ (self & wrap)
    fun xyToIndex self x y =
      let
        val index
         & trailing
         & retVal =
          (
            GObjectObjectClass.C.withPtr
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
