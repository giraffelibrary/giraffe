signature PANGO_LAYOUT =
  sig
    type 'a class_t
    type wrapmode_t
    type tabarrayrecord_t
    type fontdescriptionrecord_t
    type ellipsizemode_t
    type alignment_t
    type rectanglerecord_t
    type layoutlinerecord_t
    type layoutiterrecord_t
    type 'a contextclass_t
    type attrlistrecord_t
    val getType : unit -> GObject.Type.t
    val new : 'a contextclass_t -> base class_t
    val contextChanged : 'a class_t -> unit
    val copy : 'a class_t -> base class_t
    val getAlignment : 'a class_t -> alignment_t
    val getAttributes : 'a class_t -> attrlistrecord_t
    val getAutoDir : 'a class_t -> bool
    val getBaseline : 'a class_t -> LargeInt.int
    val getCharacterCount : 'a class_t -> LargeInt.int
    val getContext : 'a class_t -> base contextclass_t
    val getCursorPos :
      'a class_t
       -> LargeInt.int
       -> rectanglerecord_t * rectanglerecord_t
    val getEllipsize : 'a class_t -> ellipsizemode_t
    val getExtents : 'a class_t -> rectanglerecord_t * rectanglerecord_t
    val getFontDescription : 'a class_t -> fontdescriptionrecord_t
    val getHeight : 'a class_t -> LargeInt.int
    val getIndent : 'a class_t -> LargeInt.int
    val getIter : 'a class_t -> layoutiterrecord_t
    val getJustify : 'a class_t -> bool
    val getLine :
      'a class_t
       -> LargeInt.int
       -> layoutlinerecord_t
    val getLineCount : 'a class_t -> LargeInt.int
    val getLineReadonly :
      'a class_t
       -> LargeInt.int
       -> layoutlinerecord_t
    val getPixelExtents : 'a class_t -> rectanglerecord_t * rectanglerecord_t
    val getPixelSize : 'a class_t -> LargeInt.int * LargeInt.int
    val getSingleParagraphMode : 'a class_t -> bool
    val getSize : 'a class_t -> LargeInt.int * LargeInt.int
    val getSpacing : 'a class_t -> LargeInt.int
    val getTabs : 'a class_t -> tabarrayrecord_t
    val getText : 'a class_t -> string
    val getUnknownGlyphsCount : 'a class_t -> LargeInt.int
    val getWidth : 'a class_t -> LargeInt.int
    val getWrap : 'a class_t -> wrapmode_t
    val indexToLineX :
      'a class_t
       -> LargeInt.int
       -> bool
       -> LargeInt.int * LargeInt.int
    val indexToPos :
      'a class_t
       -> LargeInt.int
       -> rectanglerecord_t
    val isEllipsized : 'a class_t -> bool
    val isWrapped : 'a class_t -> bool
    val setAlignment :
      'a class_t
       -> alignment_t
       -> unit
    val setAutoDir :
      'a class_t
       -> bool
       -> unit
    val setEllipsize :
      'a class_t
       -> ellipsizemode_t
       -> unit
    val setFontDescription :
      'a class_t
       -> fontdescriptionrecord_t option
       -> unit
    val setHeight :
      'a class_t
       -> LargeInt.int
       -> unit
    val setIndent :
      'a class_t
       -> LargeInt.int
       -> unit
    val setJustify :
      'a class_t
       -> bool
       -> unit
    val setMarkup :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val setMarkupWithAccel :
      'a class_t
       -> string
       -> LargeInt.int
       -> char
       -> char
    val setSingleParagraphMode :
      'a class_t
       -> bool
       -> unit
    val setSpacing :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTabs :
      'a class_t
       -> tabarrayrecord_t option
       -> unit
    val setText :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val setWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val setWrap :
      'a class_t
       -> wrapmode_t
       -> unit
    val xyToIndex :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> (LargeInt.int * LargeInt.int) option
  end
