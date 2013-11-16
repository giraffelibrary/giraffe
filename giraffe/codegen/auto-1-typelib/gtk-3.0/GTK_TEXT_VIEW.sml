signature GTK_TEXT_VIEW =
  sig
    type 'a class_t
    type wrapmode_t
    type justification_t
    type 'a textbufferclass_t
    type 'a menuclass_t
    type scrollstep_t
    type movementstep_t
    type deletetype_t
    type textwindowtype_t
    type textiterrecord_t
    type 'a textmarkclass_t
    type 'a widgetclass_t
    type textattributesrecord_t
    type 'a textchildanchorclass_t
    type 'a scrollableclass_t
    type 'a buildableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asScrollable : 'a class_t -> base scrollableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithBuffer : 'a textbufferclass_t -> base class_t
    val addChildAtAnchor :
      'a class_t
       -> 'b widgetclass_t
       -> 'c textchildanchorclass_t
       -> unit
    val addChildInWindow :
      'a class_t
       -> 'b widgetclass_t
       -> textwindowtype_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val backwardDisplayLine :
      'a class_t
       -> textiterrecord_t
       -> bool
    val backwardDisplayLineStart :
      'a class_t
       -> textiterrecord_t
       -> bool
    val bufferToWindowCoords :
      'a class_t
       -> textwindowtype_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val forwardDisplayLine :
      'a class_t
       -> textiterrecord_t
       -> bool
    val forwardDisplayLineEnd :
      'a class_t
       -> textiterrecord_t
       -> bool
    val getAcceptsTab : 'a class_t -> bool
    val getBorderWindowSize :
      'a class_t
       -> textwindowtype_t
       -> LargeInt.int
    val getBuffer : 'a class_t -> base textbufferclass_t
    val getCursorLocations :
      'a class_t
       -> textiterrecord_t option
       -> Cairo.RectangleIntRecord.t * Cairo.RectangleIntRecord.t
    val getCursorVisible : 'a class_t -> bool
    val getDefaultAttributes : 'a class_t -> textattributesrecord_t
    val getEditable : 'a class_t -> bool
    val getIndent : 'a class_t -> LargeInt.int
    val getIterAtLocation :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> textiterrecord_t
    val getIterAtPosition :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> textiterrecord_t * LargeInt.int
    val getIterLocation :
      'a class_t
       -> textiterrecord_t
       -> Cairo.RectangleIntRecord.t
    val getJustification : 'a class_t -> justification_t
    val getLeftMargin : 'a class_t -> LargeInt.int
    val getLineAtY :
      'a class_t
       -> LargeInt.int
       -> textiterrecord_t * LargeInt.int
    val getLineYrange :
      'a class_t
       -> textiterrecord_t
       -> LargeInt.int * LargeInt.int
    val getOverwrite : 'a class_t -> bool
    val getPixelsAboveLines : 'a class_t -> LargeInt.int
    val getPixelsBelowLines : 'a class_t -> LargeInt.int
    val getPixelsInsideWrap : 'a class_t -> LargeInt.int
    val getRightMargin : 'a class_t -> LargeInt.int
    val getTabs : 'a class_t -> Pango.TabArrayRecord.t
    val getVisibleRect : 'a class_t -> Cairo.RectangleIntRecord.t
    val getWindow :
      'a class_t
       -> textwindowtype_t
       -> base Gdk.WindowClass.t
    val getWindowType :
      'a class_t
       -> 'b Gdk.WindowClass.t
       -> textwindowtype_t
    val getWrapMode : 'a class_t -> wrapmode_t
    val imContextFilterKeypress :
      'a class_t
       -> Gdk.EventKeyRecord.t
       -> bool
    val moveChild :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val moveMarkOnscreen :
      'a class_t
       -> 'b textmarkclass_t
       -> bool
    val moveVisually :
      'a class_t
       -> textiterrecord_t
       -> LargeInt.int
       -> bool
    val placeCursorOnscreen : 'a class_t -> bool
    val resetImContext : 'a class_t -> unit
    val scrollMarkOnscreen :
      'a class_t
       -> 'b textmarkclass_t
       -> unit
    val scrollToIter :
      'a class_t
       -> textiterrecord_t
       -> real
       -> bool
       -> real
       -> real
       -> bool
    val scrollToMark :
      'a class_t
       -> 'b textmarkclass_t
       -> real
       -> bool
       -> real
       -> real
       -> unit
    val setAcceptsTab :
      'a class_t
       -> bool
       -> unit
    val setBorderWindowSize :
      'a class_t
       -> textwindowtype_t
       -> LargeInt.int
       -> unit
    val setBuffer :
      'a class_t
       -> 'b textbufferclass_t option
       -> unit
    val setCursorVisible :
      'a class_t
       -> bool
       -> unit
    val setEditable :
      'a class_t
       -> bool
       -> unit
    val setIndent :
      'a class_t
       -> LargeInt.int
       -> unit
    val setJustification :
      'a class_t
       -> justification_t
       -> unit
    val setLeftMargin :
      'a class_t
       -> LargeInt.int
       -> unit
    val setOverwrite :
      'a class_t
       -> bool
       -> unit
    val setPixelsAboveLines :
      'a class_t
       -> LargeInt.int
       -> unit
    val setPixelsBelowLines :
      'a class_t
       -> LargeInt.int
       -> unit
    val setPixelsInsideWrap :
      'a class_t
       -> LargeInt.int
       -> unit
    val setRightMargin :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTabs :
      'a class_t
       -> Pango.TabArrayRecord.t
       -> unit
    val setWrapMode :
      'a class_t
       -> wrapmode_t
       -> unit
    val startsDisplayLine :
      'a class_t
       -> textiterrecord_t
       -> bool
    val windowToBufferCoords :
      'a class_t
       -> textwindowtype_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val backspaceSig : (unit -> unit) -> 'a class_t Signal.signal
    val copyClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val cutClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val deleteFromCursorSig :
      (deletetype_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val insertAtCursorSig : (string -> unit) -> 'a class_t Signal.signal
    val moveCursorSig :
      (movementstep_t
        -> LargeInt.int
        -> bool
        -> unit)
       -> 'a class_t Signal.signal
    val moveViewportSig :
      (scrollstep_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val pasteClipboardSig : (unit -> unit) -> 'a class_t Signal.signal
    val populatePopupSig : (base menuclass_t -> unit) -> 'a class_t Signal.signal
    val preeditChangedSig : (string -> unit) -> 'a class_t Signal.signal
    val selectAllSig : (bool -> unit) -> 'a class_t Signal.signal
    val setAnchorSig : (unit -> unit) -> 'a class_t Signal.signal
    val toggleCursorVisibleSig : (unit -> unit) -> 'a class_t Signal.signal
    val toggleOverwriteSig : (unit -> unit) -> 'a class_t Signal.signal
    val acceptsTabProp : ('a class_t, bool, bool) Property.readwrite
    val bufferProp : ('a class_t, base textbufferclass_t option, 'b textbufferclass_t option) Property.readwrite
    val cursorVisibleProp : ('a class_t, bool, bool) Property.readwrite
    val editableProp : ('a class_t, bool, bool) Property.readwrite
    val imModuleProp : ('a class_t, string option, string option) Property.readwrite
    val indentProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val justificationProp : ('a class_t, justification_t, justification_t) Property.readwrite
    val leftMarginProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val overwriteProp : ('a class_t, bool, bool) Property.readwrite
    val pixelsAboveLinesProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val pixelsBelowLinesProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val pixelsInsideWrapProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val rightMarginProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val tabsProp : ('a class_t, Pango.TabArrayRecord.t option, Pango.TabArrayRecord.t option) Property.readwrite
    val wrapModeProp : ('a class_t, wrapmode_t, wrapmode_t) Property.readwrite
  end
