signature PANGO_LAYOUT =
  sig
    type 'a class
    type 'a context_class
    type layout_iter_t
    type layout_line_t
    type log_attr_record_c_array_n_t
    type rectangle_t
    type alignment_t
    type attr_list_t
    type ellipsize_mode_t
    type font_description_t
    type tab_array_t
    type wrap_mode_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a context_class -> base class
    val contextChanged : 'a class -> unit
    val copy : 'a class -> base class
    val getAlignment : 'a class -> alignment_t
    val getAttributes : 'a class -> attr_list_t
    val getAutoDir : 'a class -> bool
    val getBaseline : 'a class -> LargeInt.int
    val getCharacterCount : 'a class -> LargeInt.int
    val getContext : 'a class -> base context_class
    val getCursorPos :
      'a class
       -> LargeInt.int
       -> rectangle_t * rectangle_t
    val getEllipsize : 'a class -> ellipsize_mode_t
    val getExtents : 'a class -> rectangle_t * rectangle_t
    val getFontDescription : 'a class -> font_description_t option
    val getHeight : 'a class -> LargeInt.int
    val getIndent : 'a class -> LargeInt.int
    val getIter : 'a class -> layout_iter_t
    val getJustify : 'a class -> bool
    val getLine :
      'a class
       -> LargeInt.int
       -> layout_line_t option
    val getLineCount : 'a class -> LargeInt.int
    val getLineReadonly :
      'a class
       -> LargeInt.int
       -> layout_line_t option
    val getLogAttrs : 'a class -> log_attr_record_c_array_n_t
    val getLogAttrsReadonly : 'a class -> log_attr_record_c_array_n_t
    val getPixelExtents : 'a class -> rectangle_t * rectangle_t
    val getPixelSize : 'a class -> LargeInt.int * LargeInt.int
    val getSerial : 'a class -> LargeInt.int
    val getSingleParagraphMode : 'a class -> bool
    val getSize : 'a class -> LargeInt.int * LargeInt.int
    val getSpacing : 'a class -> LargeInt.int
    val getTabs : 'a class -> tab_array_t option
    val getText : 'a class -> string
    val getUnknownGlyphsCount : 'a class -> LargeInt.int
    val getWidth : 'a class -> LargeInt.int
    val getWrap : 'a class -> wrap_mode_t
    val indexToLineX :
      'a class
       -> LargeInt.int * bool
       -> LargeInt.int * LargeInt.int
    val indexToPos :
      'a class
       -> LargeInt.int
       -> rectangle_t
    val isEllipsized : 'a class -> bool
    val isWrapped : 'a class -> bool
    val moveCursorVisually :
      'a class
       -> bool
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val setAlignment :
      'a class
       -> alignment_t
       -> unit
    val setAttributes :
      'a class
       -> attr_list_t option
       -> unit
    val setAutoDir :
      'a class
       -> bool
       -> unit
    val setEllipsize :
      'a class
       -> ellipsize_mode_t
       -> unit
    val setFontDescription :
      'a class
       -> font_description_t option
       -> unit
    val setHeight :
      'a class
       -> LargeInt.int
       -> unit
    val setIndent :
      'a class
       -> LargeInt.int
       -> unit
    val setJustify :
      'a class
       -> bool
       -> unit
    val setMarkup :
      'a class
       -> string * LargeInt.int
       -> unit
    val setMarkupWithAccel :
      'a class
       -> string
           * LargeInt.int
           * char
       -> char
    val setSingleParagraphMode :
      'a class
       -> bool
       -> unit
    val setSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val setTabs :
      'a class
       -> tab_array_t option
       -> unit
    val setText :
      'a class
       -> string * LargeInt.int
       -> unit
    val setWidth :
      'a class
       -> LargeInt.int
       -> unit
    val setWrap :
      'a class
       -> wrap_mode_t
       -> unit
    val xyToIndex :
      'a class
       -> LargeInt.int * LargeInt.int
       -> (LargeInt.int * LargeInt.int) option
  end
